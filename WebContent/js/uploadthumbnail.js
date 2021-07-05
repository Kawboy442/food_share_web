// Firebaseアップロード: https://kido0617.github.io/js/2019-12-01-firebase-form-upload/
// 画像プレビュー: https://www.memory-lovers.blog/entry/2019/12/12/170000

//firebase初期化
var firebaseConfig = {
    apiKey: "AIzaSyBZHohuKk5NhVMjA1spuJEkU30ZBcLUcb4",
    projectId: "foodshare-341e7",
    storageBucket: "foodshare-341e7.appspot.com",
};
firebase.initializeApp(firebaseConfig);

function uploadthumbnail() {
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
	            input.parent().parent().parent().prev('.thumbnailPreview').css("background-image", "url("+this.result+")");
	        }
	    }
	});

    const uploads = [];
    for (const file of document.querySelector("#thumbnailPhoto").files) {
        // ファイルはthumbnail/ユーザー名/8桁の乱数の構成でアップロード
        const userName = document.querySelector("#user_name").value;
        const randomStr = chance.string({
        	  length: 8,
        	  pool: '0123456789abcdef',
        	});
    	const storageRef = firebase.storage().ref("thumbnail/" + userName + "/" + randomStr);
        uploads.push(storageRef.put(file));
        const url = "https://storage.googleapis.com/" + storageRef;
        document.querySelector("#thumbnailUrl").value = url;
    }
    //すべての画像のアップロード完了を待つ
    Promise.all(uploads).then(function() {
        console.log("サムネイル画像アップロード完了");
    });
}