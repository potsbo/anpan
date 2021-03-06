# Anpan
[![Build Status](https://travis-ci.org/potsbo/anpan.svg?branch=master)](https://travis-ci.org/potsbo/anpan)
[![Code Climate](https://codeclimate.com/github/potsbo/anpan/badges/gpa.svg)](https://codeclimate.com/github/potsbo/anpan)
[![codecov](https://codecov.io/gh/potsbo/anpan/branch/master/graph/badge.svg)](https://codecov.io/gh/potsbo/anpan)

Anpan は Google日本語入力で利用できるローマ字テーブルの作成ツールであり、
またそれを用いて作成されたDvorakユーザー向けのローマ字テーブルである。

## Installation

### macOS
+ Google日本語入力をインストールして日本語入力で利用する。
+ 右上のインプットメニューの「A」または「あ」と書いてある青いアイコンをクリックし、「環境設定」へ進む。
+ 「キー設定」「ローマ字テーブル」のメニューの「編集」をクリックする。
+ 「ファイルからインポート」を選択し、[最新版](https://github.com/potsbo/anpan/releases/latest)のzipファイルのうち好みのものを選択してインポートする。

### Windows
+ Google日本語入力をインストールして日本語入力で利用する。
+ 右下のインプットメニューの「A」または「あ」と書いてある青いアイコンをクリックし、「プロパティ」へ進む。
+ 「キー設定」「ローマ字テーブル」のメニューの「編集」をクリックする。
+ 「ファイルからインポート」を選択し、[最新版](https://github.com/potsbo/anpan/releases/latest)のzipファイルのうち好みのものを選択してインポートする。

## Motivation
+ ローマ字テーブルの作成コストが高い問題を解決したい
+ Dvorakユーザーにとって最適なローマ字テーブルを作成したい

### ローマ字テーブルの作成コストが高い問題を解決したい
Dvorakを用いて日本語入力を行う場合DvorakJPなどの独自の日本語テーブルを使うことで
Dvorakで日本語入力する場合特有の「指/手に使用頻度が偏る」などの問題を解決することが一般的である。
DvorakJPの日本語テーブルは様々な実装が公開されているが、自分で作成するコストは高い。
Google日本語入力で標準で提供されている日本語テーブルには「fu」が二度定義されているなどの無駄が存在し、
ローマ字テーブルのメンテナンスコストが高いことが伺える。
これを 子音 / 母音 / シンボル を定義することでローマ字テーブルをレンダリングすることで解決したい。

### Dvorakユーザーにとって最適なローマ字テーブルを作成したい
DvorakJPはDvorakを利用して日本語入力を行うのには非常に有効な方法であり、
一般的な日本語入力のローマ字テーブルとの互換性も非常に高い。
しかしながら、互換性を無視すれば二重母音の数を増やすなどの方法でより効率的な打鍵を試みることが可能である。
これを作成して、簡単に利用できるようにしたい。

## Anpan (ローマ字テーブル)
Anpan は DvorakJP のアイデアをもとに一般的な日本語入力との互換性を無視することで
Dvorakにおいてより効率的な打鍵を行うことを目指したローマ字テーブルである。

### 設計思想
それぞれが競合する場合はより上にあるものを採用する。
+ 日本語を打鍵する際の負担を少なくする
+ 右手が子音 / 左手が母音を担当する
+ 左右交互打鍵になる確率を高める
+ Dvorak / DvorakJP 利用者にとって低い学習コスト

#### 日本語を打鍵する際の負担を少なくする
総打鍵数を少なくし、指の動きを少なくすることで、
日本語を入力する際により自然で負担の少ない打鍵になるようにする。

#### 右手が子音 / 左手が母音を担当する
右に子音 / 左に母音という構造を徹底することで、打鍵がほとんどの場合で左右交互になることを目指す。

#### 左右交互打鍵になる確率を高める
できるだけ左右交互打鍵となるようにする。

#### Dvorak / DvorakJP 利用者にとって低い学習コスト
Dvorak / DvorakJP利用者にとって学習コストが低いものにする。
これにより、日本語を利用するDvorakユーザーの多くに効率的な打鍵を提供する。


### キー配列
TODO

## Development
利用者の殆どが日本語を自由に使えると考えられるため、Issue や Pull Request は日本語で記述して良い。

## Future Works
+ Anpanテーブルの仕様を解説する
+ configファイルの仕様を解説する
+ 一部の改変のみを簡単に行う方法を実装する
+ バイナリから簡単にテーブルファイルの作成ができるようにする
+ dist ディレクトリに常に最新のテーブルファイルが配置される環境を構築する
+ Anpanテーブルの定量的な調査を行い記述する

## Licence 
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
