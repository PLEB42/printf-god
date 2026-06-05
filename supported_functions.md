# Supported Conversions & Test Cases

This document lists all conversions supported by the **FT_PRINTF-GOD** Tester (Version 2026).

## Supported Conversions

| Conversion | Description | Edge Cases Tested |
| :--- | :--- | :--- |
| `%c` | Single character | `\0`, Extended ASCII, padding/width. |
| `%s` | String | `NULL` strings, empty strings, long strings, precision/width. |
| `%p` | Pointer address | `NULL` pointer, large addresses, padding. |
| `%d` / `%i` | Signed decimal integer | `INT_MIN`, `INT_MAX`, `0`, positive/negative, flags (`+`, ` `, `0`, `-`), precision. |
| `%u` | Unsigned decimal integer | `UINT_MAX`, `0`, padding, precision. |
| `%x` | Hexadecimal (lowercase) | `0`, `UINT_MAX`, hash flag (`#`), padding, precision. |
| `%X` | Hexadecimal (uppercase) | `0`, `UINT_MAX`, hash flag (`#`), padding, precision. |
| `%%` | Percent sign | Double percent, mixing with other conversions. |

## Mixed Tests
The tester includes a dedicated suite for mixed conversions, ensuring that multiple placeholders in a single string are handled correctly with their respective flags and widths.

## Edge Cases
- **Memory Leaks:** Exhaustive check using `valgrind` or `leaks`.
- **Return Values:** Validation of the total number of characters printed.
- **Buffer Management:** Testing with large outputs.
- **Flag Combinations:** Testing conflicting flags (e.g., `0` and `-`).

---

### Statistics
*   **Total Test Cases:** Over 1000 unique scenarios.
*   **Compliance:** Fully aligned with 42 school `ft_printf` subject.
