var username, token;
$(function () {
    //读取用户头像和用户名
    username = $.cookie("username");
    token = $.cookie("token");
    if (!token)
        $("#username").html("未登录");
    else {
        $("#username").html(username);
        if ($.cookie("hasNotRead") == "true") {
            $("#userWrapper").prepend("<span class='layui-badge-dot'></span>");
            layui.use("layer", function (layer) {
                layer.msg("您有新的消息");
            });
        }

        //设置用户头像
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
    //获取当天发布商品数、登录用户数
    $.ajax({
        url: userGetTodayNumsUrl,
        success: function (data) {
            switch (data.code) {
                case 0:
                    $("#todayItem").html(data.itemAddNum);
                    $("#todayLogin").html(data.loginNum);
                    break;
                default:
                    layui.use("layer", function (layer) {
                        layer.msg("请求异常");
                    });
            }
        }
    });
    //获取最新发布商品
    $.ajax({
        url: itemGetLatestItemsUrl,
        success: function (data) {
            switch (data.code) {
                case 0:
                    var length = data.data.length;//最新发布商品数量
                    $(".latestItems").each(function (index, element) {
                        if (index < length) {
                            var itemInfo = data.data[index];
                            var date = new Date(itemInfo.addTime);
                            var dateStr = date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日";
                            var href = "pages/viewItem.html?itemId=" + itemInfo.itemId;
                            element.innerHTML = "<a href='" + href + "' target='_blank'>"
                                + "<img src='" + (itemInfo.itemImage ? itemInfo.itemImage : "images/noItem.png") + "'/>"
                                + "<p>" + itemInfo.itemName + "</p>"
                                + "<p class='info'>" + dateStr + "</p>"
                                + "</a>";
                        }
                    });
                    break;
                default:
                    layui.use("layer", function (layer) {
                        layer.msg("请求异常");
                    });
                    break;
            }
        }
    });

});

function logout() {//注销
    $.ajax({
        url: userLogoutUrl,
        data: {username: username, token: token},
        success: function (data) {
            layui.use("layer", function (layer) {
                switch (data.code) {
                    case 0:
                        layer.msg("注销成功，即将跳转到登录界面", {icon: 1, offset: '260px'});
                        $.cookie("token", '', {expires: -1, path: "/"});
                        $.cookie("headPic", '', {expires: -1, path: "/"});
                        $.cookie("hasNotRead", {expires: -1, path: "/"});
                        setTimeout(function () {
                            window.location.href = "pages/login.html";
                        }, 2500);
                        break;
                    case 2:
                        layer.msg("用户未登录，即将跳转到登录界面", {icon: 0, offset: '260px'});
                        $.cookie("token", '', {expires: -1, path: "/"});
                        $.cookie("headPic", '', {expires: -1, path: "/"});
                        setTimeout(function () {
                            window.location.href = "pages/login.html";
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

function downloadApk() {//弹出下载二维码
    layui.use("layer", function (layer) {
        layer.open({
            type: 1,
            title: false,
            content: $('#downloadApk'),
            area: '280px',
            shade: 0.6,
            shadeClose: true
        });
    });
}

function share() {//分享
    layui.use("layer", function (layer) {
        layer.open({
            type: 1,
            title: false,
            content: $('#share'),
            area: '280px',
            shade: 0.6,
            shadeClose: true
        });
    });
}

layui.use(['element', 'util'], function () {
    var element = layui.element;
    var util = layui.util;
    var firstLoad = [true, true, true];
    element.on('tab(change)', function (data) {
        switch (data.index) {
            case 1://获取最多人看商品
                if (firstLoad[data.index]) {//首次加载
                    $.ajax({
                        url: itemGetMostViewItemsUrl,
                        success: function (data) {
                            switch (data.code) {
                                case 0:
                                    var length = data.data.length;//商品数量
                                    $(".mostView").each(function (index, element) {
                                        if (index < length) {
                                            var itemInfo = data.data[index];
                                            var href = "pages/viewItem.html?itemId=" + itemInfo.itemId;
                                            element.innerHTML = "<a href='" + href + "'>"
                                                + "<img src='" + (itemInfo.itemImage ? itemInfo.itemImage : "images/noItem.png") + "'/>"
                                                + "<p>" + itemInfo.itemName + "</p>"
                                                + "<p class='info'><i class='fa fa-eye'></i> <span>" + itemInfo.viewNum + "</span></p>"
                                                + "</a>";
                                        }
                                    });
                                    break;
                                default:
                                    layui.use("layer", function (layer) {
                                        layer.msg("请求异常");
                                    });
                                    break;
                            }
                        }
                    });
                    firstLoad[data.index] = false;
                }
                break;
            case 2://获取特色商品
                if (firstLoad[data.index]) {//首次加载
                    $.ajax({
                        url: itemGetMostParticularItemsUrl,
                        success: function (data) {
                            switch (data.code) {
                                case 0:
                                    var length = data.data.length;//最新发布商品数量
                                    $(".specialItem").each(function (index, element) {
                                        if (index < length) {
                                            var itemInfo = data.data[index];
                                            var itemPoint = "" + itemInfo.itemPoint;
                                            var str = "";
                                            if (itemPoint) {
                                                if (itemPoint.indexOf("1") > -1)
                                                    str += "全新 ";
                                                if (itemPoint.indexOf("2") > -1)
                                                    str += "稀有 ";
                                                if (itemPoint.indexOf("3") > -1)
                                                    str += "跳楼价 ";
                                                if (itemPoint.indexOf("4") > -1)
                                                    str += "量大从优 ";
                                            }
                                            var href = "pages/viewItem.html?itemId=" + itemInfo.itemId;
                                            element.innerHTML = "<a href='" + href + "'>"
                                                + "<img src='" + (itemInfo.itemImage ? itemInfo.itemImage : "images/noItem.png") + "'/>"
                                                + "<p>" + itemInfo.itemName + "</p>"
                                                + "<p class='info'>" + str + "</p>"
                                                + "</a>";
                                        }
                                    });
                                    break;
                                default:
                                    layui.use("layer", function (layer) {
                                        layer.msg("请求异常");
                                    });
                                    break;
                            }
                        }
                    });
                    firstLoad[data.index] = false;
                }
                break;
        }
    });
    //固定滑块
    util.fixbar({
        bar1: "&#xe615;",
        bar2: "&#xe619;",
        css: {
            right: 4,
            bottom: 10
        },
        click: function (type) {
            if (type === 'bar1') {
                $("#itemTypeWrapper").slideDown();
                $(this).hide();
                $(this).next().show();
            } else if (type === 'bar2') {
                $("#itemTypeWrapper").slideUp();
                $(this).hide();
                $(this).prev().show();
            }
        }
    });
});
layui.use('carousel', function () {
    var carousel = layui.carousel;
    carousel.render({
        elem: '#banner',
        width: '100%',
        arrow: 'hover'
    });
});