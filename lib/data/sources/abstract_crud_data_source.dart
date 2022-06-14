import 'package:firebase_auth/firebase_auth.dart';

// class StreamSnapshot<T> {
//   final bool hasError;
//   final ConnectionState connectionState;
//   final T data;

//   StreamSnapshot({
//     required this.hasError,
//     required this.connectionState,
//     required this.data,
//   });
// }

/// Define CRUD methods to be implemented
abstract class AbstractCRUDDataSource<R, P> {
  Future<void> create(User user);
  Future<R> retrieve(User user);
  Future<void> update(User user);
  Future<void> delete(User user);
  Stream<R> snapshot(User user, P data);
}
