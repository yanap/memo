インデックスはANSI SQLに規程されていな
## インデックスする意味ないパターン

主キーは自動的にインデックスを生成するので、明示的に定義するのは冗長です。

varchar(80)などの長い文字列を格納するデータ型へのインデックスは、よりコンパクトなデータ型のインデックスと比べてさいずが大きくなります。

## Explain(解析)

クエリ実行計画(QEP

EXPLAIN
EXPLAIN



複合インデックスは、ヒット率が低くなりがち
列を定義した順(左から右)に使わなければなりません

# MENTOR

DBがボトルネックとは限らない、ソフトウェア診断ツールを実行するようにしよう

## Measure(測定)

MySQLとPostgreSQLは、指定された閾値より実行時間が長くかかったクエリを記録できます。
MySQLでは、この機能はスロークエリログと呼ばれます。


プロファイル

クエリパフォーマンス測定中は、クエリ結果のキャッシュを全て無効化しましょう

https://docs.datadoghq.com/ja/integrations/mysql/


https://dev.classmethod.jp/articles/datadog-enhanced-rds-integration/

プロファイリングツール

## Explain(解析)

クエリ実行計画(QEP

EXPLAIN

https://dev.mysql.com/doc/refman/5.7/en/using-explain.html

## Nominate(指名)

クエリのQEPを読んで、クエリがインデックを使わないでテーブルにアクセスしている箇所を探しましょう

https://www.mysql.com/products/enterprise/query.html

https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights.UsingDashboard.html


## Test(テスト)

テストは重要なステップです。インデックスの作成後、再びクエリのプロファイリングを行うのです。大事なのは、変更が効果をもたらしたことを確認してから作業を終了することです。

パフォーマンスの問題を改善するためにあらゆる手段を講じましたが、その結果どのような効果があったかについては、しばらく様子を見なければなりません。

使用頻度の高いテーブルに新たなインデックスを１つ作成すべきだと判断し、重要なクエリ複数でパフォーマンスを38パーセント改善しました

## Optimize(最適化)

キャッシュメモリ
データベースサーバではキャッシュに割り当てるシステムメモリの量を設定できます。

インデックスをあらかじめキャッシュメモリにロードしておく
MySQLでは、LOAD INDEX INTO CACHE

## Rebuild(再構築)

インデックスはバランスが取れている時に最も効果的です。

MySQL ANALYZE TABLE, OPTIMIZE TABEL


## フィア・オブ・ジ・アンノウン

NULL

## アンビギュアスグループ

クエリから曖昧な列を排除する

相関サブクエリを使用する

導出テーブルを使用する

JOINを使用する

## ランダムセレクション

効率の良いSQLを書く

アプリケーションに全ての行を読み込むような非効率な手法は、使用するべきではありません。

## プアマンズ・サーチエンジン

全文検索エンジン

## スパゲッチクエリ

アンチパターン: 複雑な問題をワンステップで解決しようとする

１つのクエリで全てを処理しようとすると、デカルト積が生じてしまう

アンチパターンを用いても良い場合
BIツールを使うときなど

解決策: 分割統治を行う

まったく同じ予測をする２つの競合する理論がある時は単純な方が優れている


UNIONを用いる(結果を１つにしたいとき)

CASE式とSUM関数を組み合わせる

タスクを分割する

## インプリシットカラム

ORM

クエリでワイルドカードを使うのは便利ですが、パフォーマンスとスケーラビリティに悪い影響を及ぼす場合があります。

## リーダブルパスワード

https://owasp.org/

パスワードは平文で保存するのはやめましょう

ハッシュアルゴリズム
SHA-1の暗号強度は不十分
パスワードはSHA-256を使うのが望ましい

ハッシュにソルトを付け加える
ソルトとは、ハッシュ関数に渡す前にパスワードに連結する無意味な文字列のことです。


パスワードリセットは１次パスワードを使う


## SQLインジェクション

### 効果的な方法

プリペアードステートメント

ストアドプロシージャ

## シュードキー・ニートフリーク

解決策: 擬似キー
の欠番は埋めない

擬似キーに意味を身言い出したい場合は、主キーを自然キー（ナチュラルキー）に変更する

## シー・ノー・エビル

目的: 簡潔なコードを書く

アンチパターンを用いても良い場合
例えば、データベースコネクションのlose関数がステータスを返したものの、アプリケーション自身が終了の途中なら
接続のためのリソースもクリーンアップされると考えても良いでしょう

## ディプロマティック・イミュニティ

ベストプラクティスに従わずに、技術的負債を抱える

目的: ベストプラクティスを採用する

Git
unit testや機能テストの自動化
ドキュメント、仕様書、コードコメントを書き、アプリケーションの要件や実装戦略を記録する

アンチパターン:SQLを特別扱いする

## 解決策 : 包括的に品質問題に取り組む

品質とは単にテストを行うことを意味する。
品質管理(Quality Control: QC)
品質保証(Quality Assurance QA)

QA
1. プロジェクト要件の明確な定義・文章化
2. 要件に対する解決策の設計・構築
3. 解決策が要件を満たしていることの確認・テスト

文書化
ER図

テーブル、列、ビュー
NULLを許容するかしないか、一意制約性があるか

関連
トリガー : バリデーション名どのこと

ストアドプロシージャ
https://qiita.com/setsuna82001/items/e742338eb93e3a48ba46


SQLセキュリティ
SQLインジェクション脆弱性対策のための徹底したコードレビュー

データベースインフラストラクチャ
ホスト名、DBサーバの冗長化（レプリケーション、クラスタリング、プロキシなど）
ネットワーク構成とポート番号
クライアントが使用する接続オプション

ORM(オブジェクトリレーションマッピング)
実装されるビジネスロジックは何かを記述

## バージョン管理

データ定義スクリプト
create文など

トリガーとプロシージャ

ブートストラップデータ

ER図とドキュメント

データベース管理スクリプト


アプリケーションコードとデータベースコードは、同じバージョン管理リポジトリを用いるようにしましょう　(これ、ベストプラクティスなのか、分けてたので、同じrepoにする理由増えた)

## テスティング

品質管理(Quality Control)です
テスティングの重要な原則の１つは独立(isolation)です。
アイソレーションテスト(isolation testing)

### テーブル、列、ビュー

データベースに存在すべきテーブルやビューなどが、実際に存在することをテストで確認する
否定テスト、プロジェクトの現在のリビジョンから削除したテーブルや列が本当に存在できないことを確認できます

### 制約

制約に違反してエラーになるはずのINSERT, UPDATE, DELETE

トリガー
ストアドプロシージャ
ブートストラップデータ
クエリ
### ORM
無効な入力を拒絶することを確認しましょう

マイグレーションスクリプト

## マジックビーンズ

デザインパターン
これは、クリーンアーキテクチャにしてるから
解決策：ドメインモデルの使用
ドメインモデル is クリーンアーキテクチャなので、クリーンアーキテクチャも深堀したいですね

プログラムが正しくDBの値を取得できてるか、ビジネスロジック、要件定義、設計通りのコードかというテストの場合はスタブとモックでよくて
実際DBのテーブルや列があるかどうかってテストはアプリケーションコード関係なく、それだけのテスト書いた方が良さそうやね