#!/bin/bash

# **************************************************************************** #
#                                                                              #
#    This project is based on and inspired by the libft-war-machine version    #
#    maintained by @0x050f (https://github.com/0x050f/libft-war-machine),      #
#    which in turn was based on the versions by @lmartin and the original      #
#    Libftest by @jtoty.                                                       #
#                                                                              #
#    Modified and enhanced for the "Libft God" version (2026 Edition).          #
#                                                                              #
# **************************************************************************** #

#PATH_TEST=$(dirname $(readlink -f $0))
PATH_TEST="$(cd "$(dirname "$0")" && pwd -P)"

#exec 6>&2 2>/dev/null
exec 2> /dev/null

source "${PATH_TEST}"/srcs/variables.sh
source "${PATH_TEST}"/srcs/about.sh

IS_SINGLE_FUNCTION=0

for arg in ${@}
do
	case "${arg}" in
		"--help")			man "${PATH_TEST}"/srcs/help.1
							exit ;;
		"-h")				man "${PATH_TEST}"/srcs/help.1
							exit ;;
		"--about")			display_about
							exit ;;
		"-a")				display_about
							exit ;;
		"-d")				DIRECTORY=1 ;;
		"-s")				OPT_NO_SEARCH=1 ;;
		"-m")				OPT_FULL_MAKEFILE=1 ;;
		"-l")				OPT_NO_LIBRARY=1 ;;
		"-c")				OPT_NO_COLOR=1 ;;
		"-f")				OPT_NO_FORBIDDEN=1 ;;
		"-n")				OPT_NO_NORMINETTE=1 ;;
		"-u")                           OPT_NO_UPDATE=1 ;;
		"-fast")                        OPT_FAST=1 ;;
		"-doom" | "-hardcore")          OPT_DOOM=1
		                                OPT_HARDCORE=1
		                                OPT_NO_MANDATORY=0
		                                OPT_NO_BONUS=0
		                                OPT_NO_PART3=0 ;;
		"-mandatory" | "-op1")          OPT_NO_BONUS=1
		                                        OPT_NO_PART3=1
		                                        CHECK_IN_MANDATORY=0
		                                        CHECK_IN_BONUS=0
		                                        CHECK_IN_PART3=0 ;;
		"-bonus" | "-op2")              OPT_NO_MANDATORY=1
		                                        OPT_NO_PART3=1
		                                        CHECK_IN_BONUS=0
		                                        CHECK_IN_MANDATORY=0
		                                        CHECK_IN_PART3=0 ;;
		"-stress" | "-op3")             OPT_NO_MANDATORY=1
		                                        OPT_NO_BONUS=1
		                                        OPT_NO_PART3=0
		                                        CHECK_IN_PART3=0
		                                        CHECK_IN_BONUS=0
		                                        CHECK_IN_MANDATORY=0 ;;
		"-complete")                    OPT_NO_MANDATORY=0
		                                        OPT_NO_BONUS=0
		                                        OPT_NO_PART3=1 ;;
		"-p1")                          OPT_NO_MANDATORY=1
		                                        CHECK_IN_MANDATORY=0 ;;
		"-p2")                          OPT_NO_BONUS=1
		                                        CHECK_IN_BONUS=0 ;;
		"-p3")                          OPT_NO_PART3=1
		                                        CHECK_IN_PART3=0 ;;

		*ft_*)	IS_SINGLE_FUNCTION=1
				for part in ${tab_all_part[*]}
				do
					check_part=$(echo CHECK_IN_${part} | tr '[:lower:]' '[:upper:]' | rev | cut -c 6- | rev)
					if [ ${!check_part} -eq 1 ]
					then
						opt_part_var=$(echo OPT_NO_${part} | tr '[:lower:]' '[:upper:]' | rev | cut -c 6- | rev)
						eval "${opt_part_var}=1"
						p=0
						activate_part=$(echo ACTIVATE_${part} | tr '[:lower:]' '[:upper:]' | rev | cut -c 6- | rev)
						tab_part=$(echo ${part}[*])
						nb_func=$(echo ${!tab_part} | wc -w)
						while (( p < ${nb_func} ))
						do
							func_name=$(echo ${part}[$p])
							if [ "$(echo ${arg} | sed 's/_bonus//g' | grep -ow $(echo ${!func_name} | cut -d . -f 1 | sed 's/_bonus//g'))" != "" ]
							then
								(( ${part}_activation[$p]=1 ))
								(( ${activate_part}=1 ))
								break
							fi
							(( p += 1 ))
						done
					fi
				done ;;
	esac
done

source "${PATH_TEST}"/srcs/colors.sh
source "${PATH_TEST}"/srcs/check_cheat.sh
source "${PATH_TEST}"/srcs/check_compilation.sh
source "${PATH_TEST}"/srcs/check_file.sh
source "${PATH_TEST}"/srcs/check_norme.sh
source "${PATH_TEST}"/srcs/compil_lib.sh
source "${PATH_TEST}"/srcs/diff_test.sh
source "${PATH_TEST}"/srcs/test_function.sh
source "${PATH_TEST}"/srcs/check_update.sh

cd "${PATH_TEST}"

#if [ ${OPT_NO_UPDATE} -eq 0 ]
#then
#	func_check_update
#fi

if [ ! -e "${PATH_TEST}"/my_config.sh ]
then
	printf "${BOLD}my_config.sh${DEFAULT} file is not found.\n"
	printf "Creating file...\n"
	if [ -e "${PATH_TEST}"/srcs/config_template.sh ]
	then
		cp "${PATH_TEST}"/srcs/config_template.sh "${PATH_TEST}"/my_config.sh
		printf "File created with success in ${BOLD}${PURPLE}${PATH_TEST}\n${DEFAULT}"
		printf "${RED}${UNDERLINE}Edit my_config.sh file${DEFAULT} with the path of your libft project and launch script.\n"
	else
		printf "Can't create my_config.sh file, try to update or clone again the repository and retry.\n"
		exit
	fi
	exit
fi

source "${PATH_TEST}"/my_config.sh

if [ ${CUSTOM_DIRECTORY} -eq 1 ]
then
	if [ -d "${PATH_TEST}"/dirlibft ]
	then
		rm -rf "${PATH_TEST}"/dirlibft
	fi
	printf "Copying files...\nPlease wait a moment.\n"
	mkdir "${PATH_TEST}"/dirlibft
	mkdir "${PATH_TEST}"/dirlibft/${SRC_DIR}
	mkdir "${PATH_TEST}"/dirlibft/${HEADER_DIR}
	cp "${PATH_LIBFT}"/* "${PATH_TEST}"/dirlibft
	cp "${PATH_LIBFT}"/${SRC_DIR}/*.c "${PATH_TEST}"/dirlibft/${SRC_DIR}
	cp "${PATH_LIBFT}"/${HEADER_DIR}/*.h "${PATH_TEST}"/dirlibft/${HEADER_DIR}
	#find ${PATH_LIBFT} -type f -name "*.[ch]" -print | xargs cp -t ${PATH_TEST}/dirlibft
	PATH_LIBFT="${PATH_TEST}"/dirlibft
#	sleep 1000
fi

for part in ${tab_all_part[*]}
do
	opt_part=$(echo OPT_NO_${part} | tr '[:lower:]' '[:upper:]' | rev | cut -c 6- | rev)
	if [ ${!opt_part} -eq 0 ]
	then
	        p=0
	        tab_part=$(echo ${part}[*])
	        nb_func=$(echo ${!tab_part} | wc -w)
	        while (( p < ${nb_func} ))
	        do
	                (( ${part}_activation[$p]=1 ))
	                (( p += 1 ))
	        done
	fi

done

init_deepthought()
{
	if [ -e "${PATH_DEEPTHOUGHT}"/deepthought ]
	then
		rm -f "${PATH_DEEPTHOUGHT}"/deepthought
	fi
	text="= Host-specific information "
	printf "${text}" >> "${PATH_DEEPTHOUGHT}"/deepthought
	printf "%.s=" $(seq 1 $(( 80 - ${#text} ))) >> "${PATH_DEEPTHOUGHT}"/deepthought
	printf "\n$> hostname; uname -msr\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
	hostname >> "${PATH_DEEPTHOUGHT}"/deepthought
	uname -msr >> "${PATH_DEEPTHOUGHT}"/deepthought
	printf "$> date\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
	date >> "${PATH_DEEPTHOUGHT}"/deepthought
	printf "$> cc --version\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
	cc --version >> "${PATH_DEEPTHOUGHT}"/deepthought
}

clear
init_deepthought

# Header Moderno
printf "${COLOR_TITLE}╔════════════════════──────────────────────────────────────────════════════════════╗${DEFAULT}\n"
printf "${COLOR_TITLE}║                                                                                  ║${DEFAULT}\n"
if [ ${OPT_DOOM} -eq 1 ]; then
printf "${COLOR_TITLE}║                      FT_PRINTF - GOD TESTER (DOOM MODE)                          ║${DEFAULT}\n"
else
printf "${COLOR_TITLE}║                      FT_PRINTF - GOD TESTER (SIMPLE MODE)                        ║${DEFAULT}\n"
fi
printf "${COLOR_TITLE}║                                                                                  ║${DEFAULT}\n"
printf "${COLOR_TITLE}╚════════════════════──────────────────────────────────────────════════════════════╝${DEFAULT}\n"

if [ -e "${PATH_LIBFT}/Makefile" ]
then
        MAKEFILE_VAR="Makefile"
elif [ -e "${PATH_LIBFT}/makefile" ]
then
        MAKEFILE_VAR="makefile"
else
        MAKEFILE_VAR="missing_makefile"
fi

if [ ${OPT_NO_SEARCH} -eq 0 ]
then
	if [ ${IS_SINGLE_FUNCTION} -eq 0 ]
	then
		func_check_file
	fi
fi
if [ ${OPT_NO_LIBRARY} -eq 0 ]
then
	if [ ${IS_SINGLE_FUNCTION} -eq 1 ]
	then
	        printf "\n${COLOR_PART}─── Compiling libftprintf.a (Single Function Mode) ───${DEFAULT}\n"
	        printf "\n$> make bonus\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
	        make --no-print-directory -C "${PATH_LIBFT}" bonus >> "${PATH_DEEPTHOUGHT}"/deepthought 2>&1
	else		func_compil_lib
	fi
fi

for part in ${tab_all_part[*]}
do
        opt_part=$(echo OPT_NO_${part} | tr '[:lower:]' '[:upper:]' | rev | cut -c 6- | rev)
        activate_part=$(echo ACTIVATE_${part} | tr '[:lower:]' '[:upper:]' | rev | cut -c 6- | rev)
        if [ ${!opt_part} -eq 0 ]
        then
                (( ${activate_part}=1 ))
		p=0
		tab_part=$(echo ${part}[*])
		nb_func=$(echo ${!tab_part} | wc -w)
		while (( p < ${nb_func} ))
		do
			(( ${part}_activation[$p]=1 ))
			(( p += 1 ))
		done
        fi
done

# Calcular total de funções para o estilo progressivo
GLOBAL_TOTAL=0
GLOBAL_CURRENT=0
for part in ${tab_all_part[*]}
do
    activate_part=$(echo ACTIVATE_${part} | tr '[:lower:]' '[:upper:]' | rev | cut -c 6- | rev)
    if [ ${!activate_part} -eq 1 ]
    then
	activation_tab=$(echo ${part}_activation[*])
	for act in ${!activation_tab}
	do
		if [ $act -eq 1 ]
		then
			let "GLOBAL_TOTAL += 1"
		fi
	done
    fi
done

if [ -e "${PATH_LIBFT}/${HEADER_DIR}/ft_printf.h" ]
then
	cp "${PATH_LIBFT}/${HEADER_DIR}/ft_printf.h" "${PATH_TEST}"
fi

printf "#include \"ft_printf.h\"\n\nint\tmain(void)\n{\n\treturn (0);\n}" > "${PATH_TEST}"/main_check_cheating.c

for part in ${tab_all_part[*]}
do
	activate_part=$(echo ACTIVATE_${part} | tr '[:lower:]' '[:upper:]' | rev | cut -c 6- | rev)
	if [ ${!activate_part} -eq 1 ]
	then
		text="= ${part}tions "
		printf "\n${text}" >> "${PATH_DEEPTHOUGHT}"/deepthought
		printf "%.s=" $(seq 1 $(( 80 - ${#text} ))) >> "${PATH_DEEPTHOUGHT}"/deepthought
		printf "\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
		test_function $(echo ${part}[*])
	fi
done

if [ -e "${PATH_TEST}"/a.out ]
then
	rm "${PATH_TEST}"/a.out
fi

if [ -e "${PATH_TEST}"/ft_printf.h ]
then
	rm "${PATH_TEST}"/ft_printf.h
fi

if [ -e "${PATH_TEST}"/main_check_cheating.c ]
then
	rm "${PATH_TEST}"/main_check_cheating.c
fi

if [ ${DIRECTORY} -eq 1 ]
then
	if [ -d "${PATH_TEST}"/dirlibft ]
	then
		rm -rf "${PATH_TEST}"/dirlibft
	fi
fi

if [ ${ACTIVATE_PART1} -eq 1 ] || [ ${ACTIVATE_PART2} -eq 1 ] || [ ${ACTIVATE_PART3} -eq 1 ]
then
        printf "Abort : ${RED}A${DEFAULT} Bus error : ${RED}B${DEFAULT} Segmentation fault : ${RED}S${DEFAULT} Timeout : ${RED}T${DEFAULT} Nothing turned in : ${RED}NTI${DEFAULT}\n"
        printf "\n"
fi

printf "A deepthought file has been generated in ${COLOR_DEEPTHOUGHT_PATH}\"${PATH_DEEPTHOUGHT}\"\n\n${DEFAULT}"
make --no-print-directory -C "${PATH_LIBFT}" fclean > /dev/null

# nuke_it_all
find "${PATH_TEST}" -name 'user_output_test*' -delete
rm -rf "${PATH_TEST}"/dirlibft/
