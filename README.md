# README

## 前回までの Real World

1.Home(root_path)はArticleの一覧が表示されるように設定しました。<br>
2.Articleには投稿者の情報を紐付けて管理しています。<br>
3.ArticleのCRUD処理は実装できました。<br>

~~UserのCRUD処理も実装しました。Deleteだけ上手く機能せず登録ユーザーが残ってしまいます。~~<br>
~~Current_userの機能も実装しましたが、ログインができてログアウトができない状態です。~~<br>
<br>
4.link_toタグをbutton_toに書き換えることで無事解決。ユーザーのログアウトもできるようになりました

5.テストコードを作成なぜだか、セッションコントローラーのテストだけログインIDが一致しない事象が発生するも及第点。

## APIを実装してみた
今回の主な変更点は以下のファイルとなります。

- [routes.rb](config/routes.rb)
- [articles_controller.rb](app/controllers/api/v1/articles_controller.rb)
- [cors.rb](config/initializers/cors.rb)


