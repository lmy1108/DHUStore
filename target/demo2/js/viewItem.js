var username, token;

function getQueryString(name) {//获取url参数
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return decodeURI(r[2]);
    return null;
}

$(function () {
    //读取用户头像和用户名
    username = $.cookie("username");
    token = $.cookie("token");
    if (!token);
        // $("#username").html("未登录");
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
    //获取主人信息
    var $userLevel = $("#level span.info");
    var $userCredit = $("#credit span.info");
    var $levelProgress = $("#levelBar>div");
    var $creditProgress = $("#creditBar>div");
    //获取商品信息
    var itemId = getQueryString("itemId");
    var ownerName;
    $.ajax({
        url: getItemUrl,
        type: 'post',
        data: {itemId: itemId, token: token, username: username},
        success: function (data) {
            switch (data.code) {
                case 0:
                    //进度条
                    $levelProgress.attr("lay-percent", data.experience + '/' + 100);
                    $creditProgress.attr("lay-percent", data.credit + '/' + 100);
                    //等级、信用、评星
                    $userLevel.html(data.level);
                    $userCredit.html(data.creditLevel);
                    layui.use('element', function () {
                        var element = layui.element;
                    });
                    //商品信息
                    var itemInfo = data.data;
                    if (itemInfo.itemImage)
                        $("#itemPic").attr("src", itemInfo.itemImage);
                    $("#viewNum").html(itemInfo.viewNum);
                    $.ajax({//获取该商品收藏数量
                        url: itemGetCollectedNum,
                        type: 'post',
                        data: {itemId: itemId},
                        success: function (data) {
                            switch (data.code) {
                                case 0:
                                    $("#favouriteNum").html(data.totalNum);
                                    break;
                                default:
                                    break;
                            }
                        }
                    });

                    $("#itemName").html(itemInfo.itemName);
                    $("#itemBigType").html(types[itemInfo.itemBigType]);
                    $("#itemSmallType").html(types[itemInfo.itemSmallType]);
                    ownerName = itemInfo.username;
                    $("#ownerName").html("<a href='viewUser.html?username=" + ownerName + "'>" + itemInfo.username + "</a>");
                    $("#itemLeftNum").html(itemInfo.itemLeftNum);
                    $("#itemSoldNum").html(itemInfo.itemSoldNum);
                    $("#itemPrice").html(itemInfo.itemPrice);
                    $("#supportBargin").html(itemInfo.supportBargain);
                    var date = new Date(itemInfo.addTime);
                    var dateStr = date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日";
                    $("#addTime").html(dateStr);
                    var itemPoint = "" + itemInfo.itemPoint;
                    if (itemPoint) {
                        var str = "";
                        var $itemPoint = $("#itemPoint");
                        if (itemPoint.indexOf("1") > -1)
                            str += "全新 ";
                        if (itemPoint.indexOf("2") > -1)
                            str += "稀有 ";
                        if (itemPoint.indexOf("3") > -1)
                            str += "跳楼价 ";
                        if (itemPoint.indexOf("4") > -1)
                            str += "量大从优 ";
                        $itemPoint.html(str);
                    }
                    var itemRange;
                    switch (itemInfo.itemRange) {
                        case "1":
                            itemRange = "同校";
                            break;
                        case "2":
                            itemRange = "同区";
                            break;
                        case "3":
                            itemRange = "同城";
                            break;
                        case "4":
                            itemRange = "不限";
                            break;
                    }
                    $("#itemRange").html(itemRange);
                    $("#itemDetail").html(itemInfo.itemDetail);
                    break;
                default:
                    layui.use("layer", function (layer) {
                        layer.msg("请求异常");
                    });
            }
        }
    });
    $("#buy").click(function () {//购买
        layer.prompt({
            title: '填写备注'
            , formType: 2
            , shade: 0
        }, function (text, index) {
            $.ajax({
                url: orderAddOrderUrl,
                data: {username: username, token: token, itemId: itemId, buyerWord: text},
                type: 'post',
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layui.use("layer", function (layer) {
                                layer.msg("购买成功");
                            });
                            break;
                        default:
                            layui.use("layer", function (layer) {
                                layer.msg("买自己的货？不存在的");
                            });
                            break;
                    }
                }
            });
            layer.close(index);
        });
    });
    $("#addFavour").click(function () {
        $.ajax({
            url: collectionCollectItemUrl,
            data: {itemId: itemId, username: username, token: token},
            type: 'post',
            success: function (data) {
                switch (data.code) {
                    case 0:
                        layui.use("layer", function (layer) {
                            layer.msg("收藏成功");
                        });
                        break;
                    default:
                        layui.use("layer", function (layer) {
                            layer.msg("请求异常");
                        });
                }
            }
        });
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
                            window.location.href = "login.html";
                        }, 2500);
                        break;
                    case 2:
                        layer.msg("用户未登录，即将跳转到登录界面", {icon: 0, offset: '260px'});
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

layui.use(['util', 'layer'], function () {
    var util = layui.util;
    var layer = layui.layer;
    //固定滑块
    util.fixbar({
        css: {
            right: 15,
            bottom: 10
        }
    });
});