var username, token;
$(function () {
    //验证信息
    username = $.cookie("username");
    token = $.cookie("token");
    //获取已填写的用户信息
    var $userLevel = $("#level span.info");
    var $userCredit = $("#credit span.info");
    var $userLevelStar = $("#userLevelStar span.info");
    var $levelProgress = $("#levelBar>div");
    var $creditProgress = $("#creditBar>div");
    var $userLevelStarProgress = $("#userLevelStarBar>div");
    var $username = $("#username");
    var $userRealName = $("#userRealName");
    var $userEmail = $("#userEmail");
    var $userTel = $("#userTel");
    var $userSchool = $("#userSchool");
    var $userAddress = $("#userAddress");
    var $userSex = $("#userSex");
    var $userBirthday = $("#userBirthday");
    var $userQq = $("#userQq");
    var $userWechat = $("#userWechat");
    var $userSignature = $("#userSignature");
    var $userAlipay = $("#userAlipay");
    var $userCredate = $("#userCredate");
    var $buyNum = $("#buyNum");
    var $buyMoney = $("#buyMoney");
    var $sellNum = $("#sellNum");
    var $sellMoney = $("#sellMoney");
    var $headPic = $("#headPic");
    var $userHighOpinion = $("#userHighOpinion");//好评
    var $userLowOpinion = $("#userLowOpinion");//差评
    $.ajax({//请求用户信息
        url: userGetUserInfoUrl,
        data: {username: username, token: token},
        success: function (data) {
            switch (data.code) {
                case 0:
                    //显示已填写用户信息
                    var userInfo = data.userInfo;
                    if ($.cookie("headPic")) {
                        $headPic.attr("src", $.cookie("headPic"));
                    } else {
                        if (userInfo.headPic)
                            $headPic.attr("src", userInfo.headPic);
                    }
                    $username.html(userInfo.username);
                    $userSignature.html(userInfo.userSignature);
                    $userRealName.html(userInfo.userRealName);
                    $userSex.html(userInfo.userSex == 'f' ? "女" : "男");
                    $userBirthday.html(userInfo.userBirthday);
                    var userSchools = ["东华大学", "上海外国语大学", "上海对外经贸大学", "上海工程技术大学",
                        "上海复旦视觉艺术学院", "上海立信会计金融学院", "华东政法大学"];
                    $userSchool.html(userSchools[userInfo.userSchool]);
                    $userAddress.html(userInfo.userAddress);
                    $userTel.html(userInfo.userTel);
                    $userEmail.html(userInfo.userEmail);
                    $userQq.html(userInfo.userQq);
                    $userWechat.html(userInfo.userWechat);
                    $userAlipay.html(userInfo.userAlipay);
                    var creDate = new Date(userInfo.userCredate);
                    $userCredate.html(creDate.getFullYear() + "-" + (creDate.getMonth() + 1) + "-" + creDate.getDate());
                    //进度条
                    $levelProgress.attr("lay-percent", userInfo.userExperience + '/' + 100);
                    $creditProgress.attr("lay-percent", userInfo.userCredit + '/' + 100);
                    $userLevelStarProgress.attr("lay-percent", userInfo.userHighOpinion * 100 / (userInfo.userHighOpinion + userInfo.userLowOpinion) + '%');
                    //等级、信用、评星
                    $userLevel.html(userInfo.userLevel);
                    $userCredit.html(userInfo.userCreditLevel);
                    var userLevelStars = ["未鉴定", "一星级用户", "二星级用户", "三星级用户", "四星级用户", "五星级用户"];
                    var userLevelStar;
                    var high = userInfo.userHighOpinion;
                    var low = userInfo.userLowOpinion;
                    var rate;
                    if (low + high == 0) {
                        userLevelStar = 0;
                    } else {
                        rate = high / (low + high);
                        if (rate >= 0.9 && high >= 100) {
                            userLevelStar = 5;
                        } else if (rate >= 0.8 && high >= 50) {
                            userLevelStar = 4;
                        } else if (rate >= 0.6 && high >= 30) {
                            userLevelStar = 3;
                        } else if (rate >= 0.4 && high >= 15) {
                            userLevelStar = 2;
                        } else if (rate >= 0.2 && high >= 5) {
                            userLevelStar = 1;
                        } else {
                            userLevelStar = 0;
                        }
                    }
                    $userLevelStar.html(userLevelStars[userLevelStar]);
                    //好评&差评
                    $userHighOpinion.html(high);
                    $userLowOpinion.html(low);
                    layui.use('element', function () {
                        var element = layui.element;
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
    $.ajax({//获取购买、售出数据
        url: userGetInformationUrl,
        type: 'post',
        data: {token: token, username: username},
        success: function (data) {
            var info = data.data;
            $buyNum.html(info.buy);
            $buyMoney.html(info.buyMoney);
            $sellNum.html(info.sell);
            $sellMoney.html(info.sellMoney);
        }
    });
});

layui.use(['util', 'layer'], function () {
    var util = layui.util;
    var layer = layui.layer;
    //固定滑块
    util.fixbar({
        bar1: "&#xe642;",
        bar2: true,
        css: {
            right: 15,
            bottom: 10
        },
        click: function (type) {
            if (type === 'bar1') {
                window.location.href = "setUserInfo.html";
            } else if (type === 'bar2') {
                //弹出层
                layer.open({
                    type: 2,
                    title: '等级 / 信用规则',
                    area: ['auto', '400px'],
                    content: '../pages/helps/levelHelp.html',
                    shade: 0.8
                });
            }
        }
    });
});