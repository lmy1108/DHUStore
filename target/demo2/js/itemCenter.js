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
                        $.cookie("token", '', {expires: -1, path: "/"});
                        $.cookie("headPic", '', {expires: -1, path: "/"});
                        layer.msg("用户未登录，即将跳转到登录界面", {icon: 0, offset: '260px'});
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


function getQueryString(name) {//获取url参数
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return decodeURI(r[2]);
    return null;
}

layui.use(['element', 'util', 'form', 'laypage'], function () {
    var element = layui.element;
    var laypage = layui.laypage;
    var util = layui.util;
    var form = layui.form;
    //获取url参数，搜索条件
    var itemName = getQueryString("itemName");
    var priceMin = getQueryString("priceMin");
    var priceMax = getQueryString("priceMax");
    var itemBigType = getQueryString("itemBigType");
    var itemSmallType = getQueryString("itemSmallType");
    var extraData = {};//搜索条件
    if (itemName) {
        extraData.itemName = itemName;
        $("#itemNameInput").val(itemName);
    }
    if (priceMin) {
        extraData.priceMin = priceMin;
        $("#priceMinInput").val(priceMin);
    }
    if (priceMax) {
        extraData.priceMax = priceMax;
        $("#priceMaxInput").val(priceMax);
    }
    if (itemBigType)
        extraData.itemBigType = itemBigType;
    if (itemSmallType)
        extraData.itemSmallType = itemSmallType;
    //默认分页渲染
    var count = 0;
    $.ajax({//获取商品总数
        url: itemGetItemsNumUrl,
        data: extraData,
        type: 'post',
        success: function (data) {
            switch (data.code) {
                case 0:
                    count = data.totalNum;
                    laypage.render({
                        elem: 'changePage0' //注意，这里的 test1 是 ID，不用加 # 号
                        , count: count //数据总数，从服务端得到
                        , limit: 8
                        , layout: ['count', 'prev', 'page', 'next', 'skip']
                        , jump: function (obj) {
                            $.ajax({
                                url: itemGetItemsByPagerUrl,//分页获取商品
                                type: 'post',
                                data: $.extend({page: obj.curr, flag: 0}, extraData),
                                success: function (data) {
                                    switch (data.code) {
                                        case 0:
                                            getItems(data.data, 0);
                                            break;
                                        case 4:
                                            $("#items0").empty().html("<p style='font-size: 20px;'>暂无商品</p>");
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
                    });
                    break;
                default:
                    layui.use("layer", function (layer) {
                        layer.msg("请求异常");
                    });
            }
        }
    });
    var firstLoad = [false, true, true, true];//是否首次加载
    //监听商品排序方式切换
    element.on('tab(sortItem)', function (data) {
        var index = data.index;
        if (firstLoad[index]) {
            $("#changePage").empty();
            //分页渲染
            laypage.render({
                elem: 'changePage' + index //注意，这里的 test1 是 ID，不用加 # 号
                , count: count //数据总数，从服务端得到
                , limit: 8
                , layout: ['count', 'prev', 'page', 'next', 'skip']
                , jump: function (obj) {
                    $.ajax({
                        url: itemGetItemsByPagerUrl,//分页获取商品
                        type: 'post',
                        data: $.extend({page: obj.curr, flag: index}, extraData),
                        success: function (data) {
                            switch (data.code) {
                                case 0:
                                    getItems(data.data, index);
                                    break;
                                case 4:
                                    $("#items" + index).empty().html("<p style='font-size: 20px;'>暂无商品</p>");
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
            });
            firstLoad[data.index] = false;
        }
    });
    //条件搜索商品
    form.on("submit(searchItem)", function () {
        var itemBigType = getQueryString("itemBigType");
        var itemSmallType = getQueryString("itemSmallType");
        if (itemSmallType) {
            $("#itemType").attr("name", 'itemSmallType');
            $("#itemType").val(itemSmallType);
            return true;
        }
        if (itemBigType) {
            $("#itemType").attr("name", 'itemBigType');
            $("#itemType").val(itemBigType);
        }
    });
    form.on("submit(reset)", function () {
        window.location.href = "itemCenter.html";
        return false;
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

//加载商品
function getItems(data, index) {
    $("#items" + index + " .itemPadding").empty();
    var length = data.length;
    for (var i = 0; i < length; i++) {
        var itemPointStr = "";
        if (data[i].itemPoint) {
            var itemPoint = data[i].itemPoint + "";
            itemPointStr += "<p>";
            itemPointStr += (itemPoint.indexOf("1") > -1 ? "<span class='layui-badge layui-bg-green'>全新</span>\n" : "");
            itemPointStr += (itemPoint.indexOf("2") > -1 ? "<span class='layui-badge layui-bg-green'>稀有</span>\n" : "");
            itemPointStr += (itemPoint.indexOf("3") > -1 ? "<span class='layui-badge layui-bg-green'>跳楼价</span>\n" : "");
            itemPointStr += (itemPoint.indexOf("4") > -1 ? "<span class='layui-badge layui-bg-green'>量大从优</span>\n" : "");
            itemPointStr += "</p>";
        } else {
            itemPointStr = "<p><span class='layui-badge layui-bg-gray'>普通商品</span></p>";
        }
        var date = new Date(data[i].addTime);
        var dateStr = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
        var str = //"<div class='layui-col-lg3 layui-col-md4 layui-col-xs6 itemPadding'>" +
            "<div class='item'>" +
            "<a href='" + "viewItem.html?itemId=" + data[i].itemId + "' target='_blank'>" +
            "<img src='" + (data[i].itemImage ? data[i].itemImage : "../images/noItem.png") + "'/>" +
            "<div class='itemDetail'>"
            + "<p>" +
            "<span class='itemPriceWrapper'>" + "<span>￥</span><span class='itemPrice'>" + data[i].itemPrice + "</span>\n" + "</span>\n"
            + (data[i].supportBargin == "on" ? "<span class='layui-badge'>议价</span>\n" : "")
            + "<span class='viewNumWrapper'>\n" + "<i class='fa fa-eye'></i> <span class='viewNum'>" + data[i].viewNum + "</span>\n" + "</span>\n"
            + "</p>"
            + "<p class='itemName'>" + data[i].itemName + "</p>\n"
            + "<p>\n" +
            "<span class='ownerWrapper'>\n" +
            "<i class='fa fa-user'></i> <span class='owner'>" + data[i].username + "</span>\n" +
            "</span>\n" +
            "<span class='college'>" + dateStr + "</span>\n"
            + "</p>\n"
            + itemPointStr
            + "</div>"
            + "</a>" + "</div>";// + "</div>";
        $("#items" + index + " .itemPadding").eq(i).append(str);
    }

}