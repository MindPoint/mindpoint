import 'package:firebase_auth/firebase_auth.dart';

import '../sources/abstract_auth_data_source.dart';

abstract class AbstractAuthRepository {
  Future<User?> signIn();
  Future<void> signOut();
}

class AuthRepository extends AbstractAuthRepository {
  final AbstractAuthDataSource _dataSource;

  AuthRepository(this._dataSource);

  // TODO: Guard the futures to always return an object even it throws an error,
  // ref: https://github.com/huskyjp/flutter-mvvp-riverpod-architecture/blob/main/lib/data/model/result.dart
  @override
  Future<User?> signIn() {
    return _dataSource.signIn();
  }

  // TODO: Guard the futures to always return an object even it throws an error,
  // ref: https://github.com/huskyjp/flutter-mvvp-riverpod-architecture/blob/main/lib/data/model/result.dart
  @override
  Future<void> signOut() {
    return _dataSource.signOut();
  }
}
