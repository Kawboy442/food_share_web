    // Firebaseアップロード: https://kido0617.github.io/js/2019-12-01-firebase-form-upload/
	// 画像プレビュー: https://www.memory-lovers.blog/entry/2019/12/12/170000

	//firebase初期化
    var firebaseConfig = {
      apiKey: 'AIzaSyBZHohuKk5NhVMjA1spuJEkU30ZBcLUcb4',
      projectId: 'foodshare-341e7',
      storageBucket: 'foodshare-341e7.appspot.com',
    }
    firebase.initializeApp(firebaseConfig);

    function uploadthumbnail(target) {
      const reader = new FileReader();
      reader.onload = function (e) {
    	  document.querySelector("#thumbnail").setAttribute('src', e.target.result);
      }
      reader.readAsDataURL(target.files[0]);

      const uploads = [];
      for (const file of document.querySelector('#thumbnailPhoto').files) {
    	// ユーザー名のフォルダに置き、ファイルはthumbnail/(ユーザー名)/ファイル名の構成でアップロード
    	const storageRef = firebase.storage().ref("thumbnail" + "/" + file.name);
        uploads.push(storageRef.put(file));
        const url = 'https://storage.googleapis.com/' + storageRef;
        document.querySelector('#thumbnailUrl').value = url;
      }
      //すべての画像のアップロード完了を待つ
      Promise.all(uploads).then(function () {
        console.log('サムネイル画像アップロード完了');
      });
    }