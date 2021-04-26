// 各種タグの取得
const storeName = document.querySelector("#store_name");
const userName = document.querySelector("#user_name");
const evaluation = document.querySelector("#evaluation");
const button = document.querySelector("#search_btn");

// 店名が入力されたらボタンを有効化
storeName.addEventListener("keydown", () => {
    button.disabled = false;
});

// ユーザー名が入力されたらボタンを有効化
userName.addEventListener("keydown", () => {
    button.disabled = false;
});

// 星評価で0以外が選択されたらボタンを有効化
evaluation.addEventListener("change", function() {
    const form = document.search_form.evaluation;
    const select = evaluation.selectedIndex;
    const value = form.options[select].value;
    if (value != 0) {
        button.disabled = false;
    }
});