#!/usr/bin/env bash

# (header.sh) THIS SCRIPT IS LICENSED UNDER THE GNU GPL V3
# Copyright (C) 2021  Will Maguire

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>

# The definition of Free Software is as follows:
#				- The freedom to run the program, for any purpose.
#				- The freedom to study how the program works, and adapt it to your needs.
#				- The freedom to redistribute copies so you can help your neighbor.
#				- The freedom to improve the program, and release
#				your improvements to the public, so that the whole community benefits.
#
# A program is free software if users have all of these freedoms.

# Captura as informações de data, hora e usuário

DATE=$(date +"%Y/%m/%d")

TIME=$(date +"%H:%M:%S")

USER=PUT_YOUR_USER_NAME

ADD_HEADER() {

FILE_NAME=$(basename "$1")

# Define o cabeçalho com as variáveis
HEADER="/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   $FILE_NAME                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: $USER <$USER@42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: $DATE $TIME by $USER        #+#    #+#             */
/*   Updated: $DATE $TIME by $USER       ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
"

	NORM_VAR=$(norminette "$1" | grep "INVALID_HEADER")
	if [ "$NORM_VAR" = "" ]; then
		echo "VALID HEADER EXISTS: $1"
	else
		echo "HEADER ADDED: $1"
		cp "$1" "$1.cp"
		echo "$HEADER" > "$1"
		cat "$1.cp" >> "$1"
		rm "$1.cp"
	fi
}

for file in $(find libft -type f)
do
	ADD_HEADER $file
done
