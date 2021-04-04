    // https://kido0617.github.io/js/2019-12-01-firebase-form-upload/

	//firebase初期化
    var firebaseConfig = {
      apiKey: 'AIzaSyBZHohuKk5NhVMjA1spuJEkU30ZBcLUcb4',
      projectId: 'foodshare-341e7',
      storageBucket: 'foodshare-341e7.appspot.com',
    }
    firebase.initializeApp(firebaseConfig);

    //formのsubmitにイベント設定
    var form = document.querySelector('form');
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      var imgs = form.querySelector('#images');
      var uploads = [];
      for (var file of imgs.files) {
          //選択したファイルのファイル名を使うが、場合によってはかぶるので注意
        var storageRef = firebase.storage().ref('form-uploaded/' + file.name);
        uploads.push(storageRef.put(file));
      }
      //すべての画像のアップロード完了を待つ
      Promise.all(uploads).then(function () {
        console.log('アップロード完了');
      });
    });