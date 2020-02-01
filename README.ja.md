[en](./README.md)

# lish

　`LICENSE`ファイルを生成する。

![asciinema](doc/lish_mit.svg)

# 特徴

* CLI (bash)
* [12種類のライセンスに対応](#対応ライセンス)
* [`LICENSE`ファイル](res/templates)をカレントディレクトリへ出力する
* [標準ライセンスヘッダ](res/headers)を`stdout`へ出力する
* ライセンスを検出する [licensee](https://github.com/licensee/licensee)

## 対応ライセンス

系列|ライセンス
----|--------
[コピーレフト][copyleft]|[`AGPL`][AGPL]([`+`][AGPL+]), [`GPL`][GPL]([+][GPL+]), [`LGPL`][LGPL]([+][LGPL+]), [`CC-BY-SA-4.0`][CC-BY-SA-4.0]
[パーミッシブ][permissive]|[`Apache-2.0`](https://spdx.org/licenses/Apache-2.0.html#licenseText), [`MIT`](https://spdx.org/licenses/MIT.html#licenseText), `BSD`([2][BSD-2-Clause],[3][BSD-3-Clause],[3-clear][BSD-3-Clause-Clear]), [`CC-BY-4.0`][CC-BY-4.0]
[パブリックドメイン][public-domain]|[`CC0`][CC0-1.0], [`Unlicense`][Unlicense]

* 非対応: [プロプライエタリ][proprietary]
* 未対応: [非営利][Non-commercial-activity]
* 情報源: [SPDX][SPDX] <small>v3.7 2019-10-22</small>

<details><summary>承認</summary>

### 承認

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

[copyleft]:https://ja.wikipedia.org/wiki/%E3%82%B3%E3%83%94%E3%83%BC%E3%83%AC%E3%83%95%E3%83%88
[AGPL]:https://spdx.org/licenses/AGPL-3.0-only.html#licenseText
[AGPL+]:https://spdx.org/licenses/AGPL-3.0-or-later.html#licenseText
[GPL]:https://spdx.org/licenses/GPL-3.0-only.html#licenseText
[GPL+]:https://spdx.org/licenses/GPL-3.0-or-later.html#licenseText
[LGPL]:https://spdx.org/licenses/LGPL-3.0-only.html#licenseText
[LGPL+]:https://spdx.org/licenses/LGPL-3.0-or-later.html#licenseText
[CC-BY-SA-4.0]:https://spdx.org/licenses/CC-BY-SA-4.0.html#licenseText
[permissive]:https://ja.wikipedia.org/wiki/%E3%83%91%E3%83%BC%E3%83%9F%E3%83%83%E3%82%B7%E3%83%96%E3%83%BB%E3%83%A9%E3%82%A4%E3%82%BB%E3%83%B3%E3%82%B9
[Apache-2.0]:https://spdx.org/licenses/Apache-2.0.html#licenseText
[MIT]:https://spdx.org/licenses/MIT.html#licenseText
[BSD-2-Clause]:https://spdx.org/licenses/BSD-2-Clause.html#licenseText
[BSD-3-Clause]:https://spdx.org/licenses/BSD-3-Clause.html#licenseText
[BSD-3-Clause-Clear]:https://spdx.org/licenses/BSD-3-Clause-Clear.html#licenseText
[CC-BY-4.0]:https://spdx.org/licenses/CC-BY-4.0.html#licenseText
[public-domain]:https://ja.wikipedia.org/wiki/%E3%83%91%E3%83%96%E3%83%AA%E3%83%83%E3%82%AF%E3%83%89%E3%83%A1%E3%82%A4%E3%83%B3
[CC0-1.0]:https://spdx.org/licenses/CC0-1.0.html#licenseText
[Unlicense]:https://spdx.org/licenses/Unlicense.html#licenseText
[Non-commercial-activity]:https://en.wikipedia.org/wiki/Non-commercial_activity
[proprietary]:https://ja.wikipedia.org/wiki/%E3%83%97%E3%83%AD%E3%83%97%E3%83%A9%E3%82%A4%E3%82%A8%E3%82%BF%E3%83%AA%E3%83%BB%E3%82%BD%E3%83%95%E3%83%88%E3%82%A6%E3%82%A7%E3%82%A2
[FSF]:https://ja.wikipedia.org/wiki/%E3%83%95%E3%83%AA%E3%83%BC%E3%82%BD%E3%83%95%E3%83%88%E3%82%A6%E3%82%A7%E3%82%A2%E8%B2%A1%E5%9B%A3
[OSI]:https://ja.wikipedia.org/wiki/Open_Source_Initiative
[SPDX]:https://spdx.org/licenses/

# 開発環境

* <time datetime="2020-01-26T12:18:40+0900">2020-01-26</time>
* [Raspbierry Pi](https://ja.wikipedia.org/wiki/Raspberry_Pi) 4 Model B Rev 1.2
* [Raspbian](https://ja.wikipedia.org/wiki/Raspbian) buster 10.0 2019-09-26 <small>[setup](http://ytyaru.hatenablog.com/entry/2019/12/25/222222)</small>
* bash 5.0.3(1)-release

```sh
$ uname -a
Linux raspberrypi 4.19.75-v7l+ #1270 SMP Tue Sep 24 18:51:41 BST 2019 armv7l GNU/Linux
```

# インストール

* [jq](https://stedolan.github.io/jq/)
* [licensee](https://github.com/licensee/licensee)

```sh
sudo apt install -y jq
sudo apt install -y ruby bundler cmake pkg-config git libssl-dev
sudo gem install licensee
git clone https://github.com/ytyaru/lish
```

# 使い方

## シンボリックリンク作成＆パスに通す

```sh
cd lish/src
ln -s ./lish.sh /usr/bin/lish
```

## ヘルプ表示

　[ヘルプ](res/help/help.txt)

```sh
lish -h
```

## ライセンスファイル出力

　ライセンスは[エイリアス](res/ids/alias.txt)で指定できる。

```sh
lish p # public-domain CC0-1.0
lish l # copyleft      AGPL-3.0
lish c # copycenter    Apache-2.0
```

　`LICENSE`ファイルを現在のディレクトリに出力する。

### ファイル名に接尾辞を追加 `-i`

　[ライセンスID](res/ids/alias.txt)をファイル名のサフィックスに追加する。

```sh
lish -i GPL
```

　上記の場合、出力ファイル名は`LICENSE-GPL-3.0-only`である。

### 著作権表示オプション

#### 著者名 `-a`

　`MIT`と`BSD`には著者名が必要。

```sh
lish -a 'First Last' MIT
```

　`./git/config`ファイルがある場合、`git config --local user.name`の値を使用する。

#### 著作権発行年 `-y`

　オプションで、著作権の発行年を指定できる。

```sh
lish -a A -y 1999 MIT
```

　指定しない場合は、実行時の年を使用する。

### ライセンス選択 `select`

```sh
lish select
```
```sh
1) CC0		  3) AGPL	   5) LGPL	    7) CC-BY-SA	     9) MIT	     11) BSD-3
2) Unlicense	  4) GPL	   6) CC-BY	    8) Apache	    10) BSD-2	     12) BSD-3-Clear
```

`MIT`と`BSD`では著者名の入力を求めることがある。

```sh
Author name: 
```

## ライセンス検出

[licensee](https://github.com/licensee/licensee)を使用して、 `LICENSE`ファイルからライセンスIDを返す。

```sh
lish detect
```

　以下、複数のライセンスがある場合の例。 `LICENSE`ファイル名を変更して出力し併存させ、検出する。

```sh
$ lish -i l
$ lish -i c
$ lish detect
Apache-2.0
GPL-3.0
```

## 標準ライセンスヘッダ出力 `-s`

　ターゲットは`GPL`,` AGPL`,`CC0`,`Apache`。 [headers](res/headers). 情報源は[SPDX v3.7 2019-10-22](https://spdx.org/licenses/)

```sh
lish -s GPL
```

　標準出力`stdout`に出力する。

#### リポジトリ名 `-r`

```sh
lish -s -r 'My Repo' GPL
```

### テンプレート値

　たとえば`GPL`は次のとおり。

```
{{REPO_NAME}}
Copyright (C) {{YEAR}} {{AUTHOR}}

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
```

テンプレート|値
------------|--
`{{REPO_NAME}}`|`-r`オプションの値。または現在のディレクトリ名
`{{YEAR}}`|`-y`オプションの値。 または実行時の年
`{{AUTHOR}}`|`-a`オプションの値。 または `git config --local user.name`

### 整形

#### 行の折返し

　80文字以外の単語で行を折り返す。Linuxでは`fold`コマンドを使う。

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

　`Apache-2.0`の標準ライセンスヘッダは行の折り返しが不要。既にされている。

#### インデント

```
cat ./res/headers/gpl-3.0-only.txt | sed -e 's/^/  /g'
```

# 注意

* 一部のテンプレートファイルの内容が重複しています
    * `AGPL`, `GPL`, `LGPL`
        * `-only`, `-or-later`
             * 将来の変更に備えて念の為

# 著者

　ytyaru

* [![github](http://www.google.com/s2/favicons?domain=github.com)](https://github.com/ytyaru "github")
* [![hatena](http://www.google.com/s2/favicons?domain=www.hatena.ne.jp)](http://ytyaru.hatenablog.com/ytyaru "hatena")
* [![mastodon](http://www.google.com/s2/favicons?domain=mstdn.jp)](https://mstdn.jp/web/accounts/233143 "mastdon")

# ライセンス

　このソフトウェアはCC0ライセンスである。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)

