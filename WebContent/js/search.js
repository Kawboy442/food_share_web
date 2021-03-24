$(function(){
	// 1.フォーム要素の取得
	var search_form = $("#search_form");
	// 2.フォームのsubmitイベントを取得
	search_form.submit(function(){
		// 3.入力されているキーワードを取得し、正規表現により未入力かどうかを判別する
		var storeName = $('input[id=store_name]').val();
		var userName = $('input[id=user_name]').val();
		var evaluation = $('input[id=evaluation]').val();
		if(storeName.match(/^[ 　\r\n\t]*$/) && userName.match(/^[ 　\r\n\t]*$/) && evaluation == 0){
			return false;
		}
	});
});
