var username, token;
var form;//信息表单
var picturename;


layui.use(['form', 'layer'], function () {
    form = layui.form;
    var layer = layui.layer;
    form.on("submit(editSubmit)", function (data) {
        data.field.imageName = picturename;
        alert(JSON.stringify(data.field));
            $.ajax({
            url: '/demo2/userConfirmEditInfo',
            type: 'post',
            data: data.field,//全部表单字段
            success: function (data) {
                switch (data.code) {
                    case 0:
                        layer.msg("修改成功", {icon: 1});
                        break;
                    default:
                        layui.use("layer", function (layer) {
                            layer.msg("请求异常");
                        });
                        break;
                }
            }
        });
        return false;
    })
});
//日期选择
layui.use('laydate', function () {
    var laydate = layui.laydate;
    laydate.render({
        elem: '#userBirthday'
    });
});
layui.use('upload', function () {
    var upload = layui.upload;
    var uploadInst = upload.render({
        elem: '#uploadHeadpic',
        url: '/demo2/userUploadHeadPic' //上传接口
        , type: 'post'
        , size: 1024
        , field: "image"
        , data: {username: username}
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#headPic').attr('src', result); //图片链接（base64）
                $("#imageStore").html(result);
                picturename=file.name;

            });
        }, done: function (res) {
            alert(res.code);
            if (res.code > 0) {
                return layer.msg('上传失败');
            }
            layer.msg("上传成功");
            var src = $("#imageStore").html();
            $.cookie("headPic", '', {expires: -1, path: "/"});
            $('#headPic', parent.document).attr("src", src);
            $.cookie("headPic", src, {path: "/"});
        }, error: function () {
            layer.msg("请求异常");//请求异常回调
        }
    });
});
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