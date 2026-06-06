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
		ret = ft_printf("%s", "abc");
	else if (test_num == 2)
		ret = ft_printf("111%s333", "222");
	else if (test_num == 3)
		ret = ft_printf("%s333", "222");
	else if (test_num == 4)
		ret = ft_printf("111%s", "222");
	else if (test_num == 5)
		ret = ft_printf("{%s}", "");
	else if (test_num == 6)
		ret = ft_printf("111%s333%s555", "222", "444");
	else if (test_num == 7)
		ret = ft_printf("111%s333%s555%saaa%sccc", "222", "444", "666", "bbb");
	else if (test_num == 8)
		ret = ft_printf("%s%s%s%s%s", "1", "2", "3", "4", "5");
	else if (test_num == 9)
		ret = ft_printf("s: %s, p: %p, d:%d", "a string", &test_moulitest_06, 42);
	else if (test_num == 10)
		ret = ft_printf("%s%p%d%d%p%s%p%p%s", "a", &free, 1, 2, &malloc, "b", &free, &malloc, "c");
	else if (test_num == 11)
		ret = ft_printf("%s %d %p %% %x", "bonjour ", 42, &free, 42);
	else if (test_num == 12)
		ret = ft_printf("%.4s", "42");
	else if (test_num == 13)
		ret = ft_printf("%.4s", "42 is the answer");
	else if (test_num == 14)
		ret = ft_printf("%15.4s", "42");
	else if (test_num == 15)
		ret = ft_printf("%15.4s", "I am 42");
	else if (test_num == 16)
		ret = ft_printf("%15.4s", "42 is the answer");
	else if (test_num == 17)
		ret = ft_printf("%4.15s", "42");
	else if (test_num == 18)
		ret = ft_printf("%4.15s", "I am 42");
	else if (test_num == 19)
		ret = ft_printf("%4.15s", "42 is the answer");
	else if (test_num == 20)
		ret = ft_printf("%4.s", "42");
	else if (test_num == 21)
		ret = ft_printf("%ls", L"hello");
	else if (test_num == 22)
		ret = ft_printf("%1$s", NULL);
	else if (test_num == 23)
		ret = ft_printf("%-s", "hello");
	else if (test_num == 24)
		ret = ft_printf("%-s", NULL);
	else if (test_num == 25)
		ret = ft_printf("%23s", NULL);
	else if (test_num == 26)
		ret = ft_printf("%.s", NULL);
	else if (test_num == 27)
		ret = ft_printf("%s", NULL);
	else if (test_num == 28)
		ret = ft_printf("hello, %s.", "gavin");
	else if (test_num == 29)
		ret = ft_printf("%s", "testing testing");
	else if (test_num == 30)
		ret = ft_printf("%s%s", "hello", "world");
	else if (test_num == 31)
		ret = ft_printf("..%s stuff %s", "a", "b");
	else if (test_num == 32)
		ret = ft_printf("this %s is empty", "");
	else if (test_num == 33)
		ret = ft_printf("this %s is %s", "hello", "");
	else if (test_num == 34)
		ret = ft_printf("this %s is %s", "", "hello");
	else if (test_num == 35)
		ret = ft_printf("%s%s%s", "1", "2", "3's a charm");
	else if (test_num == 36)
		ret = ft_printf("%32s", "abc");
	else if (test_num == 37)
		ret = ft_printf("%16s", "nark nark");
	else if (test_num == 38)
		ret = ft_printf("%5s", "goes over");
	else if (test_num == 39)
		ret = ft_printf("%-32s", "abc");
	else if (test_num == 40)
		ret = ft_printf("%-16s", "nark nark");
	else if (test_num == 41)
		ret = ft_printf("%-5s", "goes over");
	else if (test_num == 42)
		ret = ft_printf("%.7s", "hello");
	else if (test_num == 43)
		ret = ft_printf("%.3s", "hello");
	else if (test_num == 44)
		ret = ft_printf("%.s", "hello");
	else if (test_num == 45)
		ret = ft_printf("%.0s", "hello");
	else if (test_num == 46)
		ret = ft_printf("%.3s%.2s", "holla", "bitch");
	else if (test_num == 47)
		ret = ft_printf("%.2s%.7s", "hello", "world");
	else if (test_num == 48)
		ret = ft_printf("%.7s%.2s", "hello", "world");
	else if (test_num == 49)
		ret = ft_printf("%.5s%7s", "yo", "boi");
	else if (test_num == 50)
		ret = ft_printf("%7.5s", "yolo");
	else if (test_num == 51)
		ret = ft_printf("%7.5s", "bombastic");
	else if (test_num == 52)
		ret = ft_printf("%-7.5s", "yolo");
	else if (test_num == 53)
		ret = ft_printf("%-7.5s", "tubular");
	else if (test_num == 54)
		ret = ft_printf("%7.7s%7.7s", "hello", "world");
	else if (test_num == 55)
		ret = ft_printf("%3.7s%7.7s", "hello", "world");
	else if (test_num == 56)
		ret = ft_printf("%7.7s%3.7s", "hello", "world");
	else if (test_num == 57)
		ret = ft_printf("%3.7s%3.7s", "hello", "world");
	else if (test_num == 58)
		ret = ft_printf("%7.3s%7.7s", "hello", "world");
	else if (test_num == 59)
		ret = ft_printf("%3.3s%7.7s", "hello", "world");
	else if (test_num == 60)
		ret = ft_printf("%7.3s%3.7s", "hello", "world");
	else if (test_num == 61)
		ret = ft_printf("%3.3s%3.7s", "hello", "world");
	else if (test_num == 62)
		ret = ft_printf("%7.7s%7.3s", "hello", "world");
	else if (test_num == 63)
		ret = ft_printf("%3.7s%7.3s", "hello", "world");
	else if (test_num == 64)
		ret = ft_printf("%7.7s%3.3s", "hello", "world");
	else if (test_num == 65)
		ret = ft_printf("%3.7s%3.3s", "hello", "world");
	else if (test_num == 66)
		ret = ft_printf("%7.3s%7.3s", "hello", "world");
	else if (test_num == 67)
		ret = ft_printf("%3.3s%7.3s", "hello", "world");
	else if (test_num == 68)
		ret = ft_printf("%7.3s%3.3s", "hello", "world");
	else if (test_num == 69)
		ret = ft_printf("%3.3s%3.3s", "hello", "world");
	else if (test_num == 70)
		ret = ft_printf("%3s%3s", "hello", "world");
	else if (test_num == 71)
		ret = ft_printf("%-7s%5s", "hello", "world");
	else if (test_num == 72)
		ret = ft_printf("%7s%-5s", "hello", "world");
	else if (test_num == 73)
		ret = ft_printf("hello, %s.", NULL);
	else if (test_num == 74)
		ret = ft_printf("%s", NULL);
	else if (test_num == 75)
		ret = ft_printf("%32s", NULL);
	else if (test_num == 76)
		ret = ft_printf("%2s", NULL);
	else if (test_num == 77)
		ret = ft_printf("%-32s", NULL);
	else if (test_num == 78)
		ret = ft_printf("%-16s", NULL);
	else if (test_num == 79)
		ret = ft_printf("%-3s", NULL);
	else if (test_num == 80)
		ret = ft_printf("%.9s", "NULL");
	else if (test_num == 81)
		ret = ft_printf("%.3s", "NULL");
	else if (test_num == 82)
		ret = ft_printf("%.s", "NULL");
	else if (test_num == 83)
		ret = ft_printf("%.0s", "NULL");
	else if (test_num == 84)
		ret = ft_printf("%s", s_hidden);
	else if (test_num == 85)
		ret = ft_printf("%3s", s_hidden);
	else if (test_num == 86)
		ret = ft_printf("%9s", s_hidden);
	else if (test_num == 87)
		ret = ft_printf("%.s", s_hidden);
	else if (test_num == 88)
		ret = ft_printf("%.9s", s_hidden);
	else if (test_num == 89)
		ret = ft_printf("%.03s", s_hidden);
	else if (test_num == 90)
		ret = ft_printf("%.09s", s_hidden);
	else if (test_num == 91)
		ret = ft_printf("%.03s", NULL);
	else if (test_num == 92)
		ret = ft_printf("%.09s", NULL);
	else if (test_num == 93)
		ret = ft_printf("%.00s", "\0");
	else if (test_num == 94)
		ret = ft_printf("%.01s", "\0");
	else if (test_num == 95)
		ret = ft_printf("%.03s", "\0");
	else if (test_num == 96)
		ret = ft_printf("%.09s", "\0");
	else if (test_num == 97)
		ret = ft_printf("%3.s", s_hidden);
	else if (test_num == 98)
		ret = ft_printf("%10.s", s_hidden);
	else if (test_num == 99)
		ret = ft_printf("%3.s", NULL);
	else if (test_num == 100)
		ret = ft_printf("%10.s", NULL);
	else if (test_num == 101)
		ret = ft_printf("%1.s", "\0");
	else if (test_num == 102)
		ret = ft_printf("%2.s", "\0");
	else if (test_num == 103)
		ret = ft_printf("%9.s", "\0");
	else if (test_num == 104)
		ret = ft_printf("%-3.s", s_hidden);
	else if (test_num == 105)
		ret = ft_printf("%-8.s", s_hidden);
	else if (test_num == 106)
		ret = ft_printf("%-3.s", NULL);
	else if (test_num == 107)
		ret = ft_printf("%-8.s", NULL);
	else if (test_num == 108)
		ret = ft_printf("%-1.s", "\0");
	else if (test_num == 109)
		ret = ft_printf("%-2.s", "\0");
	else if (test_num == 110)
		ret = ft_printf("%-6.s", "\0");
	else if (test_num == 111)
		ret = ft_printf("%3.1s", s_hidden);
	else if (test_num == 112)
		ret = ft_printf("%10.1s", s_hidden);
	else if (test_num == 113)
		ret = ft_printf("%3.1s", NULL);
	else if (test_num == 114)
		ret = ft_printf("%9.1s", NULL);
	else if (test_num == 115)
		ret = ft_printf("%-3.1s", s_hidden);
	else if (test_num == 116)
		ret = ft_printf("%-10.1s", s_hidden);
	else if (test_num == 117)
		ret = ft_printf("%-3.1s", NULL);
	else if (test_num == 118)
		ret = ft_printf("%-9.1s", NULL);
	else if (test_num == 119)
		ret = ft_printf("%-3.1s", "\0");
	else if (test_num == 120)
		ret = ft_printf("%-6.1s", "\0");
	else if (test_num == 121)
		ret = ft_printf("%3.6s", s_hidden);
	else if (test_num == 122)
		ret = ft_printf("%20.6s", s_hidden);
	else if (test_num == 123)
		ret = ft_printf("%3.6s", NULL);
	else if (test_num == 124)
		ret = ft_printf("%20.6s", NULL);
	else if (test_num == 125)
		ret = ft_printf("%3.6s", "\0");
	else if (test_num == 126)
		ret = ft_printf("%6.6s", "\0");
	else if (test_num == 127)
		ret = ft_printf("%-3.6s", s_hidden);
	else if (test_num == 128)
		ret = ft_printf("%-20.6s", s_hidden);
	else if (test_num == 129)
		ret = ft_printf("%-3.8s", s_hidden);
	else if (test_num == 130)
		ret = ft_printf("%-10.8s", s_hidden);
	else if (test_num == 131)
		ret = ft_printf("%-3.8s", NULL);
	else if (test_num == 132)
		ret = ft_printf("%-10.8s", NULL);
	else if (test_num == 133)
		ret = ft_printf("%-.00s", s_hidden);
	else if (test_num == 134)
		ret = ft_printf("%-.09s", s_hidden);
	else if (test_num == 135)
		ret = ft_printf("p1 %.4s\n", "cccc");
	else if (test_num == 136)
		ret = ft_printf("p2 %.10s\n", "cccc");
	else if (test_num == 137)
		ret = ft_printf("p3 %.4s\n", NULL);
	else if (test_num == 138)
		ret = ft_printf("p4 %.5s\n", "aaaaa");
	else if (test_num == 139)
		ret = ft_printf("Hello 42 school! %s", NULL);
	else if (test_num == 140)
		ret = ft_printf("%50.2s", "Coucou");
	else if (test_num == 141)
		ret = ft_printf("%50.2s", NULL);
	else if (test_num == 142)
		ret = ft_printf("%5.0s", "Hello");
	else if (test_num == 143)
		ret = ft_printf("%.1s", "Test");
	else if (test_num == 144)
		ret = ft_printf("%10s", NULL);
	else if (test_num == 145)
		ret = ft_printf("%10s", "Ok");
	else if (test_num == 146)
		ret = ft_printf("taaa %100s\n", "hello");
	else if (test_num == 147)
		ret = ft_printf("%s",       "Hallo heimur");
	else if (test_num == 148)
		ret = ft_printf("%1s",      "Hallo heimur");
	else if (test_num == 149)
		ret = ft_printf("%20s",      "Hallo");
	else if (test_num == 150)
		ret = ft_printf("%.20s",      "Hallo heimur");
	else if (test_num == 151)
		ret = ft_printf("%20.5s",     "Hallo heimur");
	else if (test_num == 152)
		ret = ft_printf("%.0s",        "Hallo heimur");
	else if (test_num == 153)
		ret = ft_printf("%20.0s",      "Hallo heimur");
	else if (test_num == 154)
		ret = ft_printf("%.s",         "Hallo heimur");
	else if (test_num == 155)
		ret = ft_printf("%20.s",       "Hallo heimur");
	else if (test_num == 156)
		ret = ft_printf("%.s", "");
	else if (test_num == 157)
		ret = ft_printf(" %.1s", "");
	else if (test_num == 158)
		ret = ft_printf("%.1s ", "");
	else if (test_num == 159)
		ret = ft_printf(" %.s ", "");
	else if (test_num == 160)
		ret = ft_printf(" %.s ", "-");
	else if (test_num == 161)
		ret = ft_printf(" %.2s %.1s ", "", "-");
	else if (test_num == 162)
		ret = ft_printf(" %.3s %.2s ", " - ", "");
	else if (test_num == 163)
		ret = ft_printf(" %.1s %.2s %.3s %.4s ", " - ", "", "4", "");
	else if (test_num == 164)
		ret = ft_printf(" %.2s %.3s %.4s %.5s %.1s ", " - ", "", "4", "", "2 ");
	else if (test_num == 165)
		ret = ft_printf("%1s", "");
	else if (test_num == 166)
		ret = ft_printf("%-1s", "");
	else if (test_num == 167)
		ret = ft_printf(" %-2s", "");
	else if (test_num == 168)
		ret = ft_printf("%-3s ", "");
	else if (test_num == 169)
		ret = ft_printf(" %-0s ", "");
	else if (test_num == 170)
		ret = ft_printf(" %-s ", "-");
	else if (test_num == 171)
		ret = ft_printf(" %-1s %-2s ", "", "-");
	else if (test_num == 172)
		ret = ft_printf(" %-3s %-4s ", " - ", "");
	else if (test_num == 173)
		ret = ft_printf(" %-2s %-3s %-4s %-5s ", " - ", "", "4", "");
	else if (test_num == 174)
		ret = ft_printf(" %-3s %-3s %-4s %-5s %-3s ", " - ", "", "4", "", "2 ");
	else if (test_num == 175)
		ret = ft_printf("%s", "");
	else if (test_num == 176)
		ret = ft_printf(" %s", "");
	else if (test_num == 177)
		ret = ft_printf("%s ", "");
	else if (test_num == 178)
		ret = ft_printf(" %s ", "");
	else if (test_num == 179)
		ret = ft_printf(" %s ", "-");
	else if (test_num == 180)
		ret = ft_printf(" %s %s ", "", "-");
	else if (test_num == 181)
		ret = ft_printf(" %s %s ", " - ", "");
	else if (test_num == 182)
		ret = ft_printf(" %s %s %s %s %s", " - ", "", "4", "", s2);
	else if (test_num == 183)
		ret = ft_printf(" %s %s %s %s %s ", " - ", "", "4", "", "2 ");
	else if (test_num == 184)
		ret = ft_printf(" NULL %s NULL ", NULL);
	else if (test_num == 185)
		ret = ft_printf("% s", "");
	else if (test_num == 186)
		ret = ft_printf(" % 1s", "");
	else if (test_num == 187)
		ret = ft_printf("% 1s ", "");
	else if (test_num == 188)
		ret = ft_printf(" % s ", "");
	else if (test_num == 189)
		ret = ft_printf(" % s ", "-");
	else if (test_num == 190)
		ret = ft_printf(" % s % s ", "", "-");
	else if (test_num == 191)
		ret = ft_printf(" % s % s ", " - ", "");
	else if (test_num == 192)
		ret = ft_printf(" % s % s % s % s ", " - ", "", "4", "");
	else if (test_num == 193)
		ret = ft_printf(" % s % s % s % s % s ", " - ", "", "4", "", "2 ");
	printf("\n[RET: %d]", ret);
	return 0;
}
