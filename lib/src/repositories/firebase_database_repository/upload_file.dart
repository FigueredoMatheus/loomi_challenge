part of 'firebase_database_repository.dart';

Future<Map<String, dynamic>> implUploadFile({
  required String userId,
  required String filePath,
}) async {
  final fileName = basename(filePath);
  final destination = 'user-profile/$userId/$fileName';

  if (filePath.isEmpty) return {'success': false};

  final task = _uploadFile(File(filePath), destination);

  if (task == null)
    return {'success': false, 'message': 'Fail on upload user profile image'};

  try {
    final snapshot = await task.whenComplete(() => {});

    final filePath = await snapshot.ref.getDownloadURL();

    return {'success': true, 'file_url': filePath};
  } on FirebaseException catch (e) {
    return {'success': false, 'message': e.code};
  }
}

UploadTask? _uploadFile(File file, String destination) {
  try {
    final ref = FirebaseStorage.instance.ref(destination);

    return ref.putFile(file);
  } on FirebaseException catch (_) {
    return null;
  }
}
