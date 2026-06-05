# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    variables.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gemini-cli <gemini@tester.unit.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/23 18:27:13 by jtoty             #+#    #+#              #
#    Updated: 2026/06/03 12:00:00 by gemini-cli       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

###################################################
#                 Part1 functions                 #
###################################################

Part1_func=('ft_printf_c.c' 'ft_printf_s.c' 'ft_printf_p.c' 'ft_printf_d.c' 'ft_printf_i.c' \
'ft_printf_u.c' 'ft_printf_x.c' 'ft_printf_X_upper.c' 'ft_printf_percent.c')

# Authorized bits: 1=malloc, 2=free, 4=write
Part1_func_authorized=('1' '1' '1' '1' '1' \
'1' '1' '1' '1')

Part1_func_activation=('0' '0' '0' '0' '0' \
'0' '0' '0' '0')

###################################################
#                 Part2 functions                 #
###################################################

Part2_func=('ft_printf_mix.c')

# Authorized bits: 1=malloc, 2=free, 4=write
Part2_func_authorized=('1')

Part2_func_activation=('0')

###################################################
#                 Part3 functions                 #
###################################################

Part3_func=()

# Authorized bits: 1=malloc, 2=free, 4=write
Part3_func_authorized=()

Part3_func_activation=()

###################################################
#                 Other variables                 #
###################################################

tab_all_part=('Part1_func' 'Part2_func')

num_sys_func=('1' '2' '4')
system_func=('void' 'malloc' 'free' 'printf' 'write')

# COORDENADAS RECALCULADAS PARA TABELA LARGA (WIDE)
NORME_COL=23
CHEAT_COL=34
COMPIL_COL=51
LEAKS_COL=61
TEST_COL=71
RESULT_COL=133
TITLE_LENGTH=142
CHAR_LENGTH="-"
CHAR_WIDTH="|"

DIRECTORY=0
OPT_NO_LIBRARY=0
OPT_FULL_MAKEFILE=0
OPT_NO_SEARCH=0
OPT_NO_COLOR=0
OPT_NO_FORBIDDEN=0
OPT_NO_NORMINETTE=0
OPT_NO_UPDATE=1
OPT_FAST=0
OPT_NO_PART1=0
OPT_NO_PART2=0
OPT_NO_PART3=0
ACTIVATE_PART1=0
ACTIVATE_PART2=0
ACTIVATE_PART3=0
CHECK_IN_PART1=1
CHECK_IN_PART2=1
CHECK_IN_PART3=0
CUSTOM_DIRECTORY=0
