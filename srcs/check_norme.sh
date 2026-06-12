# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    check_norme.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jtoty <jtoty@tester.unit.com>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/23 18:26:23 by jtoty             #+#    #+#              #
#    Updated: 2026/06/03 12:00:00 by gemini-cli       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

NORME_CHECKED=0
NORME_RESULT=""

check_norme()
{
 	printf "\033[${NORME_COL}G"
	
	if [ ${NORME_CHECKED} -eq 0 ]
	then
		local files_to_check
		if [ -n "${SRC_DIR}" ] && [ -d "${PATH_LIBFT}/${SRC_DIR}" ]; then
			files_to_check=$(find "${PATH_LIBFT}/${SRC_DIR}" -maxdepth 1 -name "*.c" -type f 2>/dev/null)
		else
			files_to_check=$(find "${PATH_LIBFT}" -maxdepth 1 -name "*.c" -type f 2>/dev/null)
		fi

		if [ -z "$files_to_check" ]; then
			NORME_RESULT="NA"
		else
			printf "$> norminette ${files_to_check} | grep -E '(Error|Warning)'\n" >>"${PATH_DEEPTHOUGHT}"/deepthought
			NORME_VAR=$(norminette $files_to_check 2>&1)
			echo "$NORME_VAR" >>"${PATH_DEEPTHOUGHT}"/deepthought
			
			if echo "$NORME_VAR" | grep -q command
			then
				NORME_RESULT="NT"
			elif echo "$NORME_VAR" | grep -qE '(Error|Warning)'
			then
				NORME_RESULT="ERR"
			else
				NORME_RESULT="OK"
			fi
		fi
		NORME_CHECKED=1
	fi

	if [ "$NORME_RESULT" = "NA" ]; then
		printf "  ${COLOR_WARNING}⚠️  N/A ${DEFAULT}"
		return 1
	elif [ "$NORME_RESULT" = "NT" ]; then
		printf "  ${COLOR_WARNING}⚠️  NT ${DEFAULT}"
		return 1
	elif [ "$NORME_RESULT" = "ERR" ]; then
		printf "  ${COLOR_FAIL}❌ ERR ${DEFAULT}"
		return 0
	else
		printf "  ${COLOR_OK}✅ OK  ${DEFAULT}"
		return 1
	fi
}
