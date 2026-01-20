import 'package:flutter/services.dart';

/// FormValidators provides validation functions for form fields
/// with error messages in Bahasa Indonesia.
///
/// Requirements: 3.1, 3.3, 10.1
class FormValidators {
  /// Validates that a field is not empty or whitespace only.
  /// Returns error message in Indonesian if invalid, null if valid.
  ///
  /// [value] - The value to validate
  /// [fieldName] - The name of the field for the error message
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName wajib diisi';
    }
    return null;
  }

  /// Validates email format.
  /// Returns error message in Indonesian if invalid, null if valid.
  ///
  /// [value] - The email value to validate
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email wajib diisi';
    }

    // Email regex pattern
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Format email tidak valid';
    }

    return null;
  }

  /// Validates currency/monetary value.
  /// Accepts numbers with or without thousand separators (dots).
  /// Returns error message in Indonesian if invalid, null if valid.
  ///
  /// [value] - The currency value to validate
  /// [fieldName] - Optional field name for the error message
  /// [minValue] - Optional minimum value
  /// [maxValue] - Optional maximum value
  static String? validateCurrency(
    String? value, {
    String fieldName = 'Nominal',
    double? minValue,
    double? maxValue,
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName wajib diisi';
    }

    // Remove thousand separators (dots) and whitespace
    final cleanValue = value.replaceAll('.', '').replaceAll(' ', '').trim();

    // Check if it's a valid number
    final numValue = double.tryParse(cleanValue);
    if (numValue == null) {
      return '$fieldName harus berupa angka';
    }

    // Check for negative values
    if (numValue < 0) {
      return '$fieldName tidak boleh negatif';
    }

    // Check minimum value
    if (minValue != null && numValue < minValue) {
      return '$fieldName minimal ${_formatCurrency(minValue.toInt())}';
    }

    // Check maximum value
    if (maxValue != null && numValue > maxValue) {
      return '$fieldName maksimal ${_formatCurrency(maxValue.toInt())}';
    }

    return null;
  }

  /// Validates Indonesian phone number format.
  /// Accepts formats: 08xx, +628xx, 628xx
  /// Returns error message in Indonesian if invalid, null if valid.
  ///
  /// [value] - The phone number to validate
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor telepon wajib diisi';
    }

    // Remove spaces, dashes, and parentheses
    final cleanValue = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // Indonesian phone number patterns:
    // - 08xxxxxxxxx (10-13 digits starting with 08)
    // - +628xxxxxxxx (12-15 chars starting with +628)
    // - 628xxxxxxxx (11-14 digits starting with 628)
    final phoneRegex = RegExp(
      r'^(\+62|62|0)8[1-9][0-9]{7,10}$',
    );

    if (!phoneRegex.hasMatch(cleanValue)) {
      return 'Format nomor telepon tidak valid';
    }

    return null;
  }

  /// Validates minimum length of a string.
  /// Returns error message in Indonesian if invalid, null if valid.
  ///
  /// [value] - The value to validate
  /// [minLength] - Minimum required length
  /// [fieldName] - The name of the field for the error message
  static String? validateMinLength(
    String? value,
    int minLength,
    String fieldName,
  ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName wajib diisi';
    }

    if (value.trim().length < minLength) {
      return '$fieldName minimal $minLength karakter';
    }

    return null;
  }

  /// Validates maximum length of a string.
  /// Returns error message in Indonesian if invalid, null if valid.
  ///
  /// [value] - The value to validate
  /// [maxLength] - Maximum allowed length
  /// [fieldName] - The name of the field for the error message
  static String? validateMaxLength(
    String? value,
    int maxLength,
    String fieldName,
  ) {
    if (value != null && value.length > maxLength) {
      return '$fieldName maksimal $maxLength karakter';
    }

    return null;
  }

  /// Validates numeric input (integers only).
  /// Returns error message in Indonesian if invalid, null if valid.
  ///
  /// [value] - The value to validate
  /// [fieldName] - The name of the field for the error message
  static String? validateNumeric(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName wajib diisi';
    }

    // Remove thousand separators
    final cleanValue = value.replaceAll('.', '').trim();

    if (int.tryParse(cleanValue) == null) {
      return '$fieldName harus berupa angka';
    }

    return null;
  }

  /// Helper function to format currency for error messages
  static String _formatCurrency(int value) {
    final result = StringBuffer();
    final valueStr = value.toString();
    var count = 0;

    for (var i = valueStr.length - 1; i >= 0; i--) {
      if (count > 0 && count % 3 == 0) {
        result.write('.');
      }
      result.write(valueStr[i]);
      count++;
    }

    return 'Rp ${result.toString().split('').reversed.join()}';
  }
}

/// CurrencyInputFormatter formats numeric input with thousand separators.
/// Uses Indonesian format with dots as thousand separators (e.g., 1.000.000).
///
/// Requirements: 3.2, 5.3
class CurrencyInputFormatter extends TextInputFormatter {
  /// Creates a CurrencyInputFormatter.
  ///
  /// [maxDigits] - Maximum number of digits allowed (default: 15)
  /// [allowDecimal] - Whether to allow decimal values (default: false)
  CurrencyInputFormatter({
    this.maxDigits = 15,
    this.allowDecimal = false,
  });

  final int maxDigits;
  final bool allowDecimal;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the new value is empty, return it as is
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove all non-digit characters (except comma for decimal if allowed)
    String newText = newValue.text;
    if (allowDecimal) {
      // Keep only digits and comma (Indonesian decimal separator)
      newText = newText.replaceAll(RegExp(r'[^\d,]'), '');
    } else {
      // Keep only digits
      newText = newText.replaceAll(RegExp(r'[^\d]'), '');
    }

    // Handle empty after cleaning
    if (newText.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Split by comma if decimal is allowed
    String integerPart = newText;
    String decimalPart = '';

    if (allowDecimal && newText.contains(',')) {
      final parts = newText.split(',');
      integerPart = parts[0];
      if (parts.length > 1) {
        // Only keep first 2 decimal digits
        decimalPart = parts[1].length > 2 ? parts[1].substring(0, 2) : parts[1];
      }
    }

    // Remove leading zeros (but keep at least one digit)
    integerPart = integerPart.replaceFirst(RegExp(r'^0+'), '');
    if (integerPart.isEmpty) {
      integerPart = '0';
    }

    // Limit the number of digits
    if (integerPart.length > maxDigits) {
      integerPart = integerPart.substring(0, maxDigits);
    }

    // Format with thousand separators
    final formattedInteger = _formatWithThousandSeparators(integerPart);

    // Combine integer and decimal parts
    String formattedText = formattedInteger;
    if (allowDecimal && newValue.text.contains(',')) {
      formattedText = '$formattedInteger,$decimalPart';
    }

    // Calculate new cursor position
    final newCursorPosition = _calculateCursorPosition(
      oldValue,
      newValue,
      formattedText,
    );

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );
  }

  /// Formats a numeric string with thousand separators (dots).
  String _formatWithThousandSeparators(String value) {
    if (value.isEmpty) return '';

    final buffer = StringBuffer();
    final length = value.length;

    for (var i = 0; i < length; i++) {
      // Add separator every 3 digits from the right
      if (i > 0 && (length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(value[i]);
    }

    return buffer.toString();
  }

  /// Calculates the appropriate cursor position after formatting.
  int _calculateCursorPosition(
    TextEditingValue oldValue,
    TextEditingValue newValue,
    String formattedText,
  ) {
    // If user is deleting, try to maintain relative position
    if (newValue.text.length < oldValue.text.length) {
      // Count digits before cursor in old value
      final oldCursor = oldValue.selection.baseOffset;
      final digitsBeforeCursor = oldValue.text
          .substring(0, oldCursor.clamp(0, oldValue.text.length))
          .replaceAll(RegExp(r'[^\d]'), '')
          .length;

      // Find position in new formatted text with same number of digits before
      int digitCount = 0;
      for (var i = 0; i < formattedText.length; i++) {
        if (RegExp(r'\d').hasMatch(formattedText[i])) {
          digitCount++;
        }
        if (digitCount >= digitsBeforeCursor) {
          return i + 1;
        }
      }
    }

    // Default: put cursor at the end
    return formattedText.length;
  }

  /// Parses a formatted currency string back to a numeric value.
  /// Returns the numeric value without formatting.
  static int? parseFormattedCurrency(String? formattedValue) {
    if (formattedValue == null || formattedValue.isEmpty) {
      return null;
    }

    // Remove thousand separators and parse
    final cleanValue = formattedValue.replaceAll('.', '').replaceAll(',', '.');
    return int.tryParse(cleanValue.split('.')[0]);
  }

  /// Parses a formatted currency string to double (for decimal values).
  static double? parseFormattedCurrencyDouble(String? formattedValue) {
    if (formattedValue == null || formattedValue.isEmpty) {
      return null;
    }

    // Remove thousand separators and convert comma to dot for decimal
    final cleanValue = formattedValue.replaceAll('.', '').replaceAll(',', '.');
    return double.tryParse(cleanValue);
  }

  /// Formats a numeric value to currency display format.
  /// Example: 1000000 -> "1.000.000"
  static String formatToCurrency(int value) {
    if (value == 0) return '0';

    final isNegative = value < 0;
    final absValue = value.abs().toString();
    final buffer = StringBuffer();
    final length = absValue.length;

    for (var i = 0; i < length; i++) {
      if (i > 0 && (length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(absValue[i]);
    }

    return isNegative ? '-${buffer.toString()}' : buffer.toString();
  }

  /// Formats a numeric value to currency display format with Rp prefix.
  /// Example: 1000000 -> "Rp 1.000.000"
  static String formatToCurrencyWithPrefix(int value) {
    return 'Rp ${formatToCurrency(value)}';
  }
}
