#!/usr/bin/env bash
set -Ceu
Run() {
	Install() {
		IsInstalledJq() { [ -n "$(dpkg -l jq | cut -d " " -f 3 | grep jq)" ]; }
		InstallJq() { sudo apt install -y jq; }
		IsInstalledJq || InstallJq
	}
	Install
	local HERE="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd -P)"
	local OUT_DIR="$(cd "$HERE"; cd "../../res/contents"; pwd -P)"
	local ID_DIR="$(cd "$HERE"; cd "../../res/ids"; pwd -P)"
	local JSON_DIR="$(cd "$HERE"; cd "../../res/json"; pwd -P)"
	echo -e "$HERE\n$OUT_DIR\n$ID_DIR\n$JSON_DIR"
	LicenseIdsPath() { echo "$ID_DIR/licensekeys.txt"; }
	DeleteCommentAndBlankLine() { grep -v -e '^\s*#' -e '^\s*$' "$1"; }
	GitHubIds() { echo -e "$(DeleteCommentAndBlankLine "$(LicenseIdsPath)")" | cut -f1 | sort | uniq; }
	SpdxIds() { echo -e "$(DeleteCommentAndBlankLine "$(LicenseIdsPath)")" | cut -f2 | sort | uniq; }
	IsExistJson() { [ -f "${JSON_DIR}/${1}.json" ]; }
	IsExistContent() { [ -f "${OUT_DIR}/${1}.txt" ]; }
	GetLicenseJson() { curl https://api.github.com/licenses/${1} > "$JSON_DIR/${1}.json"; sleep 1; }
	GetLicenseContent() { cat "$JSON_DIR/${1}.json" | jq -r '.body' > "$OUT_DIR/${1}.txt"; }
	echo -e "$(GitHubIds)" | ( while read id; do
		echo "$id"
		IsExistJson "$id" || GetLicenseJson "$id"
		IsExistContent "$id" || GetLicenseContent "$id"
	done; )
}
Run "$@"
