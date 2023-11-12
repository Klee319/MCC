// 画面を一番下にスクロールする関数

function scrollToBottom() {
    console.log("scrollToBottom");
    var container = document.getElementById('talks-container');
    container.scrollTop = container.scrollHeight;
}
// ページ読み込み時に画面を一番下にスクロール
document.addEventListener("DOMContentLoaded", scrollToBottom);
document.addEventListener("turbolinks:load", scrollToBottom);
document.addEventListener("submmit", scrollToBottom);
