# 👑 PRINTF-GOD (Version 2026)

<p align="center">
  <img src="https://img.shields.io/badge/Project-ft__printf-blueviolet?style=for-the-badge&logo=42" alt="42 Project">
  <img src="https://img.shields.io/badge/Tester-God%20Edition-gold?style=for-the-badge" alt="God Edition">
</p>

A professional, ultra-fast, and visually stunning tester for the 42 **ft_printf** project. Re-engineered to align perfectly with the **2024-2026 Subject** requirements.

---

## ✨ Features

- 🚀 **Real-time God Progress:** Watch your tests pass in real-time with an in-place updating progress bar.
- 🎯 **Modular Testing:** Separate suites for **Mandatory**, **Bonus**, and **Stress Tests**.
- 💎 **Academic Integrity:** Designed to be a rigorous validator. It reports discrepancies clearly without providing "cheating" shortcuts.
- 🧪 **Extreme Robustness:** Over 1500 test cases including massive field widths, conflicting flags, and complex edge cases.
- 📂 **Refined Deepthought Logs:** Professional test reports showing exact discrepancies between System and User output using `cat -e` style formatting.
- 🛡️ **Smart Forbidden Check:** Accurate detection of external calls while respecting your internal `libft` functions.

---

## 🚀 Installation

1. **Clone** this repository inside your `ft_printf` folder:
   ```bash
   git clone https://github.com/PLEB42/printf-god.git god_tester
   ```

2. **Configure** your paths in `my_config.sh`:
   ```bash
   cd god_tester
   # Ensure PATH_LIBFT, SRC_DIR and HEADER_DIR are correct
   nano my_config.sh
   ```

3. **Run** the magic:
   ```bash
   ./grademe.sh
   ```

---

## 🎮 Usage

### Basic Execution (Mandatory only)
```bash
./grademe.sh
```

### Targeted Testing
| Flag | Description |
| :--- | :--- |
| `./grademe.sh -complete` | Runs Mandatory + Bonus tests. |
| `./grademe.sh -mandatory` | Runs ONLY the mandatory conversions (`cspdiuxX%`). |
| `./grademe.sh -bonus` | Runs ONLY the bonus flags and width/precision tests. |
| `./grademe.sh -stress` | Runs complex mixed conversion tests. |
| `./grademe.sh -doom` | Runs EVERYTHING (Mandatory, Bonus, and Stress). |

### Utility Options
- `./grademe.sh ft_printf_d`: Run only tests for `%d`.
- `./grademe.sh -fast`: Skip per-test leak check for maximum speed.
- `./grademe.sh -n`: Skip Norminette.
- `./grademe.sh -f`: Skip Forbidden functions check.

---

## 📊 The Deepthought Report

The generated `deepthought` file is your best friend for debugging. It follows a clean format:
- **Test Case:** Shows the specific `ft_printf` call.
- **Side-by-side comparison:** Displays System output vs Your output.
- **Non-printable chars:** Uses `$` to mark line endings, helping you find hidden spaces.

---

## 📜 Credits

Part of the **God Series** for 42. Inspired by `libft-god` and maintained to provide the most rigorous testing environment for the Common Core.

<p align="center">
  Made with ❤️ for the 42 Community.
</p>
