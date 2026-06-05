# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    check_file.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gemini-cli <gemini@tester.unit.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/23 18:26:01 by jtoty             #+#    #+#              #
#    Updated: 2026/06/03 12:00:00 by gemini-cli       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

check_makefile()
{
	printf "${BOLD}│ Makefile          │${DEFAULT}"
	if [ -e "${PATH_LIBFT}"/${MAKEFILE_VAR} ]
	then
		local wall="${COLOR_FAIL}❌${DEFAULT}"
		local wextra="${COLOR_FAIL}❌${DEFAULT}"
		local werror="${COLOR_FAIL}❌${DEFAULT}"
		grep -qw '\-Wall' "${PATH_LIBFT}"/${MAKEFILE_VAR} && wall="${COLOR_OK}✅${DEFAULT}"
		grep -qw '\-Wextra' "${PATH_LIBFT}"/${MAKEFILE_VAR} && wextra="${COLOR_OK}✅${DEFAULT}"
		grep -qw '\-Werror' "${PATH_LIBFT}"/${MAKEFILE_VAR} && werror="${COLOR_OK}✅${DEFAULT}"
		
		printf " Wall: $wall  Wextra: $wextra  Werror: $werror │\n"
	else
		printf " ${COLOR_FAIL}MISSING${DEFAULT}                         │\n"
	fi
}

check_header()
{
	printf "${BOLD}│ ft_printf.h       │${DEFAULT}"
	if [ -e "${PATH_LIBFT}"/${HEADER_DIR}/ft_printf.h ]
	then
		if [ ${OPT_NO_NORMINETTE} -eq 1 ]
		then
			printf " Norme: ${COLOR_WARNING}SKIP${DEFAULT}                   │\n"
		else
			NORME_VAR=$(norminette "${PATH_LIBFT}"/ft_printf.h 2>&1)
			if echo "$NORME_VAR" | grep -q command
			then
				printf " Norme: ${COLOR_WARNING}⚠️  NT${DEFAULT}                 │\n"
			elif echo "$NORME_VAR" | grep -qE '(Error|Warning)'
			then
				printf " Norme: ${COLOR_FAIL}❌ ERR${DEFAULT}                 │\n"
			else
				printf " Norme: ${COLOR_OK}✅ OK${DEFAULT}                  │\n"
			fi
		fi
	else
		printf " ${COLOR_FAIL}MISSING${DEFAULT}                         │\n"
	fi
}

check_readme()
{
	printf "${BOLD}│ README.md         │${DEFAULT}"
	if [ -e "${PATH_LIBFT}"/README.md ]
	then
		printf " ${COLOR_OK}✅ FOUND${DEFAULT}                       │\n"
	else
		printf " ${COLOR_FAIL}❌ MISSING${DEFAULT}                     │\n"
	fi
}

func_check_file()
{
	printf "\n${COLOR_PART}─── Preliminary File Checks ───${DEFAULT}\n"
	printf "${BOLD}┌───────────────────┬───────────────────────────────────┐${DEFAULT}\n"
	check_makefile
	check_header
	check_readme
	printf "${BOLD}└───────────────────┴───────────────────────────────────┘${DEFAULT}\n"
}
