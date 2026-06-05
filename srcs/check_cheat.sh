# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    check_cheat.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jtoty <jtoty@tester.unit.com>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/23 18:26:13 by jtoty             #+#    #+#              #
#    Updated: 2026/06/03 12:00:00 by gemini-cli       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

check_cheating()
{
	printf "\033[${CHEAT_COL}G"
	local lib_a="${PATH_LIBFT}/libftprintf.a"
	if [ ! -e "$lib_a" ]; then
		printf "  ${COLOR_FAIL}❌ NO LIB${DEFAULT}"
		return 1
	fi

	# List undefined symbols in the library
	# We expect: malloc, free, write, va_start, va_arg, va_copy, va_end
	local allowed="malloc|free|write|va_start|va_arg|va_copy|va_end|__stack_chk_fail|dyld_stub_binder"
	
	CHEAT_VAR=$(nm -u "$lib_a" | sed 's/^[[:space:]]*U[[:space:]]*//' | sed 's/^_//' | grep -vE "^($allowed)$")

	if [ "${CHEAT_VAR}" != "" ]
	then
		printf "  ${COLOR_FAIL}❌ FORBIDDEN${DEFAULT}"
		printf "Forbidden function call detected in libftprintf.a:\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
		printf "${CHEAT_VAR}\n\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
		retvalue=1
	else
		printf "  ${COLOR_OK}✅ CLEAN    ${DEFAULT}"
		retvalue=0
	fi
	return "$retvalue"
}
