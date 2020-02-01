[en](./README.md)

# lish

　`LICENSE`ファイルを生成する。

# 特徴

* CLI (bash)
* 12種類のライセンスに対応

系列|ライセンス
----|--------
コピーレフト|`AGPL`, `GPL`, `LGPL`, `CC-BY-SA-4.0`
パーミッシブ|`Apache-2.0`, `MIT`, `BSD`(2,3,3-clear), CC-BY-4.0
パブリックドメイン|`CC0`, `Unlicense`

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
ln ./lish.sh ./lish
```

```sh
export PATH="/path/exist_lish_dir:$PATH"
```

## ヘルプ表示

　[ヘルプ](res/help/help.txt)

```sh
cd lish/src
./lish -h
```

## ライセンスファイル出力

　ライセンスは[エイリアス](res/ids/alias.txt)で指定できる。

```sh
./lish p # public-domain CC0-1.0
./lish l # copyleft      AGPL-3.0
./lish c # copycenter    Apache-2.0
```

　`LICENSE`ファイルを現在のディレクトリに出力する。

### ファイル名に接尾辞を追加 `-i`

　[ライセンスID](https://spdx.org/licenses/)をファイル名のサフィックスに追加します。

```sh
./lish -i GPL
```

　上記の場合、出力ファイル名は`LICENSE-GPL-3.0-only`である。

### 著作権表示オプション

#### 著者名 `-a`

　`MIT`と`BSD`には著者名が必要。

```sh
./lish -a 'First Last' MIT
```

　`./git/config`ファイルがある場合、`git config --local user.name`の値を使用する。

#### 著作権発行年 `-y`

　オプションで、著作権の発行年を指定できる。

```sh
./lish -a A -y 1999 MIT
```

　指定しない場合は、実行時の年を使用する。

### ライセンス選択 `select`

```sh
./lish select
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
./lish detect
```

　以下、複数のライセンスがある場合の例。 `LICENSE`ファイル名を変更して出力し併存させ、検出します。

```sh
$ ./lish -i l
$ ./lish -i c
$ ./lish detect
Apache-2.0
GPL-3.0
```

## 標準ライセンスヘッダ出力 `-h`

　ターゲットは`GPL`,` AGPL`,`CC0`,`Apache`。 [headers](res/headers). 情報源は[SPDX v3.7 2019-10-22](https://spdx.org/licenses/)

```sh
./lish -s GPL
```

　標準出力`stdout`に出力する。

#### リポジトリ名 `-r`

```sh
./lish -s -r 'My Repo' GPL
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
`{{REPO_NAME}}`|`-r`オプションの値。現在のディレクトリ名
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

