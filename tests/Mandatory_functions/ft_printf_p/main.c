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
	if (test_num == 1) ret = ft_printf(" %p ", -1);
	else if (test_num == 2) ret = ft_printf(" %p ", 1);
	else if (test_num == 3) ret = ft_printf(" %p ", 15);
	else if (test_num == 4) ret = ft_printf(" %p ", 16);
	else if (test_num == 5) ret = ft_printf(" %p ", 17);
	else if (test_num == 6) ret = ft_printf(" %p %p ", LONG_MIN, LONG_MAX);
	else if (test_num == 7) ret = ft_printf(" %p %p ", INT_MIN, INT_MAX);
	else if (test_num == 8) ret = ft_printf(" %p %p ", ULONG_MAX, -ULONG_MAX);
	else if (test_num == 9) ret = ft_printf(" %p %p ", 0, 0);
	else if (test_num == 10) ret = ft_printf("%p", &i);
	else if (test_num == 11) ret = ft_printf("%p", &l);
	else if (test_num == 12) ret = ft_printf("%p", &str);
	else if (test_num == 13) ret = ft_printf("%p", &strlen);
	else if (test_num == 14) ret = ft_printf("{%-13p}", &strlen);
	else if (test_num == 15) ret = ft_printf("{%-12p}", &strlen);
	else if (test_num == 16) ret = ft_printf("%.p", &ncm_p);
	else if (test_num == 17) ret = ft_printf("%-p", &ncm_p);
	else if (test_num == 18) ret = ft_printf("%-p", &ncm_p);
	else if (test_num == 19) ret = ft_printf("%p", NULL);
	else if (test_num == 20) ret = ft_printf("%p", NULL);
	else if (test_num == 21) ret = ft_printf("%p%p%p%p%p%p%p%p%p%p%p%p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 22) ret = ft_printf("%70p%70p%70p%70p%70p%70p%70p%70p%70p%70p%70p%70p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 23) ret = ft_printf("%5p%5p%5p%5p%5p%5p%5p%5p%5p%5p%5p%5p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 24) ret = ft_printf("%16p%16p%16p%16p%16p%16p%16p%16p%16p%16p%16p%16p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 25) ret = ft_printf("%8p%8p%8p%8p%8p%8p%8p%8p%8p%8p%8p%8p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 26) ret = ft_printf("%32p%32p%32p%32p%32p%32p%32p%32p%32p%32p%32p%32p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 27) ret = ft_printf("%-70p%-70p%-70p%-70p%-70p%-70p%-70p%-70p%-70p%-70p%-70p%-70p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 28) ret = ft_printf("%-5p%-5p%-5p%-5p%-5p%-5p%-5p%-5p%-5p%-5p%-5p%-5p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 29) ret = ft_printf("%-16p%-16p%-16p%-16p%-16p%-16p%-16p%-16p%-16p%-16p%-16p%-16p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 30) ret = ft_printf("%-8p%-8p%-8p%-8p%-8p%-8p%-8p%-8p%-8p%-8p%-8p%-8p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 31) ret = ft_printf("%-32p%-32p%-32p%-32p%-32p%-32p%-32p%-32p%-32p%-32p%-32p%-32p",&a01,&a02,&a03,&a04,&a05,&a06,&a07,&a08,&a09,&a10,&a11,&a12);
	else if (test_num == 32) ret = ft_printf("%p\n", NULL);
	else if (test_num == 33) ret = ft_printf("%15p\n", NULL);
	else if (test_num == 34) ret = ft_printf("%-15p\n", NULL);
	else if (test_num == 35) ret = ft_printf("%1p\n", &t);
	else if (test_num == 36) ret = ft_printf("%1p\n", &t);
	else if (test_num == 37) ret = ft_printf(" %2p ", -1);
	else if (test_num == 38) ret = ft_printf(" %-2p ", -1);
	else if (test_num == 39) ret = ft_printf(" %-2p ", 1);
	else if (test_num == 40) ret = ft_printf(" %-2p ", 15);
	else if (test_num == 41) ret = ft_printf(" %-3p ", 16);
	else if (test_num == 42) ret = ft_printf(" %-4p ", 17);
	else if (test_num == 43) ret = ft_printf(" %-9p %-10p ", LONG_MIN, LONG_MAX);
	else if (test_num == 44) ret = ft_printf(" %-11p %-12p ", INT_MIN, INT_MAX);
	else if (test_num == 45) ret = ft_printf(" %-13p %-14p ", ULONG_MAX, -ULONG_MAX);
	else if (test_num == 46) ret = ft_printf(" %-1p %-2p ", 0, 0);
	else if (test_num == 47) ret = ft_printf(" %p ", -1);
	else if (test_num == 48) ret = ft_printf(" %p ", 1);
	else if (test_num == 49) ret = ft_printf(" %p ", 15);
	else if (test_num == 50) ret = ft_printf(" %p ", 16);
	else if (test_num == 51) ret = ft_printf(" %p ", 17);
	else if (test_num == 52) ret = ft_printf(" %p %p ", LONG_MIN, LONG_MAX);
	else if (test_num == 53) ret = ft_printf(" %p %p ", INT_MIN, INT_MAX);
	else if (test_num == 54) ret = ft_printf(" %p %p ", ULONG_MAX, -ULONG_MAX);
	else if (test_num == 55) ret = ft_printf(" %p %p ", 0, 0);
	printf("\n[RET: %d]", ret);
	return 0;
}