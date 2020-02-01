[ja](./README.ja.md)

# lish

Create a LICENSE file.

![asciinema](doc/lish_mit.svg)

# Features

* CLI (bash)
* [Support licenses: 12](#support-licenses)
* Output [`LICENSE` file](res/templates) to current directory
* Output [Standard license headers](res/headers) to `stdout`
* Detect license: [licensee](https://github.com/licensee/licensee)

## Support licenses

Group|License
-----|--------
[copyleft][copyleft]|[`AGPL`][AGPL]([`+`][AGPL+]), [`GPL`][GPL]([+][GPL+]), [`LGPL`][LGPL]([+][LGPL+]), [`CC-BY-SA-4.0`][CC-BY-SA-4.0]
[permissive][permissive]|[`Apache-2.0`](https://spdx.org/licenses/Apache-2.0.html#licenseText), [`MIT`](https://spdx.org/licenses/MIT.html#licenseText), `BSD`([2][BSD-2-Clause],[3][BSD-3-Clause],[3-clear][BSD-3-Clause-Clear]), [`CC-BY-4.0`][CC-BY-4.0]
[public-domain][public-domain]|[`CC0`][CC0-1.0], [`Unlicense`][Unlicense]

* Not support:
    * [proprietary][proprietary]
    * [Non commercial activity][Non-commercial-activity]
* Source: [SPDX][SPDX] <small>v3.7 2019-10-22</small>

<details><summary>Approval</summary>

### Approval

type|[FSF][FSF]|[OSI][OSI]|License
----|----------|----------|-------
[copyleft][copyleft]|○|○|[`AGPL`][AGPL]
[copyleft][copyleft]|○|○|[`GPL`][GPL]
[copyleft][copyleft]|○|○|[`LGPL`][LGPL]
[copyleft][copyleft]|○|☓|[`CC-BY-SA-4.0`][CC-BY-SA-4.0]
[permissive][permissive]|○|○|[`Apache-2.0`][Apache-2.0]
[permissive][permissive]|○|○|[`MIT`][MIT]
[permissive][permissive]|☓|○|[`BSD-2-Clause`][BSD-2-Clause]
[permissive][permissive]|○|○|[`BSD-3-Clause`][BSD-3-Clause]
[permissive][permissive]|○|☓|[`BSD-3-Clause-Clear`][BSD-3-Clause-Clear]
[permissive][permissive]|○|☓|[`CC-BY-4.0`][CC-BY-4.0]
[public-domain][public-domain]|○|☓|[`CC0-1.0`][CC0-1.0]
[public-domain][public-domain]|○|☓|[`Unlicense`][Unlicense]

</details>

[copyleft]:https://en.wikipedia.org/wiki/Copyleft
[AGPL]:https://spdx.org/licenses/AGPL-3.0-only.html#licenseText
[AGPL+]:https://spdx.org/licenses/AGPL-3.0-or-later.html#licenseText
[GPL]:https://spdx.org/licenses/GPL-3.0-only.html#licenseText
[GPL+]:https://spdx.org/licenses/GPL-3.0-or-later.html#licenseText
[LGPL]:https://spdx.org/licenses/LGPL-3.0-only.html#licenseText
[LGPL+]:https://spdx.org/licenses/LGPL-3.0-or-later.html#licenseText
[CC-BY-SA-4.0]:https://spdx.org/licenses/CC-BY-SA-4.0.html#licenseText
[permissive]:https://en.wikipedia.org/wiki/Permissive_software_license
[Apache-2.0]:https://spdx.org/licenses/Apache-2.0.html#licenseText
[MIT]:https://spdx.org/licenses/MIT.html#licenseText
[BSD-2-Clause]:https://spdx.org/licenses/BSD-2-Clause.html#licenseText
[BSD-3-Clause]:https://spdx.org/licenses/BSD-3-Clause.html#licenseText
[BSD-3-Clause-Clear]:https://spdx.org/licenses/BSD-3-Clause-Clear.html#licenseText
[CC-BY-4.0]:https://spdx.org/licenses/CC-BY-4.0.html#licenseText
[public-domain]:https://en.wikipedia.org/wiki/Public_domain
[CC0-1.0]:https://spdx.org/licenses/CC0-1.0.html#licenseText
[Unlicense]:https://spdx.org/licenses/Unlicense.html#licenseText
[Non-commercial-activity]:https://en.wikipedia.org/wiki/Non-commercial_activity
[proprietary]:https://en.wikipedia.org/wiki/Proprietary_software
[FSF]:https://en.wikipedia.org/wiki/Free_Software_Foundation
[OSI]:https://en.wikipedia.org/wiki/Open_Source_Initiative
[SPDX]:https://spdx.org/licenses/

# Requirement

* <time datetime="2020-01-26T12:18:40+0900">2020-01-26</time>
* [Raspbierry Pi](https://ja.wikipedia.org/wiki/Raspberry_Pi) 4 Model B Rev 1.2
* [Raspbian](https://ja.wikipedia.org/wiki/Raspbian) buster 10.0 2019-09-26 <small>[setup](http://ytyaru.hatenablog.com/entry/2019/12/25/222222)</small>
* bash 5.0.3(1)-release

```sh
$ uname -a
Linux raspberrypi 4.19.75-v7l+ #1270 SMP Tue Sep 24 18:51:41 BST 2019 armv7l GNU/Linux
```

# Installation

* [jq](https://stedolan.github.io/jq/)
* [licensee](https://github.com/licensee/licensee)

```sh
sudo apt install -y jq
sudo apt install -y ruby bundler cmake pkg-config git libssl-dev
sudo gem install licensee
git clone https://github.com/ytyaru/lish
```

# Usage

## Make symbolic link and set `PATH` environment variable

```sh
cd lish/src
ln -s ./lish.sh /usr/bin/lish
```

## Show help

[help](res/help/help.txt)

```sh
lish -h
```

## Output license file

Licenses can be specified by [alias](res/ids/alias.txt).

```sh
lish p # public-domain CC0-1.0
lish l # copyleft      AGPL-3.0
lish c # copycenter    Apache-2.0
```

Output `LICENSE` file to the current directory.

### Add filename suffix `-i`

Add [license ID](res/ids/alias.txt) to file name suffix.

```sh
lish -i GPL
```

The output file name will be `LICENSE-GPL-3.0-only`.

### Copyright options

#### Author name `-a`

`MIT` and `BSD` require author names. 

```sh
lish -a AuthorName MIT
```

If there is a `./git/config` file, use the value of `git config --local user.name`.

#### Copyright year `-y`

Optionally, you can specify the year of copyright issuance.

```sh
lish -a A -y 1999 MIT
```

If not specified, use the runtime year.

### Selected License `select`

```sh
lish select
```
```sh
1) CC0		  3) AGPL	   5) LGPL	    7) CC-BY-SA	     9) MIT	     11) BSD-3
2) Unlicense	  4) GPL	   6) CC-BY	    8) Apache	    10) BSD-2	     12) BSD-3-Clear
```

`MIT` and` BSD` prompt for the author name.

```sh
Author name: 
```

## Detect license

Returns the license type ID from the `LICENSE` file using [licensee](https://github.com/licensee/licensee).

```sh
lish detect
```

If there are multiple licenses, change the `LICENSE` file name and output it to detect it.

```sh
$ lish -i l
$ lish -i c
$ lish detect
Apache-2.0
GPL-3.0
```

## Output standard license header `-s`

The target is `GPL`,` AGPL`,`CC0`,`Apache`. [headers](res/headers). Source is [SPDX v3.7 2019-10-22](https://spdx.org/licenses/)

```sh
lish -s GPL
```

Output to stdout.

#### Repository name `-r`

```sh
lish -s -r 'My Repo' GPL
```

### Template values

For example, `GPL` is as follows.

```
{{REPO_NAME}}
Copyright (C) {{YEAR}} {{AUTHOR}}

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
```

template|value
--------|-----
`{{REPO_NAME}}`|`-r` option value. Or Current directory name
`{{YEAR}}`|`-y` option value. Or run-time year
`{{AUTHOR}}`|`-a` option value. Or `git config --local user.name`

### Formatting

#### Wrap

On Linux, use the `fold` command to wrap lines in words other than 80 characters.

```sh
cat ./res/headers/gpl-3.0-only.txt | fold -s -w 80
```
```sh
{{REPO_NAME}}
Copyright (C) {{YEAR}} {{AUTHOR}}

This program is free software: you can redistribute it and/or modify it under 
the terms of the GNU General Public License as published by the Free Software 
Foundation, version 3.

This program is distributed in the hope that it will be useful, but WITHOUT ANY 
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with 
this program. If not, see <https://www.gnu.org/licenses/>.
```

Line wrapping is not required for the standard license header of Apache-2.0. The line had already been wrapped.

#### Indent

```
cat ./res/headers/gpl-3.0-only.txt | sed -e 's/^/  /g'
```

# Note

* Some template file contents are duplicated
    * `AGPL`, `GPL`, `LGPL`
        * `-only`, `-or-later`
            * Just in case for future changes.

# Author

ytyaru

* [![github](http://www.google.com/s2/favicons?domain=github.com)](https://github.com/ytyaru "github")
* [![hatena](http://www.google.com/s2/favicons?domain=www.hatena.ne.jp)](http://ytyaru.hatenablog.com/ytyaru "hatena")
* [![mastodon](http://www.google.com/s2/favicons?domain=mstdn.jp)](https://mstdn.jp/web/accounts/233143 "mastdon")

# License

This software is CC0 licensed.

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.en)

