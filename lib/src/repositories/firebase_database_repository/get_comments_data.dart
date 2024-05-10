part of 'firebase_database_repository.dart';

Future<Map<String, dynamic>> implGetMovieCommentsData(int movieId) async {
  try {
    final getResponse = await FirebaseFirestore.instance
        .collection('movies')
        .doc('$movieId')
        .collection('comments')
        .get();

    final docs = getResponse.docs;
    final commentsData = docs.map((element) => element).toList();

    return {'success': true, 'comments': commentsData};
  } on FirebaseException catch (_) {
    return {
      'success': false,
      'message': 'Fail on get comments data',
    };
  }
}
