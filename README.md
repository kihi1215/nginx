# nginx
centos7＋nginx

PHPのテストをしたいので、とりあえず試験用ということで。

php-fpmのアドレスやポートを可変にと思ったが結果的に意味がない状態で一旦コミット。
（環境変数をperl_setでnginx.confに取り込んでいるが、この環境変数名自体がある意味固定だから）
コーディングミスかもしれないが、docker run時に-eで指定した環境変数を使うとうまくいかなかった。

上記状態よりも、埋め込みでサーバ名を書いた方がましなので、すぐに別の方法に変更してコミット
する予定。

環境変数をやめてサーバ名を固定(ポートも9000固定)に変更。サーバ名はdocker run時のリンクの設定で指定した別名
と一致させなければならない。ので、必ずリンク時の別名を "php"にする必要がある。
その代わりphpのコンテナのIPアドレスが変更されてても修正は不要。
(本来はコンポーザでやれば良いのかな)
