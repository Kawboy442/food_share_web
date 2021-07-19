// Firebaseアップロード: https://kido0617.github.io/js/2019-12-01-firebase-form-upload/
// 画像プレビュー: https://qiita.com/gsk3beta/items/46d44793827920282f75

'use strict';

//firebase初期化
var firebaseConfig = {
    apiKey: "AIzaSyBZHohuKk5NhVMjA1spuJEkU30ZBcLUcb4",
    projectId: "foodshare-341e7",
    storageBucket: "foodshare-341e7.appspot.com",
};
firebase.initializeApp(firebaseConfig);

function uploadPhoto1() {
	$(document).on('change', ':file', function() {
	    var input = $(this),
	    numFiles = input.get(0).files ? input.get(0).files.length : 1,
	    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	    input.parent().parent().next(':text').val(label);

	    var files = !!this.files ? this.files : [];
	    if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
	    if (/^image/.test( files[0].type)){ // only image file
	        var reader = new FileReader(); // instance of the FileReader
	        reader.readAsDataURL(files[0]); // read the local file
	        reader.onloadend = function(){ // set image data as background of div
	            input.parent().parent().parent().prev('.imagePreview').css("background-image", "url("+this.result+")");
	        }
	    }
	});

    const uploads = [];
    for (const file of document.querySelector("#images1").files) {
    	// ユーザー名のフォルダに置き、ファイルはユーザー名/アップロード時刻の構成でアップロード
        const userName = document.querySelector("#user_name").value;
        const date = new Date();
        const storageRef = firebase.storage().ref(userName + "/" + date.toLocaleString());
        uploads.push(storageRef.put(file));
        const url = "https://storage.googleapis.com/" + storageRef;
        document.querySelector("#photoUrl1").value = url;
    }
    //すべての画像のアップロード完了を待つ
    Promise.all(uploads).then(function() {
        console.log("写真その1アップロード完了");
    });
}

function uploadPhoto2() {
	$(document).on('change', ':file', function() {
	    var input = $(this),
	    numFiles = input.get(0).files ? input.get(0).files.length : 1,
	    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	    input.parent().parent().next(':text').val(label);

	    var files = !!this.files ? this.files : [];
	    if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
	    if (/^image/.test( files[0].type)){ // only image file
	        var reader = new FileReader(); // instance of the FileReader
	        reader.readAsDataURL(files[0]); // read the local file
	        reader.onloadend = function(){ // set image data as background of div
	            input.parent().parent().parent().prev('.imagePreview').css("background-image", "url("+this.result+")");
	        }
	    }
	});

    const uploads = [];
    for (const file of document.querySelector("#images2").files) {
        // ユーザー名のフォルダに置き、ファイルはユーザー名/アップロード時刻の構成でアップロード
        const userName = document.querySelector("#user_name").value;
        const date = new Date();
        const storageRef = firebase.storage().ref(userName + "/" + date.toLocaleString());
        uploads.push(storageRef.put(file));
        const url = "https://storage.googleapis.com/" + storageRef;
        document.querySelector("#photoUrl2").value = url;
    }
    // すべての画像のアップロード完了を待つ
    Promise.all(uploads).then(function() {
        console.log("写真その2アップロード完了");
    });
}