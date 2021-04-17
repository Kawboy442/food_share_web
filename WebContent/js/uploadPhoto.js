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
      var reader = new FileReader();
      reader.onload = function (e) {
    	  document.querySelector("#preview1").setAttribute('src', e.target.result);
      }
      reader.readAsDataURL(target.files[0]);

      var uploads = [];
      for (var file of document.querySelector('#images1').files) {
          //選択したファイルのファイル名を使うが、場合によってはかぶるので注意
    	var userName = document.querySelector('#user_name').value;
        var storageRef = firebase.storage().ref(userName + '/' + file.name);
        uploads.push(storageRef.put(file));
        var url = 'https://storage.googleapis.com/' + storageRef;
        document.querySelector('#photoUrl1').value = url;
      }
      //すべての画像のアップロード完了を待つ
      Promise.all(uploads).then(function () {
        console.log('写真その1アップロード完了');
      });
    }

    function uploadPhoto2(target) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	document.querySelector("#preview2").setAttribute('src', e.target.result);
        }
        reader.readAsDataURL(target.files[0]);

        var uploads = [];
        for (var file of document.querySelector('#images2').files) {
            //選択したファイルのファイル名を使うが、場合によってはかぶるので注意
          var userName = document.querySelector('#user_name').value;
          var storageRef = firebase.storage().ref(userName + '/' + file.name);
          uploads.push(storageRef.put(file));
          var url = 'https://storage.googleapis.com/' + storageRef;
          document.querySelector('#photoUrl2').value = url;
        }
        //すべての画像のアップロード完了を待つ
        Promise.all(uploads).then(function () {
          console.log('写真その2アップロード完了');
        });
      }