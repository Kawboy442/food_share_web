# 食べ物シェア

URL: https://foodshareweb.herokuapp.com/

お店で食べた食事を写真や評価とともにシェアし、内容を共有出来るサービスです。

![FireShot Capture 229 - 食べ物シェア - localhost](https://user-images.githubusercontent.com/53920598/126440762-53af1fe1-1868-45ba-8f2d-6443c15605fd.png)

サイトマップ
---

![食べ物シェア サイトマップ](https://user-images.githubusercontent.com/53920598/126189449-a7ce94c2-805e-4d7a-ba9d-75062813bd01.png)

機能一覧
---
- レスポンシブデザイン対応 (Bootstrap)
- ログイン/ログアウト機能
- 会員登録・情報編集機能
- 新規投稿・投稿削除機能
- 投稿内容検索(店名・ユーザー名・評価)機能
- 投稿画像・ユーザーサムネイル画像アップロード機能 (Cloud Storage for Firebase)
- ユニットテスト (JUnit)
- CI(継続的インテグレーション) (GitHub Actions)

使用環境
---
- macOS Big Sur 11.4
- Eclipse([Pleiades](https://mergedoc.osdn.jp/)) 4.6.3

使用ソフトウェア・ライブラリ一覧 (使用用途)
---
- Tomcat 8.0.43 (Java 8)
- Servlet 3.1
- JSP 2.3
- JUnit 4
- [JQuery](https://jquery.com/) 3.5.1
- [Bootstrap](https://getbootstrap.jp/) 4.5.3 (レスポンシブデザイン対応)
- [Lightbox](https://lokeshdhakar.com/projects/lightbox2/) 2.11.3 (画像ポップアップ表示)
- [Firebase-app](https://firebase.google.com/?hl=ja), [Firebase-storage](https://firebase.google.com/docs/storage?hl=ja) 8.3.2 (画像アップロード)
- [Chance.js](https://chancejs.com/) 1.1.7 (乱数生成)

データベース ER図
---
![食べ物シェア ER図](https://user-images.githubusercontent.com/53920598/126127774-31f783fd-cff0-4a0d-9af9-6389dad582fa.png)

導入方法
---

1. [Pleiades 公式サイト](https://mergedoc.osdn.jp/) より、Eclipse 4.6 Neonをダウンロードし、PCにインストールする。
2. GitHubよりこのレポジトリをクローンする。推奨保存先は下記の様にEclipse内の`Contents > Workspace` 内に適当なフォルダを作成(下記画像の例では`food_share_web`で作成)し、作成したフォルダにクローンする。
![プロジェクト保存先](https://user-images.githubusercontent.com/53920598/126457417-f74c456c-1604-431e-8b56-9e336336bbbe.png)
![フォルダ作成](https://user-images.githubusercontent.com/53920598/126458322-b54a8e2a-cf5d-466f-95b5-16c378224a5d.png)
3. Eclipseを開き、メニューから`ファイル > ファイル・システムからプロジェクトを開く...`を選択する。

![Eclipseメニュー](https://user-images.githubusercontent.com/53920598/126458584-d9e71fd7-cb6f-47a7-958d-6e8fa9fa520d.png)

4. 下記のような画面が開いたら、画像内の赤丸で覆った、`ディレクトリー...`を押し、クローンしたプロジェクトの保存先ディレクトリを選択し、
画面下にある`完了`をクリックする。

![ファイル・システムまたはアーカイブからプロジェクトをインポート](https://user-images.githubusercontent.com/53920598/126461121-b71ac121-fd86-47eb-9a44-399697209d76.png)

5. プロジェクトをEclipseにてインポート後、下記画像のように`src`と`WEB-INF`配下のファイルがエラー表示になる場合がある。その場合は6以降を参照すること。

![インポート後エラー](https://user-images.githubusercontent.com/53920598/126861622-0cfe3c37-5b44-4320-a66d-727b8a1e6fe8.png)

6. `src`配下のファイルを適当に開き、下記画像のようにエラーが出ている箇所の赤丸で覆ったアイコンを右クリックし、メニューの中から`プロジェクト・セットアップの修正...`をクリックする。

![エラー解消手順1](https://user-images.githubusercontent.com/53920598/126861943-7bc1e73b-aba9-457a-878a-1575f9fea33d.png)

7. 下記画像のような表示が出たら、`OK`を押す。すると処理が走り、エラーが解消される。

![エラー解消手順２](https://user-images.githubusercontent.com/53920598/126862048-459d8636-711d-4772-8b31-e2e30a4a7fe0.png)

8. ここまで行い、テストコード(`TestTimestampUtil`)のみエラーが出た場合は、下記画像のようにエラーが出ている箇所の赤丸で覆ったアイコンを右クリックし、メニューの中から`プロジェクト・セットアップの修正...`をクリックする。

![テストコードエラー解消手順1](https://user-images.githubusercontent.com/53920598/126862164-0315b6ca-bcf0-4508-8d85-d6badf021b69.png)

9. 下記画像のような表示が出たら、`OK`を押す。すると処理が走り、エラーが解消される。

![テストコードエラー解消手順2](https://user-images.githubusercontent.com/53920598/126862185-bde6b116-819b-4910-833d-9449bc899ba1.png)

10. ここまで来ると、プロジェクトの編集が可能になる。更に、今後プロジェクトを改修する際、Eclipse右上の下記画像のメニューを`Java EE`のモードにしておくこと。

![Java EEへ変更](https://user-images.githubusercontent.com/53920598/126862321-40a0db67-ffd6-42b0-8f4e-577984a8b79a.png)

11. ローカルサーバーを立ち上げてWebブラウザなどで動作確認を行う際には、Eclipse下にある、`サーバー`の項目から下記画像の矢印のリンクをクリックし、設定を行う。

![ローカルサーバー立ち上げ1](https://user-images.githubusercontent.com/53920598/126862390-e874c65b-6418-4993-ab7a-e1d174417e78.png)

12. クリックすると下記のような画面が出るので、`サーバーのタイプを選択: `の中から`Tomcat v8.0 サーバー`を選択し、赤丸で覆った`次へ>`をクリックする。

![ローカルサーバー立ち上げ2](https://user-images.githubusercontent.com/53920598/126862474-573de974-490c-47b8-90b8-f72c80091c07.png)

13. 下記のような画面が出たら、`使用可能: `の項目内に`food_share_web`があるのを確認したらクリックして選択済みの状態にし、赤丸で覆った追加を押す。すると、`構成済み`の項目内に`food_share_web`が追加される。追加されたのが確認出来たら`完了`をクリックして設定を終了する。

サーバー追加前            | サーバー追加後
:-------------------------:|:-------------------------:
![サーバー追加前](https://user-images.githubusercontent.com/53920598/126862701-7290267f-2b0b-41fd-9e37-d73b951dba80.png)|![サーバー追加後](https://user-images.githubusercontent.com/53920598/126862534-02522a9f-0baf-4545-a1f7-6f828a51e74d.png)

14. 設定後、`サーバー`の項目内に`ローカル・ホストのTomcat8(Java8)`という項目が追加されているので、選択して右クリックし、`開始`をクリックするとローカルサーバーが起動し、Webページが確認できるようになる。

![ローカルサーバー起動](https://user-images.githubusercontent.com/53920598/126862798-060cd59a-7c39-4237-9f31-c6cad91180e1.png)
