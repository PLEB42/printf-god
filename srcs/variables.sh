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
#              Mandatory functions                #
###################################################

Mandatory_func=('ft_printf_c.c' 'ft_printf_s.c' 'ft_printf_p.c' 'ft_printf_d.c' 'ft_printf_i.c' \
'ft_printf_u.c' 'ft_printf_x.c' 'ft_printf_X_upper.c' 'ft_printf_percent.c')

# Authorized bits: 1=malloc, 2=free, 4=write
Mandatory_func_authorized=('1' '1' '1' '1' '1' \
'1' '1' '1' '1')

Mandatory_func_activation=('0' '0' '0' '0' '0' \
'0' '0' '0' '0')

###################################################
#                Bonus functions                  #
###################################################

Bonus_func=('ft_printf_c_bonus.c' 'ft_printf_s_bonus.c' 'ft_printf_p_bonus.c' 'ft_printf_d_bonus.c' \
'ft_printf_i_bonus.c' 'ft_printf_u_bonus.c' 'ft_printf_x_bonus.c' 'ft_printf_X_upper_bonus.c' \
'ft_printf_percent_bonus.c')

# Authorized bits: 1=malloc, 2=free, 4=write
Bonus_func_authorized=('1' '1' '1' '1' \
'1' '1' '1' '1' \
'1')

Bonus_func_activation=('0' '0' '0' '0' \
'0' '0' '0' '0' \
'0')

###################################################
#                 Part3 functions                 #
###################################################

Part3_func=('ft_printf_mix.c')

# Authorized bits: 1=malloc, 2=free, 4=write
Part3_func_authorized=('1')

Part3_func_activation=('0')

###################################################
#                 Other variables                 #
###################################################

tab_all_part=('Mandatory_func' 'Bonus_func' 'Part3_func')

num_sys_func=('1' '2' '4')
system_func=('void' 'malloc' 'free' 'printf' 'write')

# COORDENADAS RECALCULADAS PARA TABELA LARGA (WIDE)
NORME_COL=23
CHEAT_COL=33
COMPIL_COL=49
LEAKS_COL=58
TEST_COL=68
RESULT_COL=130
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
OPT_NO_MANDATORY=0
OPT_NO_BONUS=1
OPT_NO_PART3=1
ACTIVATE_MANDATORY=0
ACTIVATE_BONUS=0
ACTIVATE_PART3=0
CHECK_IN_MANDATORY=1
CHECK_IN_BONUS=1
CHECK_IN_PART3=1
CUSTOM_DIRECTORY=0
OPT_DOOM=0
OPT_HARDCORE=0
SIMPLE_LIMIT_P1=1000
SIMPLE_LIMIT_P2=1000
