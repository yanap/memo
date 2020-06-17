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


