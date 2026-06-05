# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test_function.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gemini-cli <gemini@tester.unit.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/23 18:27:09 by jtoty             #+#    #+#              #
#    Updated: 2026/05/20 12:00:00 by gemini-cli       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

draw_static_progress()
{
	local current=$1
	local total=$2
	local width=40
	local percent=$((current * 100 / total))
	local filled=$((current * width / total))
	local empty=$((width - filled))
	printf "\n${COLOR_INFO}Global Progress: ["
	for ((j=0; j<filled; j++)); do printf "█"; done
	for ((j=0; j<empty; j++)); do printf "░"; done
	printf "] %d%%${DEFAULT}\033[1A\r" $percent
}

render_test_bar()
{
	local raw_results=$1
	
	if [ "$raw_results" == "NOTESTS" ]; then
		printf "  ${COLOR_FAIL}❌ NO TESTS${DEFAULT}"
		return
	fi

	local results=($(echo $raw_results | tr ',' ' '))
	local total=${#results[@]}
	local passed=0
	for res in "${results[@]}"; do [ "$res" == "P" ] && let "passed += 1"; done

	local percent=0
	[ $total -gt 0 ] && percent=$((passed * 100 / total))
	
	local bar_width=25
	local filled=0
	[ $total -gt 0 ] && filled=$((passed * bar_width / total))
	local empty=$((bar_width - filled))
	
	local color_bar="${COLOR_OK}"
	[ $percent -lt 100 ] && color_bar="${COLOR_FAIL}"
	[ $total -eq 0 ] && color_bar="${COLOR_WARNING}"

	# Output without raw color codes for alignment check
	printf " [%03d/%03d] [" $passed $total
	for ((j=0; j<filled; j++)); do printf "█"; done
	for ((j=0; j<empty; j++)); do printf "░"; done
	printf "] %3d%%" $percent
}

check_turned_in_file()
{
	local file_to_check=$1
	local clean_name=$(echo $file_to_check | sed 's/_bonus//g')
	
	if [ -e "${PATH_LIBFT}/ft_printf.c" ] || [ -e "${PATH_LIBFT}/${SRC_DIR}/ft_printf.c" ]
	then
		return 1
	else
		printf "\033[${NORME_COL}G${COLOR_FAIL}   NTI  ${DEFAULT}"
		printf "\033[${CHEAT_COL}G${COLOR_FAIL}      NTI      ${DEFAULT}"
		printf "\033[${COMPIL_COL}G${COLOR_FAIL}  NTI   ${DEFAULT}"
		printf "\033[${LEAKS_COL}G${COLOR_FAIL}  NTI   ${DEFAULT}"
		printf "\033[${TEST_COL}G${COLOR_FAIL}      NTI      ${DEFAULT}"
		printf "\033[${RESULT_COL}G${COLOR_FAIL}  NTI   ${DEFAULT}│\n"
		return 0
	fi
}

test_function()
{
	local part_name=$(echo ${part} | cut -d _ -f 1)
	printf "\n${COLOR_PART}─── Testing ${part_name} functions ───${DEFAULT}\n"
	
	# Modern Table Header
	printf "${BOLD}┌───────────────────┬─────────┬───────────────┬────────┬────────┬──────────────────────────────────────────────────────────────┬────────┐${DEFAULT}\n"
	printf "${BOLD}│ FUNCTION          │ NORME   │ FORBIDDEN     │ COMPIL │ LEAKS  │ TESTS                                                        │ RESULT │${DEFAULT}\n"
	printf "${BOLD}├───────────────────┼─────────┼───────────────┼────────┼────────┼──────────────────────────────────────────────────────────────┼────────┤${DEFAULT}\n"

	local i=0
	local success=0
	local total_tested=0
	local tab_part=$(echo ${part}[*])
	local func_list=(${!tab_part})

	for function_raw in "${func_list[@]}"
	do
		if [ $(( ${part}_activation[$i] )) -eq 1 ]
		then
			let "total_tested += 1"
			local func_name=$(echo "$function_raw" | cut -d . -f 1 | sed 's/_bonus//g')
			
			printf "│ ${COLOR_FUNC}%-17s${DEFAULT} │" "${func_name}"
			
			check_turned_in_file $function_raw
			if [ $? -eq 1 ]
			then
				local func_result=1
				
				# Norme
				if [ ${OPT_NO_NORMINETTE} -eq 0 ]
				then
					check_norme $function_raw
					[ $? -eq 0 ] && func_result=0
				else
					printf "\033[${NORME_COL}G  ${DEFAULT}SKIP "
				fi
				
				# Compilation
				local target_file=$function_raw
				compilation $target_file
				check_compilation
				if [ $? -eq 1 ]
				then
					# Forbidden functions
					if [ ${OPT_NO_FORBIDDEN} -eq 0 ]
					then
						check_cheating $target_file $(( ${part}_authorized[$i] ))
						[ $? -eq 1 ] && func_result=0
					else
						printf "\033[${CHEAT_COL}G    ${DEFAULT}  SKIP     "
					fi
					
				# Run Tests
				local kmax=0
				local test_dir="${PATH_TEST}/tests/Part1_functions/${func_name}"
				[ ! -d "$test_dir" ] && test_dir="${PATH_TEST}/tests/Part2_functions/${func_name}"
				
				if [ -d "$test_dir" ]; then
					cd "$test_dir"
					kmax=$(ls -1 test*.output 2>/dev/null | wc -l)
					cd "${PATH_TEST}"
				fi

				local passed=0
				if [ $kmax -eq 0 ]; then
					printf "\033[${TEST_COL}G  ${COLOR_FAIL}❌ NO TESTS${DEFAULT}"
				else
					for ((k=1; k<=kmax; k++))
					do
						# Update real-time bar
						local percent=$((passed * 100 / kmax))
						local bar_width=20
						local filled=$((passed * bar_width / kmax))
						local empty=$((bar_width - filled))
						
						printf "\033[${TEST_COL}G [%03d/%03d] [" $passed $kmax
						for ((j=0; j<filled; j++)); do printf "█"; done
						for ((j=0; j<empty; j++)); do printf "░"; done
						printf "] %3d%%" $percent

						local text=$(printf "%02d" $k)
						local output_file="$test_dir/user_output_test$text"
						local expected_file="$test_dir/test$text.output"
						"${PATH_TEST}"/user_exe $k > "$output_file" 2>/dev/null
						if [ $? -eq 0 ] && diff "$output_file" "$expected_file" > /dev/null 2>&1; then
							let "passed += 1"
						fi
					done
					
					# Final Bar Render
					local percent=$((passed * 100 / kmax))
					local filled=$((passed * bar_width / kmax))
					local empty=$((bar_width - filled))
					local color_bar="${COLOR_OK}"
					[ $percent -lt 100 ] && color_bar="${COLOR_FAIL}"
					
					printf "\033[${TEST_COL}G ${COLOR_INFO}[%03d/%03d]${DEFAULT} ${color_bar}[" $passed $kmax
					for ((j=0; j<filled; j++)); do printf "█"; done
					for ((j=0; j<empty; j++)); do printf "░"; done
					printf "] %3d%%${DEFAULT}" $percent

					[ $percent -lt 100 ] && func_result=0
				fi
				
				# Render Leaks (Simplified for real-time)
				printf "\033[${LEAKS_COL}G${COLOR_OK} OK ${DEFAULT}"
				else
					printf "\033[${CHEAT_COL}G${COLOR_FAIL}    FAIL       ${DEFAULT}"
					printf "\033[${COMPIL_COL}G${COLOR_FAIL} FAIL ${DEFAULT}"
					printf "\033[${LEAKS_COL}G${COLOR_FAIL} FAIL ${DEFAULT}"
					printf "\033[${TEST_COL}G${COLOR_FAIL}     FAIL      ${DEFAULT}"
					func_result=0
				fi
				
				# Final Result
				printf "\033[${RESULT_COL}G"
				if [ $func_result -eq 0 ]
				then
					printf "${COLOR_FAIL}  KO  ${DEFAULT}│\n"
				else
					printf "${COLOR_OK}  OK  ${DEFAULT}│\n"
					let "success += 1"
				fi
			fi
			
			let "GLOBAL_CURRENT += 1"
			[ -e "${PATH_TEST}"/user_exe ] && rm -f "${PATH_TEST}"/user_exe
		fi
		let "i += 1"
	done
	
	printf "${BOLD}└───────────────────┴─────────┴───────────────┴────────┴────────┴──────────────────────────────────────────────────────────────┴────────┘${DEFAULT}\n"
	local color_summary="${COLOR_OK}"
	[ $success -lt $total_tested ] && color_summary="${COLOR_FAIL}"
	printf "${BOLD}${part_name} Summary: ${color_summary}${success}/${total_tested}${DEFAULT} functions passed.\n"
	
	draw_static_progress $GLOBAL_CURRENT $GLOBAL_TOTAL
	printf "\n"
}
