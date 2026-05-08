import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';

class ExportCryptoException implements Exception {
  final String message;
  const ExportCryptoException(this.message);
  @override
  String toString() => 'ExportCryptoException: $message';
}

class ExportCrypto {
  static const int _saltLength = 32;
  static const int _ivLength = 12;
  static const int _keyLength = 32;
  static const int _pbkdf2Iterations = 100000;
  static const int _tagLength = 16;

  Uint8List encrypt(String plaintext, String password) {
    final salt = _generateRandom(_saltLength);
    final iv = _generateRandom(_ivLength);
    final key = _deriveKey(password, salt);

    final cipher = GCMBlockCipher(AESEngine())
      ..init(true, AEADParameters(KeyParameter(key), _tagLength * 8, iv, Uint8List(0)));

    final input = Uint8List.fromList(utf8.encode(plaintext));
    final output = Uint8List(cipher.getOutputSize(input.length));
    var offset = cipher.processBytes(input, 0, input.length, output, 0);
    offset += cipher.doFinal(output, offset);

    return Uint8List.fromList([...salt, ...iv, ...output.sublist(0, offset)]);
  }

  String decrypt(Uint8List encryptedData, String password) {
    if (encryptedData.length < _saltLength + _ivLength + _tagLength) {
      throw const ExportCryptoException('Data too short to be valid');
    }

    final salt = encryptedData.sublist(0, _saltLength);
    final iv = encryptedData.sublist(_saltLength, _saltLength + _ivLength);
    final ciphertext = encryptedData.sublist(_saltLength + _ivLength);
    final key = _deriveKey(password, salt);

    try {
      final cipher = GCMBlockCipher(AESEngine())
        ..init(false, AEADParameters(KeyParameter(key), _tagLength * 8, iv, Uint8List(0)));

      final output = Uint8List(cipher.getOutputSize(ciphertext.length));
      var offset = cipher.processBytes(ciphertext, 0, ciphertext.length, output, 0);
      offset += cipher.doFinal(output, offset);
      return utf8.decode(output.sublist(0, offset));
    } catch (e) {
      throw const ExportCryptoException('Decryption failed. Wrong password or corrupted data.');
    }
  }

  Uint8List _deriveKey(String password, Uint8List salt) {
    final pbkdf2 = PBKDF2KeyDerivator(HMac(SHA256Digest(), 64))
      ..init(Pbkdf2Parameters(salt, _pbkdf2Iterations, _keyLength));
    return pbkdf2.process(Uint8List.fromList(utf8.encode(password)));
  }

  Uint8List _generateRandom(int length) {
    final random = Random.secure();
    return Uint8List.fromList(List.generate(length, (_) => random.nextInt(256)));
  }
}
