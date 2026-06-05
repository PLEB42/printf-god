# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    compil_lib.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gemini-cli <gemini@tester.unit.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/23 18:26:36 by jtoty             #+#    #+#              #
#    Updated: 2026/06/03 12:00:00 by gemini-cli       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

func_compil_lib()
{
	printf "\n${COLOR_PART}─── Checking & Compiling libftprintf.a ───${DEFAULT}\n"
	
	if [ -e "${PATH_LIBFT}"/libftprintf.a ]; then
		rm -f "${PATH_LIBFT}"/libftprintf.a
	fi

	if [ "${MAKEFILE_VAR}" == "missing_makefile" ]; then
		printf "${COLOR_FAIL}❌ Missing Makefile, cannot compile library.${DEFAULT}\n"
		printf "\nMissing Makefile, can't compil library.\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
		return
	fi

	printf "${BOLD}┌───────────────────┬────────────┐${DEFAULT}\n"
	
	local rules=("all" "clean" "fclean" "re")
	
	for rule in "${rules[@]}"
	do
		printf "${BOLD}│ make %-12s │${DEFAULT}" "$rule"
		
		local pattern=$(echo "$rule" | sed 's/\$/\\\$/g')
		if grep -E "^${pattern}[[:space:]]*:" "${PATH_LIBFT}"/${MAKEFILE_VAR} > /dev/null 2>&1
		then
			printf "\n$> make bonus\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
			make --no-print-directory -C "${PATH_LIBFT}" bonus >> "${PATH_DEEPTHOUGHT}"/deepthought 2>&1
			if [ $? -eq 0 ]; then
				printf " ${COLOR_OK}✅ OK${DEFAULT}       │\n"
			else
				printf " ${COLOR_FAIL}❌ ERR${DEFAULT}      │\n"
			fi
		else
			printf " ${COLOR_WARNING}⚠️  MISSING${DEFAULT}  │\n"
		fi
	done

	printf "${BOLD}├───────────────────┼────────────┤${DEFAULT}\n"
	printf "${BOLD}│ Result: libftprintf.a │${DEFAULT}"
	
	make --no-print-directory -C "${PATH_LIBFT}" all >> "${PATH_DEEPTHOUGHT}"/deepthought 2>&1
	
	if [ -e "${PATH_LIBFT}"/libftprintf.a ]; then
		printf " ${COLOR_OK}✅ FOUND${DEFAULT}    │\n"
	else
		printf " ${COLOR_FAIL}❌ MISSING${DEFAULT}  │\n"
	fi
	printf "${BOLD}└───────────────────┴────────────┘${DEFAULT}\n"
}
