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
		ret = ft_printf("{%10d}", 42);
	else if (test_num == 2)
		ret = ft_printf("{%4d}", 10000);
	else if (test_num == 3)
		ret = ft_printf("{%30d}", 10000);
	else if (test_num == 4)
		ret = ft_printf("{%10d}", -42);
	else if (test_num == 5)
		ret = ft_printf("{%-10d}", 42);
	else if (test_num == 6)
		ret = ft_printf("{%-4d}", 10000);
	else if (test_num == 7)
		ret = ft_printf("{%-30d}", 10000);
	else if (test_num == 8)
		ret = ft_printf("{%010d}", -42);
	else if (test_num == 9)
		ret = ft_printf("{%04d}", 10000);
	else if (test_num == 10)
		ret = ft_printf("{%030d}", 10000);
	else if (test_num == 11)
		ret = ft_printf("%+d", 42);
	else if (test_num == 12)
		ret = ft_printf("%+d", -42);
	else if (test_num == 13)
		ret = ft_printf("% d", 9999);
	else if (test_num == 14)
		ret = ft_printf("% d", -9999);
	else if (test_num == 15)
		ret = ft_printf("{%+03d}", 0);
	else if (test_num == 16)
		ret = ft_printf("{% 03d}", 0);
	else if (test_num == 17)
		ret = ft_printf("{%+03d}", 12);
	else if (test_num == 18)
		ret = ft_printf("{%+03d}", 123456);
	else if (test_num == 19)
		ret = ft_printf("{%03.2d}", 0);
	else if (test_num == 20)
		ret = ft_printf("%.4d", 42);
	else if (test_num == 21)
		ret = ft_printf("%.4d", 424242);
	else if (test_num == 22)
		ret = ft_printf("%.4d", -424242);
	else if (test_num == 23)
		ret = ft_printf("%15.4d", 42);
	else if (test_num == 24)
		ret = ft_printf("%15.4d", 424242);
	else if (test_num == 25)
		ret = ft_printf("%8.4d", 424242424);
	else if (test_num == 26)
		ret = ft_printf("%15.4d", -42);
	else if (test_num == 27)
		ret = ft_printf("%15.4d", -424242);
	else if (test_num == 28)
		ret = ft_printf("%8.4d", -424242424);
	else if (test_num == 29)
		ret = ft_printf("%4.15d", 42);
	else if (test_num == 30)
		ret = ft_printf("%4.15d", 424242);
	else if (test_num == 31)
		ret = ft_printf("%4.8d", 424242424);
	else if (test_num == 32)
		ret = ft_printf("%4.15d", -42);
	else if (test_num == 33)
		ret = ft_printf("%4.15d", -424242);
	else if (test_num == 34)
		ret = ft_printf("%4.8d", -424242424);
	else if (test_num == 35)
		ret = ft_printf("%.d, %.0d", 0, 0);
	else if (test_num == 36)
		ret = ft_printf("%.10d", -42);
	else if (test_num == 37)
		ret = ft_printf("%++d", 42);
	else if (test_num == 38)
		ret = ft_printf("%  d", 42);
	else if (test_num == 39)
		ret = ft_printf("%--5d", 42);
	else if (test_num == 40)
		ret = ft_printf("%-+-5d", 42);
	else if (test_num == 41)
		ret = ft_printf("this % d number", 17);
	else if (test_num == 42)
		ret = ft_printf("this % d number", -267);
	else if (test_num == 43)
		ret = ft_printf("this % d number", 0);
	else if (test_num == 44)
		ret = ft_printf("%+d", 5);
	else if (test_num == 45)
		ret = ft_printf("%+d", -7);
	else if (test_num == 46)
		ret = ft_printf("%+d", 2147483647);
	else if (test_num == 47)
		ret = ft_printf("%+5d", 35);
	else if (test_num == 48)
		ret = ft_printf("%+7d", 0);
	else if (test_num == 49)
		ret = ft_printf("%+24d", 2147483647);
	else if (test_num == 50)
		ret = ft_printf("%+.7d", 234);
	else if (test_num == 51)
		ret = ft_printf("%+.7d", -446);
	else if (test_num == 52)
		ret = ft_printf("%+.3d", 3723);
	else if (test_num == 53)
		ret = ft_printf("%+05d", 432);
	else if (test_num == 54)
		ret = ft_printf("%+04d", 0);
	else if (test_num == 55)
		ret = ft_printf("%+8.5d", 34);
	else if (test_num == 56)
		ret = ft_printf("%+10.5d", -216);
	else if (test_num == 57)
		ret = ft_printf("%+8.5d", 0);
	else if (test_num == 58)
		ret = ft_printf("%+8.3d", 8375);
	else if (test_num == 59)
		ret = ft_printf("%+8.3d", -8473);
	else if (test_num == 60)
		ret = ft_printf("%+3.7d", 3267);
	else if (test_num == 61)
		ret = ft_printf("%+3.7d", -2375);
	else if (test_num == 62)
		ret = ft_printf("%+3.3d", 6983);
	else if (test_num == 63)
		ret = ft_printf("%+3.3d", -8462);
	else if (test_num == 64)
		ret = ft_printf("%+-8.5d", 34);
	else if (test_num == 65)
		ret = ft_printf("%+-10.5d", -216);
	else if (test_num == 66)
		ret = ft_printf("%+-8.5d", 0);
	else if (test_num == 67)
		ret = ft_printf("%+-8.3d", 8375);
	else if (test_num == 68)
		ret = ft_printf("%+-8.3d", -8473);
	else if (test_num == 69)
		ret = ft_printf("%+-3.7d", 3267);
	else if (test_num == 70)
		ret = ft_printf("%+-3.7d", -2375);
	else if (test_num == 71)
		ret = ft_printf("%+-3.3d", 6983);
	else if (test_num == 72)
		ret = ft_printf("%+-3.3d", -8462);
	else if (test_num == 73)
		ret = ft_printf("%0+8.5d", 34);
	else if (test_num == 74)
		ret = ft_printf("%0+10.5d", -216);
	else if (test_num == 75)
		ret = ft_printf("%0+8.5d", 0);
	else if (test_num == 76)
		ret = ft_printf("%0+8.3d", 8375);
	else if (test_num == 77)
		ret = ft_printf("%0+8.3d", -8473);
	else if (test_num == 78)
		ret = ft_printf("%0+3.7d", 3267);
	else if (test_num == 79)
		ret = ft_printf("%0+3.7d", -2375);
	else if (test_num == 80)
		ret = ft_printf("%0+3.3d", 6983);
	else if (test_num == 81)
		ret = ft_printf("%0+3.3d", -8462);
	else if (test_num == 82)
		ret = ft_printf("%hhd", (char)45);
	else if (test_num == 83)
		ret = ft_printf("%hhd", (char)-45);
	else if (test_num == 84)
		ret = ft_printf("%hhd", ch_pos_1);
	else if (test_num == 85)
		ret = ft_printf("%hhd", ch_neg_1);
	else if (test_num == 86)
		ret = ft_printf("%hhd", (char)127);
	else if (test_num == 87)
		ret = ft_printf("%hhd", (char)(-128));
	else if (test_num == 88)
		ret = ft_printf("%037ld", 22337203685477l);
	else if (test_num == 89)
		ret = ft_printf("%.37ld", -22337203685477l);
	else if (test_num == 90)
		ret = ft_printf("%37lld", 522337203685470ll);
	else if (test_num == 91)
		ret = ft_printf("%-37lld", -522337203685470ll);
	else if (test_num == 92)
		ret = ft_printf("%+ld", 22337203685477l);
	else if (test_num == 93)
		ret = ft_printf("[%d] [%hhd]", i_pos_1, ch_pos_1);
	else if (test_num == 94)
		ret = ft_printf("this % d number", 17);
	else if (test_num == 95)
		ret = ft_printf("this % d number", -267);
	else if (test_num == 96)
		ret = ft_printf("this % d number", 0);
	else if (test_num == 97)
		ret = ft_printf("% d", 3);
	else if (test_num == 98)
		ret = ft_printf("% d", -1);
	else if (test_num == 99)
		ret = ft_printf("% d", 0);
	else if (test_num == 100)
		ret = ft_printf("this % d number", 17);
	else if (test_num == 101)
		ret = ft_printf("this % d number", -267);
	else if (test_num == 102)
		ret = ft_printf("this % d number", 0);
	else if (test_num == 103)
		ret = ft_printf("% d", 2147483647);
	else if (test_num == 104)
		ret = ft_printf("% d", (int)(-2147483678));
	else if (test_num == 105)
		ret = ft_printf("% 7d", 33);
	else if (test_num == 106)
		ret = ft_printf("% 7d", -14);
	else if (test_num == 107)
		ret = ft_printf("% 3d", 0);
	else if (test_num == 108)
		ret = ft_printf("% 5d", 52625);
	else if (test_num == 109)
		ret = ft_printf("% 5d", -2562);
	else if (test_num == 110)
		ret = ft_printf("% 4d", 94827);
	else if (test_num == 111)
		ret = ft_printf("% 4d", -2464);
	else if (test_num == 112)
		ret = ft_printf("% -7d", 33);
	else if (test_num == 113)
		ret = ft_printf("% -7d", -14);
	else if (test_num == 114)
		ret = ft_printf("% -3d", 0);
	else if (test_num == 115)
		ret = ft_printf("% -5d", 52625);
	else if (test_num == 116)
		ret = ft_printf("% -5d", -2562);
	else if (test_num == 117)
		ret = ft_printf("% -4d", 94827);
	else if (test_num == 118)
		ret = ft_printf("% -4d", -2464);
	else if (test_num == 119)
		ret = ft_printf("% .5d", 2);
	else if (test_num == 120)
		ret = ft_printf("% .6d", -3);
	else if (test_num == 121)
		ret = ft_printf("% .3d", 0);
	else if (test_num == 122)
		ret = ft_printf("% .4d", 5263);
	else if (test_num == 123)
		ret = ft_printf("% .4d", -2372);
	else if (test_num == 124)
		ret = ft_printf("% .3d", 13862);
	else if (test_num == 125)
		ret = ft_printf("% .3d",-23646);
	else if (test_num == 126)
		ret = ft_printf("% 05d", 43);
	else if (test_num == 127)
		ret = ft_printf("% 07d", -54);
	else if (test_num == 128)
		ret = ft_printf("% 03d", 0);
	else if (test_num == 129)
		ret = ft_printf("% 03d", 634);
	else if (test_num == 130)
		ret = ft_printf("% 04d", -532);
	else if (test_num == 131)
		ret = ft_printf("% 04d", -4825);
	else if (test_num == 132)
		ret = ft_printf("% 8.5d", 34);
	else if (test_num == 133)
		ret = ft_printf("% 10.5d", -216);
	else if (test_num == 134)
		ret = ft_printf("% 8.5d", 0);
	else if (test_num == 135)
		ret = ft_printf("% 8.3d", 8375);
	else if (test_num == 136)
		ret = ft_printf("% 8.3d", -8473);
	else if (test_num == 137)
		ret = ft_printf("% 3.7d", 3267);
	else if (test_num == 138)
		ret = ft_printf("% 3.7d", -2375);
	else if (test_num == 139)
		ret = ft_printf("% 3.3d", 6983);
	else if (test_num == 140)
		ret = ft_printf("% 3.3d", -8462);
	else if (test_num == 141)
		ret = ft_printf("% -8.5d", 34);
	else if (test_num == 142)
		ret = ft_printf("% -10.5d", -216);
	else if (test_num == 143)
		ret = ft_printf("% -8.5d", 0);
	else if (test_num == 144)
		ret = ft_printf("% -8.3d", 8375);
	else if (test_num == 145)
		ret = ft_printf("% -8.3d", -8473);
	else if (test_num == 146)
		ret = ft_printf("% -3.7d", 3267);
	else if (test_num == 147)
		ret = ft_printf("% -3.7d", -2375);
	else if (test_num == 148)
		ret = ft_printf("% -3.3d", 6983);
	else if (test_num == 149)
		ret = ft_printf("% -3.3d", -8462);
	else if (test_num == 150)
		ret = ft_printf("% 08.5d", 34);
	else if (test_num == 151)
		ret = ft_printf("% 010.5d", -216);
	else if (test_num == 152)
		ret = ft_printf("% 08.5d", 0);
	else if (test_num == 153)
		ret = ft_printf("% 08.3d", 8375);
	else if (test_num == 154)
		ret = ft_printf("% 08.3d", -8473);
	else if (test_num == 155)
		ret = ft_printf("% 03.7d", 3267);
	else if (test_num == 156)
		ret = ft_printf("% 03.7d", -2375);
	else if (test_num == 157)
		ret = ft_printf("% 03.3d", 6983);
	else if (test_num == 158)
		ret = ft_printf("% 03.3d", -8462);
	else if (test_num == 159)
		ret = ft_printf("% hhd", (char)45);
	else if (test_num == 160)
		ret = ft_printf("% hhd", (char)-45);
	else if (test_num == 161)
		ret = ft_printf("% hd", (short)385);
	else if (test_num == 162)
		ret = ft_printf("% hd", (short)-385);
	else if (test_num == 163)
		ret = ft_printf("% ld", (long)32);
	else if (test_num == 164)
		ret = ft_printf("% ld", (long)-32);
	else if (test_num == 165)
		ret = ft_printf("% lld", (long long)43);
	else if (test_num == 166)
		ret = ft_printf("% lld", (long long)-43);
	else if (test_num == 167)
		ret = ft_printf("% hhd", ch_pos_1);
	else if (test_num == 168)
		ret = ft_printf("% hhd", ch_neg_1);
	else if (test_num == 169)
		ret = ft_printf("% hd", sh_pos_1);
	else if (test_num == 170)
		ret = ft_printf("% hd", sh_neg_1);
	else if (test_num == 171)
		ret = ft_printf("% ld", l_pos_1);
	else if (test_num == 172)
		ret = ft_printf("% ld", l_neg_1);
	else if (test_num == 173)
		ret = ft_printf("% lld", ll_pos_1);
	else if (test_num == 174)
		ret = ft_printf("% lld", ll_neg_1);
	else if (test_num == 175)
		ret = ft_printf("% ld", 22337203685477l);
	else if (test_num == 176)
		ret = ft_printf("% ld", -22337203685477l);
	else if (test_num == 177)
		ret = ft_printf("% lld", 522337203685470ll);
	else if (test_num == 178)
		ret = ft_printf("% lld", -522337203685470ll);
	else if (test_num == 179)
		ret = ft_printf("% lld", 9223372036854775807ll);
	else if (test_num == 180)
		ret = ft_printf("% lld", llmin);
	else if (test_num == 181)
		ret = ft_printf("% ld", 9223372036854775807l);
	else if (test_num == 182)
		ret = ft_printf("% ld", lmin);
	else if (test_num == 183)
		ret = ft_printf("% hd", (short)32767);
	else if (test_num == 184)
		ret = ft_printf("% hd", (short)(-32768));
	else if (test_num == 185)
		ret = ft_printf("% hhd", (char)(127));
	else if (test_num == 186)
		ret = ft_printf("% hhd", (char)(-128));
	else if (test_num == 187)
		ret = ft_printf("%+.0d", 0);
		else if (test_num == 188)
		ret = ft_printf("{%500d}", 42);
	else if (test_num == 189)
		ret = ft_printf("{%-500d}", 42);
	else if (test_num == 190)
		ret = ft_printf("{%1000d}", -42);
	else if (test_num == 191)
		ret = ft_printf("{%-1000d}", -42);
	else if (test_num == 192)
		ret = ft_printf("%.500d", 42);
	else if (test_num == 193)
		ret = ft_printf("%.1000d", -42);
	else if (test_num == 194)
		ret = ft_printf("%600.500d", 42);
	else if (test_num == 195)
		ret = ft_printf("%500.600d", 42);
	else if (test_num == 196)
		ret = ft_printf("%+-d", 42);
	else if (test_num == 197)
		ret = ft_printf("%-+d", 42);
	else if (test_num == 198)
		ret = ft_printf("% 0d", 42);
	else if (test_num == 199)
		ret = ft_printf("%0 d", 42);
	else if (test_num == 200)
		ret = ft_printf("%-0d", 42);
	else if (test_num == 201)
		ret = ft_printf("%0-d", 42);
	else if (test_num == 202)
		ret = ft_printf("%+ 0d", 42);
	else if (test_num == 203)
		ret = ft_printf("% 0+d", 42);
	else if (test_num == 204)
		ret = ft_printf("%+- 0d", 42);
	else if (test_num == 205)
		ret = ft_printf("%010d", -42);
	else if (test_num == 206)
		ret = ft_printf("%05.3d", -42);
	else if (test_num == 207)
		ret = ft_printf("%010.5d", -123);
	else if (test_num == 208)
		ret = ft_printf("%+d", -2147483648);
	else if (test_num == 209)
		ret = ft_printf("%+d", 2147483647);
	else if (test_num == 210)
		ret = ft_printf("% d", -2147483648);
	else if (test_num == 211)
		ret = ft_printf("% d", 2147483647);
	else if (test_num == 212)
		ret = ft_printf("%015d", -2147483648);
	else if (test_num == 213)
		ret = ft_printf("%015d", 2147483647);
	else if (test_num == 214)
		ret = ft_printf("%.15d", -2147483648);
	else if (test_num == 215)
		ret = ft_printf("%.15d", 2147483647);
	else if (test_num == 216)
		ret = ft_printf("%+15.10d", -2147483648);
	else if (test_num == 217)
		ret = ft_printf("%+15.10d", 2147483647);
	else if (test_num == 218)
		ret = ft_printf("% 15.10d", -2147483648);
	else if (test_num == 219)
		ret = ft_printf("% 15.10d", 2147483647);
	else if (test_num == 220)
		ret = ft_printf("%-+15.10d", -2147483648);
	else if (test_num == 221)
		ret = ft_printf("%-+15.10d", 2147483647);
	else if (test_num == 222)
		ret = ft_printf("%.d", 0);
	else if (test_num == 223)
		ret = ft_printf("%.0d", 0);
	else if (test_num == 224)
		ret = ft_printf("%5.0d", 0);
	else if (test_num == 225)
		ret = ft_printf("%+5.0d", 0);
	else if (test_num == 226)
		ret = ft_printf("% 5.0d", 0);
	else if (test_num == 227)
		ret = ft_printf("%-5.0d", 0);
	else if (test_num == 228)
		ret = ft_printf("%-+5.0d", 0);
	else if (test_num == 229)
		ret = ft_printf("%500.250d", 123456);
	else if (test_num == 230)
		ret = ft_printf("%500.250d", -123456);
	else if (test_num == 231)
		ret = ft_printf("%+-500.250d", 123456);
	else if (test_num == 232)
		ret = ft_printf("%0500d", 123456);
	else if (test_num == 233)
		ret = ft_printf("%500.600d", 123456);
	else if (test_num == 234)
		ret = ft_printf("%500.600d", -123456);
	else if (test_num == 235)
		ret = ft_printf("%+-500.600d", 123456);
	else if (test_num == 236)
		ret = ft_printf("%0500d", 123456);
	else if (test_num == 237)
		ret = ft_printf("%750.250d", 123456);
	else if (test_num == 238)
		ret = ft_printf("%750.250d", -123456);
	else if (test_num == 239)
		ret = ft_printf("%+-750.250d", 123456);
	else if (test_num == 240)
		ret = ft_printf("%0750d", 123456);
	else if (test_num == 241)
		ret = ft_printf("%750.600d", 123456);
	else if (test_num == 242)
		ret = ft_printf("%750.600d", -123456);
	else if (test_num == 243)
		ret = ft_printf("%+-750.600d", 123456);
	else if (test_num == 244)
		ret = ft_printf("%0750d", 123456);
printf("\n[RET: %d]", ret);
	return 0;
}
