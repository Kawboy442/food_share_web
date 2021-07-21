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
