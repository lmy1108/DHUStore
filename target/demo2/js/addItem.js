var username = $.cookie("username");
var token = $.cookie("token");
//商品类别级联选择
var defaults = {
    s1: 'itemBigType',
    s2: 'itemSmallType',
    v1: null,
    v2: null
};
var $form;
var form;

layui.use(['form', 'upload', 'layedit'], function () {
    alert("upload");
    form = layui.form;
    $form = $('form');
    var upload = layui.upload;
    //富文本编辑器
    var layedit = layui.layedit;
    layedit.set({
        uploadImage: {
            url: '/demo2/userUploadPicLay'
        }
    });
    var index = layedit.build('itemDetail');
    //文件上传
    var uploadInst = upload.render({
        elem: '#uploadItemPic',
        url: '/demo2/userUploadHeadPic'//上传接口
        , field: "image"
        , size: 1024
        , before: function (obj) {
            alert("upload");

            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#itemPic').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            if (res.code > 0) {
                return layer.msg('图片上传失败');
            }
            layer.msg("图片上传成功");
            $("#imageUrl").val(res.imageUrl);

        }, error: function () {
            layer.msg("图片上传失败");//请求异常回调
        }
    });
    form.verify({
        imageUpload: function (value, item) {
            if (!value) {
                layer.msg("图片上传失败");
                return '未上传商品照片';
            }
        }
    });
    form.on("submit(launch)", function (data) {
        //解析商品特点
        var itemPointVal = "";
        var $itemPoints = $("#itemPointCheckbox :checkbox:checked");
        for (var i = 0; i < $itemPoints.length; i++) {
            if ($itemPoints[i])
                itemPointVal += $itemPoints.eq(i).val();
        }
        if (!data.field.supportBargain) {
            data.field.supportBargain = 'off';
        }
        $.ajax({
            url: itemAddOrUpdateItemUrl,
            type: 'post',
            data: $.extend(data.field, {username: username, token: token, itemStatus: 2, itemPoint: itemPointVal,itemDetail:layedit.getContent(index)}),//全部表单字段，名值对形式：{name: value}
            success: function (data) {
                switch (data.code) {
                    case 0:
                        layer.msg("发布成功");
                        setTimeout(function () {
                            window.location.href = "itemManage.html";
                        }, 2000);
                        break;
                    default:
                        layer.msg("发布失败");
                        break;
                }

            }
        });
        return false;
    });
    form.on("submit(store)", function (data) {
        var itemPointVal = "";//解析商品特点
        var $itemPoints = $("#itemPointCheckbox :checkbox:checked");
        for (var i = 0; i < $itemPoints.length; i++) {
            if ($itemPoints[i])
                itemPointVal += $itemPoints.eq(i).val();
        }
        if (!data.field.supportBargain) {
            data.field.supportBargain = 'off';
        }
        $.ajax({
            url: itemAddOrUpdateItemUrl,
            type: 'post',
            data: $.extend(data.field, {username: username, token: token, itemStatus: 1, itemPoint: itemPointVal,itemDetail:layedit.getContent(index)}),//全部表单字段，名值对形式：{name: value}
            success: function (data) {
                switch (data.code) {
                    case 0:
                        layer.msg("保存成功");
                        setTimeout(function () {
                            window.location.href = "itemManage.html";
                        }, 2000);
                        break;
                    default:
                        layer.msg("保存失败");
                        break;
                }
            }
        });
        return false;
    })
});



//top栏
layui.use('util', function () {
    var util = layui.util;
    util.fixbar({
        bar1: false,
        css: {
            left: 15,
            bottom: 14
        },
        showHeight: 560
    });
});