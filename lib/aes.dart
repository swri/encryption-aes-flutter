import 'package:encrypt/encrypt.dart';

class AESEncryption {
  static final key = Key.fromLength(32);
  static final iv = IV.fromLength(16);

  String crypteFile(String data) {
    final encrypter = Encrypter(AES(key, padding: null));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted.base64;
  }

  String decryptFile(String data) {
    final encrypter = Encrypter(AES(key, padding: null));
    final decrypted = encrypter.decrypt(Encrypted.from64(data), iv: iv);
    return decrypted;
  }
}
