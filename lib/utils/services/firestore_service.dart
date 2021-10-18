import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final users = FirebaseFirestore.instance.collection('users');

  void addUser(String uid) {
    users.doc(uid).set({'favoriteBooks': []});
  }

  Future<List<dynamic>> getUserFavBooks(String uid) async {
    final data = await users.doc(uid).get();
    return data.data()!['favoriteBooks'];
  }

  Future<void> addFavoriteBook(String uid, String bookId) async {
    return await users.doc(uid).update({
      'favoriteBooks': FieldValue.arrayUnion([bookId])
    });
  }

  Future<void> removeFavoriteBook(String uid, String bookId) async {
    return await users.doc(uid).update({
      'favoriteBooks': FieldValue.arrayRemove([bookId])
    });
  }
}
