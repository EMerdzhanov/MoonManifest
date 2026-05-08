import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:moon_manifest/core/crypto/export_crypto.dart';

void main() {
  late ExportCrypto crypto;

  setUp(() {
    crypto = ExportCrypto();
  });

  group('encrypt/decrypt', () {
    test('round-trips a simple payload', () {
      final payload = '{"intentions": ["peace", "clarity"]}';
      final password = 'testpassword123';
      final encrypted = crypto.encrypt(payload, password);
      final decrypted = crypto.decrypt(encrypted, password);
      expect(decrypted, payload);
    });

    test('round-trips unicode content', () {
      final payload = '{"text": "感謝 🌙 Merci"}';
      final password = 'p@ssw0rd!';
      final encrypted = crypto.encrypt(payload, password);
      final decrypted = crypto.decrypt(encrypted, password);
      expect(decrypted, payload);
    });

    test('round-trips a large payload', () {
      final payload = jsonEncode({
        'cycles': List.generate(100, (i) => {
          'id': 'cycle_$i',
          'intentions': List.generate(7, (j) => 'Intention $j for cycle $i'),
        }),
      });
      final password = 'longpassword';
      final encrypted = crypto.encrypt(payload, password);
      final decrypted = crypto.decrypt(encrypted, password);
      expect(decrypted, payload);
    });

    test('wrong password throws', () {
      final payload = 'secret data';
      final encrypted = crypto.encrypt(payload, 'correct');
      expect(() => crypto.decrypt(encrypted, 'wrong'), throwsA(isA<ExportCryptoException>()));
    });

    test('corrupted data throws', () {
      final payload = 'secret data';
      final encrypted = crypto.encrypt(payload, 'password');
      encrypted[50] = (encrypted[50] + 1) % 256;
      expect(() => crypto.decrypt(encrypted, 'password'), throwsA(isA<ExportCryptoException>()));
    });

    test('different encryptions of same data produce different ciphertext', () {
      final payload = 'same data';
      final password = 'same password';
      final encrypted1 = crypto.encrypt(payload, password);
      final encrypted2 = crypto.encrypt(payload, password);
      expect(encrypted1, isNot(equals(encrypted2)));
      expect(crypto.decrypt(encrypted1, password), payload);
      expect(crypto.decrypt(encrypted2, password), payload);
    });
  });
}
