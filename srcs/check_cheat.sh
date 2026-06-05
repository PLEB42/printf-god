# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    check_cheat.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jtoty <jtoty@tester.unit.com>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/23 18:26:13 by jtoty             #+#    #+#              #
#    Updated: 2026/06/05 08:00:00 by gemini-cli       ###   ########.fr        #
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
	# We allow: malloc, free, write, va_start, va_arg, va_copy, va_end
	# We also MUST allow any 'ft_' function because students use their own libft.
	local allowed="malloc|free|write|va_start|va_arg|va_copy|va_end|__stack_chk_fail|dyld_stub_binder|exit"
	
	# Get all undefined symbols, but ignore those that are allowed or part of libft (ft_*)
	local forbidden=$(nm -u "$lib_a" 2>/dev/null | sed 's/^[[:space:]]*U[[:space:]]*//' | sed 's/^_//' | grep -vE "^($allowed)$" | grep -v "^ft_")

	if [ "${forbidden}" != "" ]
	then
		printf "  ${COLOR_FAIL}❌ FORBIDDEN${DEFAULT}"
		printf "External forbidden functions detected in libftprintf.a:\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
		printf "${forbidden}\n\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
		retvalue=1
	else
		printf "  ${COLOR_OK}✅ CLEAN    ${DEFAULT}"
		retvalue=0
	fi
	return "$retvalue"
}
