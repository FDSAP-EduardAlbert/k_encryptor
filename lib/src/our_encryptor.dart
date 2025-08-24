import 'package:encrypt/encrypt.dart' as Keys;
var key = Keys.Key.fromUtf8("12345678901234567890123456789012");
var iv = Keys.IV.fromUtf8("12345678");

// final key = Keys.Key.fromLength(32);
// final iv = Keys.IV.fromLength(8);
class OurEncryptor{


  static String salsa20(String plainText) {

    final encrypter = Keys.Encrypter(Keys.Salsa20(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final encryptedPassword = encrypted.base64;

    return encryptedPassword;
  }

  static String salsa20Decrypt(String encrypted) {

    final decrypter = Keys.Encrypter(Keys.Salsa20(key));
    final decrypted = decrypter.decrypt(Keys.Encrypted.fromBase64(encrypted), iv: iv);

    return decrypted;
  }

}