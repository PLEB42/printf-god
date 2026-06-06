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
	(void)test_num;
	printf("\n[RET: %d]", ret);
	return 0;
}
