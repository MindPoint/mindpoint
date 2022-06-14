import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/data/sources/abstract_auth_data_source.dart';
import 'package:mindpoint/data/sources/remotes/fireabase_auth_data_source.dart';
import 'package:mindpoint/data/sources/remotes/fireabase_firestore_pages_data_source.dart';
import 'package:mindpoint/data/sources/remotes/fireabase_firestore_thoughts_data_source.dart';
import 'package:mindpoint/data/view/timeline_view_model.dart';
import 'package:mindpoint/data/view/user_view_model.dart';

/// INSTANCE PROVIDERS
final firebaseAuthInstanceProvider =
    Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final firebaseFireStoreInstanceProvider =
    Provider<FirebaseFirestore>((_) => FirebaseFirestore.instance);

/// DATA SOURCE PROVIDERS
final fireabaseAuthRemoteDataSourceProvider = Provider<AbstractAuthDataSource>(
  (ref) => FirebaseAuthRemoteDataSource(
    ref.read(firebaseAuthInstanceProvider),
  ),
);

final firestorePagesSourceProvider = Provider(
  (ref) => FirestorePagesSource(
    ref.read(firebaseFireStoreInstanceProvider),
  ),
);

final firestoreThoughtsSourceProvider = Provider(
  (ref) => FirestoreThoughtsSource(
    ref.read(firebaseFireStoreInstanceProvider),
  ),
);

/// VIEW MODEL PROVIDERS
final userViewModelProvider = ChangeNotifierProvider<UserViewModel>(
  (ref) => UserViewModel(
    fireBaseAuthDataSource: ref.read(fireabaseAuthRemoteDataSourceProvider),
  ),
);

final timelineViewModelProvider =
    ChangeNotifierProvider.autoDispose<TimelineViewModel>(
  (ref) {
    final authDataSource = ref.watch(fireabaseAuthRemoteDataSourceProvider);

    final pagesDataSource = ref.read(firestorePagesSourceProvider);
    final thoughtsDataSource = ref.read(firestoreThoughtsSourceProvider);

    return TimelineViewModel(
      authDataSource,
      pagesDataSource,
      thoughtsDataSource,
    );
  },
);
