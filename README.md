# 👑 FT_PRINTF-GOD (Version 2026)

<p align="center">
  <img src="https://img.shields.io/badge/Project-ft__printf-blueviolet?style=for-the-badge&logo=42" alt="42 Project">
  <img src="https://img.shields.io/badge/Tester-God%20Edition-gold?style=for-the-badge" alt="God Edition">
  <img src="https://img.shields.io/badge/Compliance-100%25-brightgreen?style=for-the-badge" alt="Compliance">
</p>

A professional, ultra-fast, and visually stunning tester for the 42 **ft_printf** project. Built to ensure your implementation is not just working, but **God-like**.

---

## ✨ Features

- 🚀 **Real-time Progress:** Watch your tests pass in real-time with smooth, updated-in-place progress bars.
- 📊 **Ultra-Wide Visual Table:** Comprehensive overview including Norminette, Forbidden Functions, Compilation, Leaks, and detailed Test results.
- 🧪 **1000+ Test Cases:** Extracted and refined from the best community testers (`ft_printf_test`, `printfTester`) plus exclusive **God-Mix** edge cases.
- 🛠️ **Full Conversion Support:** Complete validation for `c`, `s`, `p`, `d`, `i`, `u`, `x`, `X`, and `%`.
- 🧬 **Complex Mixed Tests:** Stress-test your buffer and flag logic with multiple combined conversions in a single call.
- 📂 **Deepthought Logs:** Generates a detailed report (`deepthought`) with exact `diff` outputs for every failure.

---

## 🚀 Installation

1. **Clone** this repository inside your `ft_printf` folder (or anywhere you like):
   ```bash
   git clone https://github.com/your-repo/ft_printf-god.git god_tester
   ```

2. **Configure** the path to your project in `my_config.sh`:
   ```bash
   cd god_tester
   # Edit PATH_LIBFT to point to your ft_printf source code
   nano my_config.sh
   ```

3. **Run** the magic:
   ```bash
   ./grademe.sh
   ```

---

## 🎮 Usage

### Basic Execution
```bash
./grademe.sh
```

### Run Specific Conversions
```bash
./grademe.sh ft_printf_c
./grademe.sh ft_printf_d ft_printf_s
```

### Fast Mode (Skip per-test Leaks)
```bash
./grademe.sh -fast
```

### Options Reference
| Option | Description |
| :--- | :--- |
| `-fast` | Skips Valgrind/Leaks check for each individual test (much faster). |
| `-n` | Skips Norminette check. |
| `-f` | Skips Forbidden functions check. |
| `--help` | Shows the full manual. |

---

## 🛠️ Requirements

- **Norminette:** For code style validation.
- **Valgrind / Leaks:** For memory integrity checks (Supports both Linux and macOS).
- **Cc/Clang:** A functional compiler.

---

## 📜 Credits

This tester is part of the **God Series** for 42, inspired by the visual style of `libft-god` and maintained by the community to provide the most rigorous testing environment possible.

Special thanks to the authors of `ft_printf_test` and `printfTester` for the initial test base.

---

<p align="center">
  Made with ❤️ for the 42 Community.
</p>
