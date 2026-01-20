// Flutter widget and unit tests for SISFO UPZ
//
// This file contains tests for the UX improvement features.

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sisfo/flutter_flow/form_validators.dart';

void main() {
  group('FormValidators', () {
    group('validateRequired', () {
      test('returns error message when value is null', () {
        final result = FormValidators.validateRequired(null, 'Nama');
        expect(result, 'Nama wajib diisi');
      });

      test('returns error message when value is empty', () {
        final result = FormValidators.validateRequired('', 'Nama');
        expect(result, 'Nama wajib diisi');
      });

      test('returns error message when value is whitespace only', () {
        final result = FormValidators.validateRequired('   ', 'Nama');
        expect(result, 'Nama wajib diisi');
      });

      test('returns null when value is valid', () {
        final result = FormValidators.validateRequired('John Doe', 'Nama');
        expect(result, isNull);
      });
    });

    group('validateEmail', () {
      test('returns error message when email is null', () {
        final result = FormValidators.validateEmail(null);
        expect(result, 'Email wajib diisi');
      });

      test('returns error message when email is empty', () {
        final result = FormValidators.validateEmail('');
        expect(result, 'Email wajib diisi');
      });

      test('returns error message when email format is invalid', () {
        final result = FormValidators.validateEmail('invalid-email');
        expect(result, 'Format email tidak valid');
      });

      test('returns error message when email has no domain', () {
        final result = FormValidators.validateEmail('test@');
        expect(result, 'Format email tidak valid');
      });

      test('returns null when email is valid', () {
        final result = FormValidators.validateEmail('test@example.com');
        expect(result, isNull);
      });
    });

    group('validateCurrency', () {
      test('returns error message when value is null', () {
        final result = FormValidators.validateCurrency(null);
        expect(result, 'Nominal wajib diisi');
      });

      test('returns error message when value is empty', () {
        final result = FormValidators.validateCurrency('');
        expect(result, 'Nominal wajib diisi');
      });

      test('returns error message when value is not a number', () {
        final result = FormValidators.validateCurrency('abc');
        expect(result, 'Nominal harus berupa angka');
      });

      test('returns error message when value is negative', () {
        final result = FormValidators.validateCurrency('-1000');
        expect(result, 'Nominal tidak boleh negatif');
      });

      test('returns null when value is valid number', () {
        final result = FormValidators.validateCurrency('1000000');
        expect(result, isNull);
      });

      test('returns null when value has thousand separators', () {
        final result = FormValidators.validateCurrency('1.000.000');
        expect(result, isNull);
      });

      test('returns error when value is below minimum', () {
        final result = FormValidators.validateCurrency('500', minValue: 1000);
        expect(result, contains('minimal'));
      });

      test('returns error when value is above maximum', () {
        final result = FormValidators.validateCurrency('2000', maxValue: 1000);
        expect(result, contains('maksimal'));
      });
    });

    group('validatePhone', () {
      test('returns error message when phone is null', () {
        final result = FormValidators.validatePhone(null);
        expect(result, 'Nomor telepon wajib diisi');
      });

      test('returns error message when phone is empty', () {
        final result = FormValidators.validatePhone('');
        expect(result, 'Nomor telepon wajib diisi');
      });

      test('returns error message when phone format is invalid', () {
        final result = FormValidators.validatePhone('12345');
        expect(result, 'Format nomor telepon tidak valid');
      });

      test('returns null when phone starts with 08', () {
        final result = FormValidators.validatePhone('081234567890');
        expect(result, isNull);
      });

      test('returns null when phone starts with +62', () {
        final result = FormValidators.validatePhone('+6281234567890');
        expect(result, isNull);
      });

      test('returns null when phone starts with 62', () {
        final result = FormValidators.validatePhone('6281234567890');
        expect(result, isNull);
      });
    });
  });

  group('CurrencyInputFormatter', () {
    late CurrencyInputFormatter formatter;

    setUp(() {
      formatter = CurrencyInputFormatter();
    });

    test('formats number with thousand separators', () {
      final oldValue = const TextEditingValue(text: '');
      final newValue = const TextEditingValue(text: '1000000');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '1.000.000');
    });

    test('handles empty input', () {
      final oldValue = const TextEditingValue(text: '1.000');
      final newValue = const TextEditingValue(text: '');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '');
    });

    test('removes non-digit characters', () {
      final oldValue = const TextEditingValue(text: '');
      final newValue = const TextEditingValue(text: 'abc123def');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '123');
    });

    test('removes leading zeros', () {
      final oldValue = const TextEditingValue(text: '');
      final newValue = const TextEditingValue(text: '00123');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '123');
    });

    test('keeps single zero', () {
      final oldValue = const TextEditingValue(text: '');
      final newValue = const TextEditingValue(text: '0');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '0');
    });

    group('static methods', () {
      test('parseFormattedCurrency parses formatted value', () {
        final result =
            CurrencyInputFormatter.parseFormattedCurrency('1.000.000');
        expect(result, 1000000);
      });

      test('parseFormattedCurrency returns null for empty', () {
        final result = CurrencyInputFormatter.parseFormattedCurrency('');
        expect(result, isNull);
      });

      test('formatToCurrency formats integer', () {
        final result = CurrencyInputFormatter.formatToCurrency(1000000);
        expect(result, '1.000.000');
      });

      test('formatToCurrency handles zero', () {
        final result = CurrencyInputFormatter.formatToCurrency(0);
        expect(result, '0');
      });

      test('formatToCurrencyWithPrefix adds Rp prefix', () {
        final result =
            CurrencyInputFormatter.formatToCurrencyWithPrefix(1000000);
        expect(result, 'Rp 1.000.000');
      });
    });
  });
}
