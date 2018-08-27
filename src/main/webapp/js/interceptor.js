// function setCookie(c_name, value, expiredays) {
//     var exdate = new Date();
//     exdate.setDate(exdate.getDate() + expiredays);
//     document.cookie = c_name + "=" + escape(value) +
//         ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString()) + "; path=/";
// }
//
// function getCookie(name) {
//     var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
//     if (arr = document.cookie.match(reg))
//         return decodeURI(arr[2]);
//     else
//         return null;x
// }
//
// // if (!getCookie("username") || !getCookie("token")) {
// //     setCookie("nowView", window.location.href);
// //     window.location.href = "login.html";
// // }