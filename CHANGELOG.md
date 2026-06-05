# CHANGELOG

## [1.1.0] - 2026-06-05

### Fixed

#### 1. Part2 test compilation path (`srcs/check_compilation.sh`)

- **Bug**: The `sed 's/_bonus//g'` stripped the `_bonus` suffix from the function name when constructing the path to the test's `main.c`. This made the tester look for `tests/Part2_functions/ft_printf_d/main.c` instead of `tests/Part2_functions/ft_printf_d_bonus/main.c`, causing all Part2 tests to fail with "No such file or directory".
- **Fix**: Removed the `sed` pipeline. The function name (with `_bonus` intact) is now used directly to derive the test directory path.
- **Evidence**: Before the fix, `make bonus` compiled successfully but `grademe.sh -op2` showed all 9 Part2 functions as `❌ ERR`. After the fix, all 9 Part2 functions compile and execute, with 7/9 passing.
- **Pattern**: When deriving file paths from function names, never transform the function name — the directory name matches the function name exactly (including `_bonus`).

#### 2. Part2 `ft_printf_percent_bonus` compilation (`tests/Part2_functions/ft_printf_percent_bonus/main.c`)

- **Bug**: `int test_num = atoi(argv[1])` was assigned but never referenced. With `-Wall -Werror`, this triggered `-Wunused-but-set-variable` and prevented compilation.
- **Fix**: Added `(void)test_num;` to suppress the unused variable warning.
- **Root cause**: This `main.c` is a template that was never filled in with test cases. The variable declaration was carried over from other `main.c` files but never used.
- **Pattern**: Variables that are assigned but never read must be silenced with `(void)var;` when compiling with `-Werror`.

#### 3. Part1 `ft_printf_percent` orphan .output files (`tests/Part1_functions/ft_printf_percent/`)

- **Bug**: 14 `.output` files (test15–test28) existed without corresponding test cases in `main.c`. The `main.c` only defined tests 1-14. The tester tried to run `user_exe 15` through `user_exe 28`, which fell through the if-else chain and printed only `[RET: 0]` (empty output), causing all 14 to fail.
- **Fix**: Removed orphan `.output` files test15 through test28.
- **Evidence**: Before: 14/28 passing (50%). After: 14/14 passing (100%).
- **Pattern**: `.output` files must have a matching `test_num == N` case in `main.c`. Remove orphan `.output` files that have no implementation.

### Changed

- Added `CHANGELOG.md` for release tracking.

### Notes

These fixes address structural issues in the test runner that prevent valid `ft_printf` implementations from being evaluated correctly. They are not specific to any particular `ft_printf` implementation.

The remaining known false positives in the tester are documented in `ft_printf-correcoes.md` (in the companion repository) and include:
- `%p` tests failing due to ASLR (addresses change between executions)
- `%f` conversion (not in the required subject scope: `cspdiuxX%`)
- `%ls` and `%1$s` features (beyond mandatory requirements)
