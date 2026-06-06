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

int main(int argc, char **argv)
{
	if (argc < 2) return 1;
	int test_num = atoi(argv[1]);
	int ret = 0;
	if (test_num == 1)
		ret = ft_printf("%c", 'c');
	else if (test_num == 2)
		ret = ft_printf("%c%c", '4', '2');
	else if (test_num == 3)
		ret = ft_printf("%c", 0);
	else if (test_num == 4)
		ret = ft_printf("{%3c}", 0);
	else if (test_num == 5)
		ret = ft_printf("%.c", 0);
	else if (test_num == 6)
		ret = ft_printf("%c", 200);
	else if (test_num == 7)
		ret = ft_printf("%lc", L'a');
	else if (test_num == 8)
		ret = ft_printf("%.c", 'a');
	else if (test_num == 9)
		ret = ft_printf("%-c", 'a');
	else if (test_num == 10)
		ret = ft_printf("%c", '\0');
	else if (test_num == 11)
		ret = ft_printf("%5c", '\0');
	else if (test_num == 12)
		ret = ft_printf("%-5c", '\0');
	else if (test_num == 13)
		ret = ft_printf("%c", 'a');
	else if (test_num == 14)
		ret = ft_printf("%10c", 't');
	else if (test_num == 15)
		ret = ft_printf("%1c", 'y');
	else if (test_num == 16)
		ret = ft_printf("1caractere 1 %c caractere 2 %c\n\n", 'a', 'c');
	else if (test_num == 17)
		ret = ft_printf("%c",       'x');
	else if (test_num == 18)
		ret = ft_printf("%c",       '\0');
	else if (test_num == 19)
		ret = ft_printf("%1c",      'x');
	else if (test_num == 20)
		ret = ft_printf("%20c",      'x');
	else if (test_num == 21)
		ret = ft_printf("%-20c",      'x');
	else if (test_num == 22)
		ret = ft_printf("%c", '0');
	else if (test_num == 23)
		ret = ft_printf(" %c ", '0');
	else if (test_num == 24)
		ret = ft_printf(" %c", '0' - 256);
	else if (test_num == 25)
		ret = ft_printf("%c ", '0' + 256);
	else if (test_num == 26)
		ret = ft_printf(" %c %c %c ", '0', 0, '1');
	else if (test_num == 27)
		ret = ft_printf(" %c %c %c ", ' ', ' ', ' ');
	else if (test_num == 28)
		ret = ft_printf(" %c %c %c ", '1', '2', '3');
	else if (test_num == 29)
		ret = ft_printf(" %c %c %c ", '2', '1', 0);
	else if (test_num == 30)
		ret = ft_printf(" %c %c %c ", 0, '1', '2');
	else if (test_num == 31)
		ret = ft_printf("%-1c", '0');
	else if (test_num == 32)
		ret = ft_printf(" %-2c ", '0');
	else if (test_num == 33)
		ret = ft_printf(" %-3c", '0' - 256);
	else if (test_num == 34)
		ret = ft_printf("%-4c ", '0' + 256);
	else if (test_num == 35)
		ret = ft_printf(" %-1c %-2c %-3c ", '0', 0, '1');
	else if (test_num == 36)
		ret = ft_printf(" %-1c %-2c %-3c ", ' ', ' ', ' ');
	else if (test_num == 37)
		ret = ft_printf(" %-1c %-2c %-3c ", '1', '2', '3');
	else if (test_num == 38)
		ret = ft_printf(" %-1c %-2c %-3c ", '2', '1', 0);
	else if (test_num == 39)
		ret = ft_printf(" %-1c %-2c %-3c ", 0, '1', '2');
	else if (test_num == 40)
		ret = ft_printf("%%%c%%%s%%%d%%%i%%%u%%%x%%%X%%%% %%%c%%%s%%%d%%%i%%%u%%%x%%%X%%%% %%%c%%%s%%%d%%%i%%%u%%%x%%%X%%%% %c%%", 'A', "42", 42, 42 ,42 , 42, 42, 'B', "-42", -42, -42 ,-42 ,-42, 42, 'C', "0", 0, 0 ,0 ,0, 42, 0);
	printf("\n[RET: %d]", ret);
	return 0;
}
