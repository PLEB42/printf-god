# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    check_compilation.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gemini-cli <gemini@tester.unit.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/23 18:26:19 by jtoty             #+#    #+#              #
#    Updated: 2026/06/03 12:00:00 by gemini-cli       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

compilation()
{
	if [ -e "${PATH_TEST}"/user_exe ]
	then
		rm -f "${PATH_TEST}"/user_exe
	fi
	
	local test_main="${PATH_TEST}/tests/${part_name}_functions/$(echo $1 | cut -d . -f 1)/main.c"
	local lib_a="${PATH_LIBFT}/libftprintf.a"

	printf "$> cc -Wextra -Wall -Werror -g3 main.c libftprintf.a -o user_exe\n" >> "${PATH_DEEPTHOUGHT}"/deepthought

	cc -Wextra -Wall -Werror -g3 "$test_main" "$lib_a" \
		  -I "${PATH_LIBFT}/${HEADER_DIR}" \
		  -I "${PATH_LIBFT}" \
		  -I "${PATH_TEST}" \
		  -I . \
		  2>>"${PATH_DEEPTHOUGHT}"/deepthought -o user_exe
}

check_compilation()
{
	printf "\033[${COMPIL_COL}G"
	if [ -e "${PATH_TEST}"/user_exe ]
	then
		printf " ✅ OK "
		return 1
	else
		printf " ❌ ERR"
		return 0
	fi
}
