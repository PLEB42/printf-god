#include "ft_printf.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <stdint.h>

static __attribute__((unused)) char *s_hidden = "hi low\0don't print me lol\0";
static __attribute__((unused)) char *s2 = "hello";
static __attribute__((unused)) int i_pos_1 = 878023;
static __attribute__((unused)) char ch_pos_1 = 100, ch_neg_1 = -87;
static __attribute__((unused)) short sh_pos_1 = 3047, sh_neg_1 = -8875;
static __attribute__((unused)) long l_pos_1 = 22337203685477, l_neg_1 = -22337203685477;
static __attribute__((unused)) long long ll_pos_1 = 22337203685477, ll_neg_1 = -22337203685477;
static __attribute__((unused)) unsigned char uch_pos_1 = 100;
static __attribute__((unused)) unsigned short ush_pos_1 = 3047;
static __attribute__((unused)) unsigned int ui_pos_1 = 878023;
static __attribute__((unused)) unsigned long ul_pos_1 = 22337203685477;
static __attribute__((unused)) unsigned long long ull_pos_1 = 22337203685477;
static __attribute__((unused)) long lmax = 9223372036854775807;
static __attribute__((unused)) long lmin = -9223372036854775807;
static __attribute__((unused)) long long llmax = 9223372036854775807;
static __attribute__((unused)) long long llmin = -9223372036854775807ll;
static __attribute__((unused)) unsigned long ulmax = 9223372036854775807;
static __attribute__((unused)) unsigned long long ullmax = 9223372036854775807;
static __attribute__((unused)) int ncm_p = 5;
static __attribute__((unused)) char a01;
static __attribute__((unused)) unsigned char a02;
static __attribute__((unused)) short a03;
static __attribute__((unused)) unsigned short a04;
static __attribute__((unused)) int a05;
static __attribute__((unused)) unsigned int a06;
static __attribute__((unused)) long a07;
static __attribute__((unused)) unsigned long a08;
static __attribute__((unused)) long long a09;
static __attribute__((unused)) unsigned long long a10;
static __attribute__((unused)) char *a11;
static __attribute__((unused)) void *a12;
static __attribute__((unused)) int i;
static __attribute__((unused)) long l;
static __attribute__((unused)) char *str = "abc";
static __attribute__((unused)) int t = 42;
static __attribute__((unused)) void test_moulitest_06(void) {}

int main(int argc, char **argv) {
	if (argc < 2) return 1;
	int test_num = atoi(argv[1]);
	int ret = 0;
	if (test_num == 1) ret = ft_printf("%%%c%%%s%%%d%%%i%%%u%%%x%%%X%%%% %%%c%%%s%%%d%%%i%%%u%%%x%%%X%%%% %%%c%%%s%%%d%%%i%%%u%%%x%%%X%%%% %c%%", 'A', "42", 42, 42 ,42 , 42, 42, 'B', "-42", -42, -42 ,-42 ,-42, 42, 'C', "0", 0, 0 ,0 ,0, 42, 0);
	else if (test_num == 2) ret = ft_printf("This is a simple test.");
	else if (test_num == 3) ret = ft_printf("This is a simple test.\nSecond sentence.\n");
	else if (test_num == 4) ret = ft_printf("");
	else if (test_num == 5) ret = ft_printf("\n");
	else if (test_num == 6) ret = ft_printf("{% %}");
	else if (test_num == 7) ret = ft_printf("hello, world!");
	else if (test_num == 8) ret = ft_printf("");
	else if (test_num == 9) ret = ft_printf("\t\n\r\v\f\n");
	else if (test_num == 10) ret = ft_printf("%5%");
	else if (test_num == 11) ret = ft_printf("%-5%");
	else if (test_num == 12) ret = ft_printf("%05%");
	else if (test_num == 13) ret = ft_printf("%-05%");
	else if (test_num == 14) ret = ft_printf("%-f", 42.5);
	else if (test_num == 15) ret = ft_printf("%010%");
	else if (test_num == 16) ret = ft_printf("percent 1 %012%");
	else if (test_num == 17) ret = ft_printf("percent 2 %12%");
	else if (test_num == 18) ret = ft_printf("percent 3 %-12%");
	else if (test_num == 19) ret = ft_printf("percent 4 %0%");
	else if (test_num == 20) ret = ft_printf("percent 5 % %");
	else if (test_num == 21) ret = ft_printf("percent 6 % 15%");
	else if (test_num == 22) ret = ft_printf("percent 7 % 12%");
	else if (test_num == 23) ret = ft_printf("Hallo heimur");
	else if (test_num == 24) ret = ft_printf("Mix: %c %s %p %d %i %u %x %X %%", 'A', "test", (void *)0xdeadbeef, 42, -42, 42, 42, 42);
	else if (test_num == 25) ret = ft_printf("Mix: %10c %-10s %p %010d %i %u %x %X %%", 'B', "hello", (void *)0x1234, 123, -123, 123, 123, 123);
	else if (test_num == 26) ret = ft_printf("Mix: %c %s %p %d %i %u %x %X %%", 0, "", (void *)0, 0, 0, 0, 0, 0);
	else if (test_num == 27) ret = ft_printf("%s %d %p %x %X %u %i %c %%", "str", 10, (void *)0xabcdef, 255, 255, 4294967295u, -1, 'z');
	else if (test_num == 28) ret = ft_printf("%-10s %10d %p %x %X %u %i %c %%", "left", 12345, (void *)0x1, 0, 0, 0, 0, ' ');
	else if (test_num == 29) ret = ft_printf("%.5s %.5d %p %x %X %u %i %c %%", "longstring", 42, (void *)&a01, 0xabc, 0xABC, 100, 100, '!');
	else if (test_num == 30) ret = ft_printf("%s %d %p %x %X %u %i %c %%", "limits", INT_MIN, (void *)0, 0, 0, 0, 0, '7');
	else if (test_num == 31) ret = ft_printf("Multiple: %d %d %d %d %d %s %s %c %c", 1, 2, 3, 4, 5, "one", "two", 'a', 'b');
	else if (test_num == 32) ret = ft_printf("Hex: %#x %#X %p %d", 0x123, 0x123, (void *)0x123, 0x123);
	else if (test_num == 33) ret = ft_printf("Mixed again: %%%c%s%p%d%i%u%x%X%%", 'Z', "final", (void *)&t, 42, 42, 42, 42, 42);
	printf("\n[RET: %d]", ret);
	return 0;
}