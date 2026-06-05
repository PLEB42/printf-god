# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    diff_test.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gemini-cli <gemini@tester.unit.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/23 18:26:48 by jtoty             #+#    #+#              #
#    Updated: 2026/06/05 08:00:00 by gemini-cli       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

log_deepthought()
{
	local test_num=$1
	local test_dir=$2
	local format_str=$3
	local output_file="$test_dir/user_output_test$(printf "%02d" $test_num)"
	local expected_file="$test_dir/test$(printf "%02d" $test_num).output"
	
	# Clean format_str to avoid making it a 'copy-paste' solution
	local clean_call=$(echo "$format_str" | sed 's/ret = //')

	printf "\n[TEST %03d]: %s\n" "$test_num" "$clean_call" >> "${PATH_DEEPTHOUGHT}"/deepthought
	
	if diff "$output_file" "$expected_file" > /dev/null 2>&1; then
		printf "   Result: OK ✅\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
	else
		printf "   Result: KO ❌\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
		printf "   -------------------------------------------------\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
		printf "   System printf : |" >> "${PATH_DEEPTHOUGHT}"/deepthought
		cat -e "$expected_file" >> "${PATH_DEEPTHOUGHT}"/deepthought
		printf "   Your ft_printf: |" >> "${PATH_DEEPTHOUGHT}"/deepthought
		cat -e "$output_file" >> "${PATH_DEEPTHOUGHT}"/deepthought
		printf "   -------------------------------------------------\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
	fi
}

diff_test()
{
	return 0
}
