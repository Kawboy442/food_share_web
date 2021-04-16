    // https://kido0617.github.io/js/2019-12-01-firebase-form-upload/

	//firebase初期化
    var firebaseConfig = {
      apiKey: 'AIzaSyBZHohuKk5NhVMjA1spuJEkU30ZBcLUcb4',
      projectId: 'foodshare-341e7',
      storageBucket: 'foodshare-341e7.appspot.com',
    }
    firebase.initializeApp(firebaseConfig);

    function uploadPhoto1() {
      var imgs = document.querySelector('#images1');
      var uploads = [];
      for (var file of imgs.files) {
          //選択したファイルのファイル名を使うが、場合によってはかぶるので注意
        var storageRef = firebase.storage().ref('form-uploaded/' + file.name);
        uploads.push(storageRef.put(file));
        var url = 'https://storage.googleapis.com/' + storageRef;
        document.querySelector('#photoUrl1').value = url;
      }
      //すべての画像のアップロード完了を待つ
      Promise.all(uploads).then(function () {
        console.log('写真その1アップロード完了');
      });
    }

    function uploadPhoto2() {
        var imgs = document.querySelector('#images2');
        var uploads = [];
        for (var file of imgs.files) {
            //選択したファイルのファイル名を使うが、場合によってはかぶるので注意
          var storageRef = firebase.storage().ref('form-uploaded/' + file.name);
          uploads.push(storageRef.put(file));
          var url = 'https://storage.googleapis.com/' + storageRef;
          document.querySelector('#photoUrl2').value = url;
        }
        //すべての画像のアップロード完了を待つ
        Promise.all(uploads).then(function () {
          console.log('写真その2アップロード完了');
        });
      }