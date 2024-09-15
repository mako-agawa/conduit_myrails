# README

## 前回までの Real World

1.Home(root_path)はArticleの一覧が表示されるように設定しました。<br>
2.Articleには投稿者の情報を紐付けて管理しています。<br>
3.ArticleのCRUD処理は実装できました。<br>

~~UserのCRUD処理も実装しました。Deleteだけ上手く機能せず登録ユーザーが残ってしまいます。~~<br>
~~Current_userの機能も実装しましたが、ログインができてログアウトができない状態です。~~<br>
<br>
**4.link_toタグをbutton_toに書き換えることで無事解決。ユーザーのログアウトもできるようになりました**

## Real World でテストをしてみた!!

### step1:
テスト項目：　記事一覧(indexアクションが成功するか確認)<br>
[articles_controller_test](/test/controllers/articles_controller_test.rb)

### step2:
• ユーザーログインが成功するかを確認。← ログインのテストだけFailure:となり検証できていません。
• タイトルとボディが正しい場合、記事が有効かをテスト。
• タイトルがない場合に無効であることを確認。
• ボディがない場合に無効であることを確認。
• ボディが10文字未満の場合に無効であることを確認。
• indexアクションが成功することを確認。
• showアクションが成功することを確認。
• 有効なパラメータで記事を作成できるかを確認。
• 無効なパラメータで記事を作成できないことを確認。
• 有効なパラメータで記事を更新できるかを確認。
• 無効なパラメータで記事を更新できないことを確認。
• 記事が正常に削除されるかを確認。
• ユーザーログアウトが成功するかを確認。

### step3
上記のSTEP2の項目をtest.rbに記述<br>
[articles_controller_test](/test/controllers/articles_controller_test.rb)
[sessions_controller_test](/test/controllers/sessions_controller_test.rb)
