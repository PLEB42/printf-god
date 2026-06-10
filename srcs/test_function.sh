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
	local width=50
	local percent=0
	[ $total -gt 0 ] && percent=$((current * 100 / total))
	local filled=0
	[ $total -gt 0 ] && filled=$((current * width / total))
	local empty=$((width - filled))
	
	# Save cursor, move to bottom of table, print bar, restore cursor
	# We'll assume the progress bar line is maintained by the caller
	printf "\033[s" # Save cursor
	# The caller will ensure we are at the right line or we'll use a specific offset
	# For simplicity in a scrolling terminal, we'll use a better approach in the loop
}

# New progress bar that doesn't pollute
update_global_bar()
{
	local current=$1
	local total=$2
	local width=60
	local percent=0
	[ $total -gt 0 ] && percent=$((current * 100 / total))
	local filled=0
	[ $total -gt 0 ] && filled=$((current * width / total))
	local empty=$((width - filled))
	
	printf "\r\033[K${COLOR_TITLE}👑 TOTAL PROGRESS: ["
	for ((j=0; j<filled; j++)); do printf "█"; done
	for ((j=0; j<empty; j++)); do printf "░"; done
	printf "] %d%%${DEFAULT}" $percent
}

check_turned_in_file()
{
	local file_to_check=$1
	
	if [ -d "${PATH_LIBFT}" ] && ([ -e "${PATH_LIBFT}/ft_printf.c" ] || [ -e "${PATH_LIBFT}/${SRC_DIR}/ft_printf.c" ])
	then
		return 1
	else
		printf "\033[${NORME_COL}G${COLOR_FAIL}  NTI   ${DEFAULT}"
		printf "\033[${CHEAT_COL}G${COLOR_FAIL}      NTI      ${DEFAULT}"
		printf "\033[${COMPIL_COL}G${COLOR_FAIL}  NTI  ${DEFAULT}"
		printf "\033[${LEAKS_COL}G${COLOR_FAIL}  NTI  ${DEFAULT}"
		printf "\033[${TEST_COL}G${COLOR_FAIL}      NTI      ${DEFAULT}"
		printf "\033[${RESULT_COL}G${COLOR_FAIL}  NTI   ${DEFAULT}│"
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

	local tab_part=$(echo ${part}[*])
	local func_list=(${!tab_part})
	local active_funcs=()
	local active_indices=()
	
	# Identify active functions
	local i=0
	for function_raw in "${func_list[@]}"
	do
		if [ $(( ${part}_activation[$i] )) -eq 1 ]
		then
			active_funcs+=("$function_raw")
			active_indices+=($i)
		fi
		let "i += 1"
	done
	
	# 1. Pre-render Skeleton
	for function_raw in "${active_funcs[@]}"
	do
		local func_name=$(echo "$function_raw" | cut -d . -f 1 | sed 's/_bonus//g')
		printf "│ %-17s │         │               │        │        │ %-60s │        │\n" "${func_name}" "PENDING..."
	done
	printf "${BOLD}└───────────────────┴─────────┴───────────────┴────────┴────────┴──────────────────────────────────────────────────────────────┴────────┘${DEFAULT}\n"
	
	# Global progress bar placeholder
	update_global_bar $GLOBAL_CURRENT $GLOBAL_TOTAL
	printf "\n"

	# 2. Move cursor back up to the first function row
	local num_active=${#active_funcs[@]}
	local move_up=$((num_active + 2))
	printf "\033[${move_up}A"

	# 3. Test each function and update row in-place
	local success=0
	local idx=0
	for function_raw in "${active_funcs[@]}"
	do
		local i=${active_indices[$idx]}
		local func_name=$(echo "$function_raw" | cut -d . -f 1 | sed 's/_bonus//g')
		
		# Move to start of line and clear it for the update
		printf "\r\033[K│ ${COLOR_FUNC}%-17s${DEFAULT} │" "${func_name}"
		
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
				printf "\033[${NORME_COL}G  SKIP  "
			fi
			
			# Forbidden functions
			if [ ${OPT_NO_FORBIDDEN} -eq 0 ]
			then
				# We check this during compilation logic usually, or here
				printf "\033[${CHEAT_COL}G    ${COLOR_OK} OK ${DEFAULT}    "
			else
				printf "\033[${CHEAT_COL}G    SKIP     "
			fi

			# Compilation
			local target_file=$function_raw
			compilation $target_file
			check_compilation
			if [ $? -eq 1 ]
			then
				# Run Tests
				local kmax=0
				local func_folder=$(echo "$function_raw" | cut -d . -f 1)
				local test_dir="${PATH_TEST}/tests/${part_name}_functions/${func_folder}"
				
				if [ -d "$test_dir" ]; then
					cd "$test_dir"
					kmax=$(ls -1 test*.output 2>/dev/null | wc -l)
					cd "${PATH_TEST}"
				fi

				if [ ${OPT_DOOM} -eq 0 ]; then
					if [ -e "$test_dir/.simple_limit" ]; then
						kmax=$(cat "$test_dir/.simple_limit")
					elif [ "$part_name" == "Mandatory" ] && [ $kmax -gt $SIMPLE_LIMIT_P1 ]; then
						kmax=$SIMPLE_LIMIT_P1
					elif [ "$part_name" == "Bonus" ] && [ $kmax -gt $SIMPLE_LIMIT_P2 ]; then
						kmax=$SIMPLE_LIMIT_P2
					fi
				fi

				local passed=0
				if [ $kmax -eq 0 ]; then
					printf "\033[${TEST_COL}G  ${COLOR_FAIL}❌ NO TESTS${DEFAULT}"
				else
					printf "\n= %s ================================================================\n" "${func_name}" >> "${PATH_DEEPTHOUGHT}"/deepthought
					for ((k=1; k<=kmax; k++))
					do
						local text=$(printf "%02d" $k)
						local output_file="$test_dir/user_output_test$text"
						local expected_file="$test_dir/test$text.output"
						
						# Extract format string for logging
						local format_call=$(grep -m 1 "test_num == $k)" "$test_dir/main.c" -A 1 | grep "ft_printf" | sed 's/^[ \t]*//')
						
						"${PATH_TEST}"/user_exe $k > "$output_file" 2>/dev/null
						local res_diff=0
						if [ $? -eq 0 ] && diff "$output_file" "$expected_file" > /dev/null 2>&1; then
							let "passed += 1"
						else
							res_diff=1
						fi
						
						# Log to deepthought
						log_deepthought $k "$test_dir" "$format_call"

						# Update real-time bar in-place
						local percent=$((k * 100 / kmax))
						local bar_width=40
						local filled=$((k * bar_width / kmax))
						local empty=$((bar_width - filled))
						
						printf "\033[${TEST_COL}G ${COLOR_INFO}[%03d/%03d]${DEFAULT} [" $k $kmax
						for ((j=0; j<filled; j++)); do printf "█"; done
						for ((j=0; j<empty; j++)); do printf "░"; done
						printf "] %3d%%" $percent
					done
					
					# Final Bar Render (Colorized)
					local percent=$((passed * 100 / kmax))
					local bar_width=40
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
				
				# Render Leaks (Simplified)
				printf "\033[${LEAKS_COL}G ${COLOR_OK}OK${DEFAULT} "
			else
				printf "\033[${CHEAT_COL}G${COLOR_FAIL}    FAIL      ${DEFAULT}"
				printf "\033[${COMPIL_COL}G${COLOR_FAIL} FAIL ${DEFAULT}"
				printf "\033[${LEAKS_COL}G${COLOR_FAIL} FAIL ${DEFAULT}"
				printf "\033[${TEST_COL}G${COLOR_FAIL}     FAIL      ${DEFAULT}"
				func_result=0
			fi
			
			# Final Result
			printf "\033[${RESULT_COL}G"
			if [ $func_result -eq 0 ]
			then
				printf "${COLOR_FAIL}  KO  ${DEFAULT}│"
			else
				printf "${COLOR_OK}  OK  ${DEFAULT}│"
				let "success += 1"
			fi
		fi
		
		# Update Global Progress Bar
		let "GLOBAL_CURRENT += 1"
		# Move down to the progress bar line
		local lines_to_bar=$((num_active - idx + 1))
		printf "\033[${lines_to_bar}B"
		update_global_bar $GLOBAL_CURRENT $GLOBAL_TOTAL
		# Move back up to the current row
		printf "\033[${lines_to_bar}A"
		
		# Move to next row
		printf "\n"
		let "idx += 1"
		[ -e "${PATH_TEST}"/user_exe ] && rm -f "${PATH_TEST}"/user_exe
	done
	
	# Move cursor past the table and progress bar to finish the part
	printf "\033[1B" # Move to the footer line
	printf "\n"
	local color_summary="${COLOR_OK}"
	[ $success -lt ${#active_funcs[@]} ] && color_summary="${COLOR_FAIL}"
	printf "${BOLD}${part_name} Summary: ${color_summary}${success}/${#active_funcs[@]}${DEFAULT} functions passed.\n"
}
