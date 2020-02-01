#!/usr/bin/env bash
SelectLicense() {
	local SELECTED CANDIDATES=()
	local CANDIDATES_STR='CC0 Unlicense AGPL GPL LGPL CC-BY CC-BY-SA Apache MIT BSD-2 BSD-3 BSD-3-Clear'
	CANDIDATES=${CANDIDATES_STR//\// }
	Any() { [[ " ${CANDIDATES[@]} " =~ " $1 " ]]; }
	select selected in ${CANDIDATES[@]}; do
		Any "$selected" && { LICENSE="$selected"; break; }
	done;
}
InputAuthor() { read -e -p 'Author name: ' AUTHOR; }

# Return value is invalid !!
#SelectLicense() {
#	local SELECTED CANDIDATES=()
#	local CANDIDATES_STR='CC0 Unlicense AGPL GPL LGPL CC-BY CC-BY-SA Apache MIT BSD-2 BSD-3 BSD-3-Clear'
#	CANDIDATES=${CANDIDATES_STR//\// }
#	Any() { [[ " ${CANDIDATES[@]} " =~ " $1 " ]]; }
#	select selected in ${CANDIDATES[@]}; do
#		Any "$selected" && { SELECTED="$selected"; break; }
#	done;
#	echo "$SELECTED"
#}
#InputAuthor() {
#	local author
#	read -e -p 'Author name: ' author
#	echo "$AUTHOR"
#}

# Calling function not found ('FindId' etc...)
#Run() {
#	local SELECTED CANDIDATES=()
#	local CANDIDATES_STR='CC0 Unlicense AGPL GPL LGPL CC-BY CC-BY-SA Apache MIT BSD-2 BSD-3 BSD-3-Clear'
#	CANDIDATES=${CANDIDATES_STR//\// }
#	Any() { [[ " ${CANDIDATES[@]} " =~ " $1 " ]]; }
#	select selected in ${CANDIDATES[@]}; do
#		Any "$selected" && { SELECTED="$selected"; break; }
#	done;
#	# Not found !!
#	FindId
#	IsRequiredAuthor "$(GetTemplatePath)" && read -e -p 'Author name: ' AUTHOR
#	OutputLicenseFile
#}
#Run "$@"
