# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    diff_test.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gemini-cli <gemini@tester.unit.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/23 18:26:48 by jtoty             #+#    #+#              #
#    Updated: 2026/06/03 12:00:00 by gemini-cli       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

diff_test()
{
	local test_results=""
	local leak_found=0
	local test_dir="${PATH_TEST}/tests/$(echo ${part}tions)/$(echo $1 | cut -d . -f 1 | sed 's/_bonus//g')"
	
	if [ ! -d "$test_dir" ]; then
		echo "NOTESTS|0"
		return 0
	fi

	cd "$test_dir"
	local kmax=$(ls -1 test*.output 2>/dev/null | wc -l)
	cd "${PATH_TEST}"

	local k=1
	while [ $k -le $kmax ]
	do
		local text=$(printf "%02d" $k)
		local output_file="$test_dir/user_output_test$text"
		local expected_file="$test_dir/test$text.output"
		local valgrind_log="/tmp/leaks_ft_printf_${k}_$$.log"
		local sig=0

		# Run test
		if [ ${OPT_FAST} -eq 0 ]; then
			if [ "$(uname)" == "Darwin" ]; then
				leaks -quiet -atExit -- "${PATH_TEST}"/user_exe $k > "$output_file" 2>/dev/null
				sig=$?
				# Darwin check for leaks in output
				if [ -f "$output_file" ] && grep -qE "[1-9][0-9]* leaks?" "$output_file" 2>/dev/null; then sig=42; fi
			else
				valgrind --leak-check=full --error-exitcode=42 --log-file=$valgrind_log -q "${PATH_TEST}"/user_exe $k > "$output_file" 2>/dev/null
				sig=$?
			fi
			if [ $sig -eq 42 ]; then leak_found=1; fi
		else
			"${PATH_TEST}"/user_exe $k > "$output_file" 2>/dev/null
			sig=$?
		fi

		# Determine result
		if [ $sig -eq 134 ]; then test_results="${test_results}A,"
		elif [ $sig -eq 138 ]; then test_results="${test_results}B,"
		elif [ $sig -eq 139 ]; then test_results="${test_results}S,"
		elif [ $sig -eq 142 ]; then test_results="${test_results}T,"
		elif [ $sig -eq 42 ]; then test_results="${test_results}L,"
		else
			if [ ! -f "$output_file" ] || ! diff -U 3 "$output_file" "$expected_file" > /dev/null 2>&1; then
				test_results="${test_results}K,"
			else
				test_results="${test_results}P,"
			fi
		fi
		[ -f "$valgrind_log" ] && rm -f "$valgrind_log"
		let "k += 1"
	done

	echo "${test_results}|${leak_found}"
	return 1
}
