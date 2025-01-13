import 'dart:math';

String generateRandomStringBasedOnDateTime() {
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  Random random = Random(timestamp);

  const characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  String randomString = List.generate(20, (index) {
    return characters[random.nextInt(characters.length)];
  }).join();

  return randomString;
}
