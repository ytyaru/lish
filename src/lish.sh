#!/usr/bin/env bash
Run() {
	Version() { echo '0.0.1'; }
	local YEAR=; AUTHOR=; LICENSE=;
	local EXE_NAME="$(basename "${BASH_SOURCE:-$0}")"
	local HERE="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd -P)"
	local REPO_PATH="$(pwd -P)"
	local REPO_NAME="$(basename "$(pwd -P)")"
	local TEMPLATE_DIR="$(cd "$HERE"; cd '../res/templates'; pwd -P)"
	local ID_DIR="$(cd "$HERE"; cd '../res/ids'; pwd -P)"
	local HEADER_DIR="$(cd "$HERE"; cd '../res/headers'; pwd -P)"
	local HELP_DIR="$(cd "$HERE"; cd '../res/help'; pwd -P)"
	. "$HERE/lib/Error.sh"
	LicenseFilenames() { find . -type f -regextype posix-extended -iregex './licen[cs]e(\.txt|\.md|.*)?'; }
	GitHubLicenseIdsPath() { echo "$ID_DIR/github.txt"; }
	SpdxLicenseIdsPath() { echo "$ID_DIR/spdx.txt"; }
	AliasPath() { echo "$ID_DIR/alias.txt"; } # ID\tAlias1 Alias2 Alias3 ...
	DeleteCommentAndBlankLine() { grep -v -e '^\s*#' -e '^\s*$' "$1"; }
	GitHubLicenseIds() { DeleteCommentAndBlankLine "$(GitHubLicenseIdsPath)"; }
	SpdxLicenseIds() { DeleteCommentAndBlankLine "$(SpdxLicenseIdsPath)"; }
	Alias() { DeleteCommentAndBlankLine "$(AliasPath)"; }
	HelpPath() { echo "$HELP_DIR/help.txt"; }
	Help() { eval "cat <<< \"$(cat "$(HelpPath)")\""; exit 1; }
	WidthAlignment() {
		local figure=$(echo -e "$(Alias)" | cut -f1 | awk '{print length() ,$0}' | sort -nr | head -n 1 | wc -m)
		local ids="$(echo -e "$(Alias)" | cut -f1 )"
$(echo -e"$(Alias)" | sed "s/^/    /g")
echo -e "$(Alias)" | sed "s/^/    /g"
$(fig=$(echo -e"$(Alias)" | cut -f1 | awk '{print length() ,$0}' | sort -nr | head -n 1 | wc -m); printf "%${fig}s\n";)
	}
	FindId() {
		[ -z "$LICENSE" ] && { Throw 'License ID is required.' "$(SpdxLicenseIds)"; }
		FindAlias() {
			echo -e "$(Alias)" | (while read line; do
				local id="$(echo "$line" | cut -f1)"
				[ "${id,,}" = "${LICENSE,,}" ] && { echo "$id"; return; }
				local aliases="$(echo "$line" | cut -f2)"
				for alias in $aliases; do
					[ "${alias,,}" = "${LICENSE,,}" ] && { echo "$id"; return; }
				done
			done; )
		}
		local id_alias="$(FindAlias)"
		[ -n "$id_alias" ] && { LICENSE="$id_alias"; return; }
		# Auto complete
		local candidate="$(echo -en "$(SpdxLicenseIds)" | grep -i '^'"$LICENSE"'.*$')"
		local cand_num=$(echo -en "$candidate" | wc -l)
		[ 1 -eq $cand_num ] && LICENSE="$(echo "$candidate" | cut -f1)"
		[ 1 -lt $cand_num ] && Throw 'License ID could not be uniquely identified.' "$candidate"
		local pattern='^'"${LICENSE,,}"'.*$'
		for id in $(SpdxLicenseIds); do
			[[ "${id,,}" =~ $pattern ]] && { LICENSE="$id"; return; }
		done
		LICENSE=
	}
	GetArgs() {
		ARGS_POS=; ARG_AUTHOR=; ARG_YEAR=; ARG_REPO_NAME=; ARG_IS_HEADER=0; ARG_IS_SUFFIX=0;
		local OPT OPTARG OPTIND
		while getopts :a:y:r:is OPT; do
			case $OPT in
				a) ARG_AUTHOR="$OPTARG";;
				y) ARG_YEAR="$OPTARG";;
				r) REPO_NAME="$OPTARG";;
				i) ARG_IS_SUFFIX=1;;
				s) ARG_IS_HEADER=1;;
				*) Help; exit 0;;
			esac
		done
		DefaultAuthor() { [ -f "./.git/config" ] && git config --local user.name; }
		YEAR="${ARG_YEAR:-$(date "+%Y")}"
		AUTHOR="${ARG_AUTHOR:-"$(DefaultAuthor)"}"
		LICENSE="${@:$OPTIND:1}"
		ARGS_POS="${@:$OPTIND:$#}"
		IsInt() { test 0 -eq $1 > /dev/null 2>&1 || expr $1 + 0 > /dev/null 2>&1; }
		IsValidYear() { ( [ -z "$ARG_YEAR" ] || ( [ -n "$ARG_YEAR" ] && IsInt "$ARG_YEAR" ) ); }
		IsValidYear || { Throw 'Year should be an integer.'; }
		FindId
		SubCommand "$ARGS_POS"
		[ -n "$LICENSE" ] || Throw 'Invalid license ID.'
	}
	GetOutputLicenseFilename() {
		local name='LICENSE'
		[ 0 -eq $ARG_IS_SUFFIX ] && echo "$name" || echo "${name}-${LICENSE}"
	}
	GetCurrentLicense() { licensee detect | grep 'License:' | grep -v 'NOASSERTION' | sed -e 's/License://g' | sed 's/ //g' | sort | uniq; }
	IsExistLicense() { [ -f "$(GetOutputLicenseFilename)" ] && { Throw 'File already exists. :'"$(GetOutputLicenseFilename)"; }; }
	GetTemplatePath() { find "$TEMPLATE_DIR" -type f -iname "$LICENSE.txt"; }
	IsRequiredAuthor() { [ -n "$(cat "$1" | grep '{{AUTHOR}}')" ]; }
	ReplaceLicenseFile() { cat "$1" | sed -e 's/{{REPO_NAME}}/'"${REPO_NAME}"'/g' | sed -e 's/{{YEAR}}/'"${YEAR}"'/g' | sed -e 's/{{AUTHOR}}/'"${AUTHOR}"'/g'; }
	CreateLicenseFile() { ReplaceLicenseFile "$(GetTemplatePath)" > "$REPO_PATH/$(GetOutputLicenseFilename)"; }
	OutputHeader() {
		GetHeaderPath() { find "$HEADER_DIR" -type f -iname "$LICENSE.txt"; }
		local path="$(GetHeaderPath)"
		[ -z "$path" ] && Throw 'License header could not be found.: '"$LICENSE" 
		IsRequiredAuthor "$path" && [ -z "$AUTHOR" ] && { Throw "$LICENSE requires an author name. Add '-a' option."; }
		ReplaceLicenseFile "$path"
	}
	OutputLicenseFile() {
		IsExistLicense
		IsRequiredAuthor "$(GetTemplatePath)" && [ -z "$AUTHOR" ] && { Throw "$LICENSE requires an author name. Add '-a' option."; }
		LicenseFilenames
		CreateLicenseFile
	}
	SubCommand() {
		[ "$1" = 'detect' ] && { GetCurrentLicense; exit 0; }
		[ "$1" = 'select' ] && {
			. "$HERE/lib/SelectLicense.sh"
			SelectLicense; FindId;
			IsRequiredAuthor "$(GetTemplatePath)" && InputAuthor
			OutputLicenseFile
			exit 0
		}
	}
	GetArgs "$@"
	SubCommand "$ARGS_POS"
	[ 1 -eq $ARG_IS_HEADER ] && OutputHeader || OutputLicenseFile
}
Run "$@"
