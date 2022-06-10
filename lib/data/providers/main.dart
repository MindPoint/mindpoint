import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/data/repositories/auth_repository.dart';
import 'package:mindpoint/data/sources/abstract_auth_data_source.dart';
import 'package:mindpoint/data/sources/remotes/fireabase_auth_data_source.dart';
import 'package:mindpoint/data/view/user_view_model.dart';

final firebaseAuthInstanceProvider =
    Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final fireabaseAuthRemoteDataSourceProvider = Provider<AbstractAuthDataSource>(
    (ref) =>
        FirebaseAuthRemoteDataSource(ref.read(firebaseAuthInstanceProvider)));

final authRepositoryProvider = Provider<AbstractAuthRepository>(
    (ref) => AuthRepository(ref.read(fireabaseAuthRemoteDataSourceProvider)));

final userViewModelProvider = Provider<UserViewModel>(
    (ref) => UserViewModel(firebaseAuthProvider: authRepositoryProvider));
