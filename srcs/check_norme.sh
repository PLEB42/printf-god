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

check_norme()
{
 	printf "\033[${NORME_COL}G"
	# For ft_printf, we check the main file and any other .c files in the project
	local file_to_check="${PATH_LIBFT}/${SRC_DIR}/ft_printf.c"
	if [ ! -e "$file_to_check" ]; then
		file_to_check="${PATH_LIBFT}/ft_printf.c"
	fi
	
	if [ ! -e "$file_to_check" ]; then
		printf "  ${COLOR_WARNING}⚠️  N/A ${DEFAULT}"
		return 1
	fi

	printf "$> norminette ${file_to_check} | grep -E '(Error|Warning)'\n" >>"${PATH_DEEPTHOUGHT}"/deepthought
	NORME_VAR=$(norminette "$file_to_check" 2>&1)
	if echo "$NORME_VAR" | grep -q command
	then
		printf "  ${COLOR_WARNING}⚠️  NT ${DEFAULT}"
		printf "\nnorminette : command not found\n\n" >>"${PATH_DEEPTHOUGHT}"/deepthought
		retvalue=1
	elif echo "$NORME_VAR" | grep -qE '(Error|Warning)'
	then
		printf "  ${COLOR_FAIL}❌ ERR ${DEFAULT}"
		echo "$NORME_VAR" | grep -E '(Error|Warning)' >> "${PATH_DEEPTHOUGHT}"/deepthought 2>&1
		printf "Norme check failed for ${file_to_check}\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
		retvalue=0
	else
		printf "  ${COLOR_OK}✅ OK  ${DEFAULT}"
		retvalue=1
	fi
	return $retvalue
}
