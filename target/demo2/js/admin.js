var username, token;
$(function () {
    //读取用户头像和用户名
    username = $.cookie("username");
    token = $.cookie("token");
    if (!token);
    else {
        $("#username").html(username);
        if ($.cookie("hasNotRead") == "true") {
            $("#userWrapper").prepend("<span class='layui-badge-dot'></span>");
            layui.use("layer", function (layer) {
                layer.msg("您有新的消息");
            });
        }
        if ($.cookie("headPic"))
            $("#headPic").attr("src", $.cookie("headPic"));
        else {
            $.ajax({
                url: userGetUserInfoUrl,
                data: {username: username, token: token},
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            if (data.userInfo.headPic) {
                                $("#headPic").attr("src", data.userInfo.headPic);
                                $.cookie("headPic", data.userInfo.headPic, {path: '/'});
                            }
                            break;
                        default:
                            layui.use("layer", function (layer) {
                                layer.msg("请求异常");
                            });
                            break;
                    }
                }
            });
        }
    }
});

function logout() {//注销
    $.ajax({
        url: userLogoutUrl,
        data: {username: username, token: token},
        success: function (data) {
            layui.use("layer", function (layer) {
                switch (data.code) {
                    case 0:
                        layer.msg("注销成功，即将跳转到登录界面", {icon: 1, offset: '260px', area: '280px'});
                        $.cookie("token", '', {expires: -1, path: "/"});
                        $.cookie("headPic", '', {expires: -1, path: "/"});
                        $.cookie("hasNotRead", {expires: -1, path: "/"});
                        setTimeout(function () {
                            window.location.href = "login.html";
                        }, 2500);
                        break;
                    case 2:
                        layer.msg("用户未登录，即将跳转到登录界面", {icon: 0, offset: '260px', area: '290px'});
                        $.cookie("token", '', {expires: -1, path: "/"});
                        $.cookie("headPic", '', {expires: -1, path: "/"});
                        setTimeout(function () {
                            window.location.href = "login.html";
                        }, 2500);
                        break;
                    default:
                        layer.msg("未知错误", {icon: 2, offset: '260px', area: '90px'});
                        break;
                }
            });
        }
    });
}

layui.use(['element', 'jquery'], function () {
    var element = layui.element;
    var $ = layui.$
    $("#showSide").click(function () {
        if ($(this).hasClass("layui-icon-spread-left")) {
            openSideNav();
        } else {
            closeSideNav();
        }
    });

    function openSideNav() {
        $("#showSide").removeClass("layui-icon-spread-left").addClass("layui-icon-shrink-right");
        // $("#sideNav").removeClass("hide-side");
        $(".layui-body,.layui-footer").removeClass("full-screen");
        $(".mask").addClass("close");
        $(".close").click(closeSideNav);
    }

    function closeSideNav() {
        $("#showSide").addClass("layui-icon-spread-left").removeClass("layui-icon-shrink-right");
        // $("#sideNav").addClass("hide-side");
        $(".layui-body,.layui-footer").addClass("full-screen");
        $(".close").unbind("click", closeSideNav);
        $(".mask").removeClass("close");
    }
});