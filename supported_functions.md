# 🛠 Supported Conversions & Test Logic

**FT_PRINTF-GOD** organizes its tests into three logical categories to facilitate debugging and incremental development.

---

## 🟢 Part 1: Mandatory (170 Tests)
Tests only the basic conversions without any flags, field widths, or precisions. Strictly aligned with the mandatory part of the 42 subject (100 Points).

| Conversion | Tests | Description |
| :--- | :--- | :--- |
| `%c` | 19 | Single character. |
| `%s` | 35 | String (including NULL strings). |
| `%p` | 17 | Pointer address (System-compliant format). |
| `%d` / `%i` | 27 | Signed decimal integers (including INT_MIN/MAX). |
| `%u` | 32 | Unsigned decimal integers. |
| `%x` | 13 | Hexadecimal (lowercase). |
| `%X` | 13 | Hexadecimal (uppercase). |
| `%%` | 14 | Percent sign literal. |

---

## 🟡 Part 2: Bonus (1,070 Tests)
Exhaustive testing of flag management, field widths, and precisions.

| Conversion | Tests | Features Tested |
| :--- | :--- | :--- |
| `%c` | 21 | Width and alignment flags (`-`). |
| `%s` | 104 | Precision truncation, width, and alignment. |
| `%p` | 29 | Formatting edge cases. |
| `%d` / `%i` | 374 | Zero-padding (`0`), alignment (`-`), signs (`+`, ` `), precision, and combinations. |
| `%u` | 168 | Precision, width, and alignment. |
| `%x` / `%X` | 374 | Hash flag (`#`), zero-padding, width, precision, and alignment. |

**Bonus Features Validated:**
- **Flags:** `-`, `0`, `.`, `#`, `+`, ` ` (space).
- **Field Width:** Minimum field width handling, including extremely large values.
- **Precision:** Precision handling for strings and integers.
- **Combinations:** Complex and conflicting flag combinations (e.g., `% -+05d`).

---

## 🔵 Part 3: Stress / Mix (32 Tests)
Tests the overall robustness of the buffer and parsing logic.

| Test Type | Details |
| :--- | :--- |
| **Mixed Cases** | Up to 10 conversions in a single `ft_printf` call. |
| **Long Data** | Strings > 600 chars and extremely large field widths (> 1000). |
| **Return Values** | Strict validation of the total character count returned. |

---

## 🔬 Test Methodology
Every single test follows this internal flow:
1. Executes the system's original `printf` and saves the output + return value.
2. Executes your `ft_printf` and saves the output + return value.
3. Compares the resulting files using `diff`.
4. Validates memory leaks using `valgrind` (Linux) or `leaks` (macOS).
