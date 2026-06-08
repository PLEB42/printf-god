# 🛠 Supported Conversions & Test Logic

**FT_PRINTF-GOD** organizes its tests into three logical categories to facilitate debugging and incremental development.

---

## 🟢 Part 1: Mandatory (Over 1,200 Tests)
Tests the basic conversions as required by the 42 subject. **By default, the tester runs only this part.**

| Conversion | Tests | Description |
| :--- | :--- | :--- |
| `%c` | 76 | Single character. |
| `%s` | 241 | String (including NULL strings and empty strings). |
| `%p` | 17 | Pointer address (System-compliant format). |
| `%d` / `%i` | 401 | Signed decimal integers (including INT_MIN/MAX). |
| `%u` | 32 | Unsigned decimal integers. |
| `%x` | 13 | Hexadecimal (lowercase). |
| `%X` | 13 | Hexadecimal (uppercase). |
| `%%` | 35 | Percent sign literal (enhanced coverage). |

---

## 🟡 Part 2: Bonus (Over 1,100 Tests)
Exhaustive testing of flag management, field widths, and precisions. **Enabled with `-complete` or `-bonus`.**

| Conversion | Tests | Features Tested |
| :--- | :--- | :--- |
| `%c` | 89 | Width and alignment flags (`-`). |
| `%s` | 104 | Precision truncation, width, and alignment. |
| `%p` | 29 | Formatting edge cases. |
| `%d` / `%i` | 374 | Zero-padding (`0`), alignment (`-`), signs (`+`, ` `), precision, and combinations. |
| `%u` | 168 | Precision, width, and alignment. |
| `%x` / `%X` | 374 | Hash flag (`#`), zero-padding, width, precision, and alignment. |
| `%%` | 29 | Width, alignment, and zero-padding for percent literal. |

**Bonus Features Validated:**
- **Flags:** `-`, `0`, `.`, `#`, `+`, ` ` (space).
- **Field Width:** Minimum field width handling, including extremely large values and variable width (`*`).
- **Precision:** Precision handling for strings and integers.
- **Combinations:** Complex and conflicting flag combinations (e.g., `% -+05d`).

---

## 🔵 Part 3: Stress / Mix (32 Tests)
Tests the overall robustness of the buffer and parsing logic. **Enabled with `-doom` or `-stress`.**

| Test Type | Details |
| :--- | :--- |
| **Mixed Cases** | Up to 10 conversions in a single `ft_printf` call. |
| **Long Data** | Strings > 600 chars and extremely large field widths (> 1000). |
| **Return Values** | Strict validation of the total character count returned. |

---

## 🔬 Test Methodology
Every single test follows this internal flow:
1. **Makefile Validation:** Checks for `all`, `clean`, `fclean`, and `re` rules (fixed validation logic).
2. **Execution:** Executes system `printf` vs your `ft_printf`.
3. **Comparison:** Comparison using `diff` and return value verification.
4. **Memory Leaks:** Automatic leak detection (unless `-fast` is used).

### Execution Flags
- `./grademe.sh`: Runs **Mandatory** tests only (New Default).
- `./grademe.sh -complete`: Runs **Mandatory + Bonus**.
- `./grademe.sh -doom`: Runs **Everything** (Part 1, 2, and 3).
