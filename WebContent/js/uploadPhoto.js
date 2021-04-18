    // Firebaseアップロード: https://kido0617.github.io/js/2019-12-01-firebase-form-upload/
	// 画像プレビュー: https://www.memory-lovers.blog/entry/2019/12/12/170000

	//firebase初期化
    var firebaseConfig = {
      apiKey: 'AIzaSyBZHohuKk5NhVMjA1spuJEkU30ZBcLUcb4',
      projectId: 'foodshare-341e7',
      storageBucket: 'foodshare-341e7.appspot.com',
    }
    firebase.initializeApp(firebaseConfig);

    function uploadPhoto1(target) {
      const reader = new FileReader();
      reader.onload = function (e) {
    	  document.querySelector("#preview1").setAttribute('src', e.target.result);
      }
      reader.readAsDataURL(target.files[0]);

      const uploads = [];
      for (const file of document.querySelector('#images1').files) {
    	// ユーザー名のフォルダに置き、ファイル名はファイル追加時刻+ファイル名としてアップロード
    	const userName = document.querySelector('#user_name').value;
    	const date = new Date();
    	const storageRef = firebase.storage().ref(userName + '/' + date.toLocaleString() + '_' + file.name);
        uploads.push(storageRef.put(file));
        const url = 'https://storage.googleapis.com/' + storageRef;
        document.querySelector('#photoUrl1').value = url;
      }
      //すべての画像のアップロード完了を待つ
      Promise.all(uploads).then(function () {
        console.log('写真その1アップロード完了');
      });
    }

    function uploadPhoto2(target) {
    	const reader = new FileReader();
        reader.onload = function (e) {
        	document.querySelector("#preview2").setAttribute('src', e.target.result);
        }
        reader.readAsDataURL(target.files[0]);

        const uploads = [];
        for (const file of document.querySelector('#images2').files) {
          // ユーザー名のフォルダに置き、ファイル名はファイル追加時刻+ファイル名としてアップロード
          const userName = document.querySelector('#user_name').value;
          const date = new Date();
          const storageRef = firebase.storage().ref(userName + '/' + date.toLocaleString() + '_' + file.name);
          uploads.push(storageRef.put(file));
          const url = 'https://storage.googleapis.com/' + storageRef;
          document.querySelector('#photoUrl2').value = url;
        }
        // すべての画像のアップロード完了を待つ
        Promise.all(uploads).then(function () {
          console.log('写真その2アップロード完了');
        });
      }