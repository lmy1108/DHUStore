<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>个人信息</title>
    <link rel="shortcut icon" href="http://www.goudden.cn/images/icons/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="css/layui.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/userInfo.css" type="text/css">
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-cookie-1.4.1.js"></script>
    <script type="text/javascript" src="js/requests.js"></script>
    <script type="text/javascript" src="layui.js"></script>
    <script src="tinymce/tinymce.min.js"></script>
    <script type="text/javascript" src="tinymce/plugins/jquery.form.js"></script>

    <link id="layuicss-layer" rel="stylesheet" href="css/layer.css" media="all">
</head>
<style>
    #uploadItempicWrapper {
        text-align: center;
    }
    #luanch{
        text-align: center;
    }
    .mce-window {
        transform: initial !important;
    }
</style>

<script>


    tinymce.init({
        selector: 'textarea',
        height: 500,
        theme: 'modern',
        plugins: 'print preview fullpage  searchreplace autolink directionality  visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount   imagetools    contextmenu colorpicker textpattern help link imageupload',
        toolbar1: 'formatselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat  | imageupload link' ,
        image_advtab: true,
        imageupload_url: '{:U("File/uploadPicture")}',

        templates: [
            { title: 'Test template 1', content: 'Test 1' },
            { title: 'Test template 2', content: 'Test 2' }
        ],
        content_css: [
            '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
            '//www.tinymce.com/css/codepen.min.css'
        ]
    });

    $(function(){
        var w=document.body.clientWidth;
        var h=document.body.clientHeight;
        $("#innerPage").css("position","absolute").css("left",0).css("top",70).css("width",w).css("height",h-120);
        $("#innerPage").css("border","none");
    });

    // window.onresize = function(){
    //     var w=document.body.clientWidth;
    //     var h=document.body.clientHeight;
    //     $("#innerPage").css("left",0).css("top",0).css("width",w).css("height",h);
    // };


    var pictureName;
    layui.use(['form', 'upload', 'layedit'], function () {
        form = layui.form;
        $form = $('form');
        var upload = layui.upload;
        //富文本编辑器
        var layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                url: '/demo2/sellerUploadPicLay'
            }
        });
        var index = layedit.build('itemDetail');
        //文件上传
        var uploadInst = upload.render({

            elem: '#uploadItemPicture',
            url: '/demo2/sellerUploadPic'//上传接口
            , field: "image"
            , size: 1024
            , before: function (obj) {
                alert("upload");

                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#itemPic').attr('src', result); //图片链接（base64）
                    pictureName=file.name;

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
        // form.verify({
        //     imageUpload: function (value, item) {
        //         if (!value) {
        //             return '未上传商品照片';
        //         }
        //     }
        // });
        form.on("submit(launch)", function (data) {
            //解析商品特点


            var imageName =  $('#itemPic').attr('src');
            detailDes = tinyMCE.activeEditor.getContent();
            var adData = {};


            data.field.seller=<%= session.getAttribute("sellerId")  %>;
            data.field.detailDes=detailDes;
            data.field.imageName=pictureName;
            alert(JSON.stringify(data.field));


            $.ajax({
                url: '/demo2/confirmAddAd/',
                type: 'post',
                data: data.field,
                // data: $.extend(data.field, {username: username, token: token, itemStatus: 2, itemPoint: itemPointVal,itemDetail:layedit.getContent(index)}),//全部表单字段，名值对形式：{name: value}
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layer.msg("发布成功");
                            setTimeout(function () {
                                window.location.href = "";
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
</script>

<body>




<jsp:include page="sellerSideBar.jsp"/>

<div class="layui-body">
    <br/><br/><br/><br/><br/><br/>

    <fieldset class="layui-elem-field layui-field-title">
        <legend>发布广告</legend>
    </fieldset>
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md4 layui-col-sm5">
                &nbsp;
            </div>
            <div class="layui-col-md3 layui-col-sm4" id="uploadItempicWrapper">
                <div class="layui-row">
                    <img id="itemPic" src="image/noPic.png">
                </div>
                <div  id="uploadAdPic" class="layui-row" >
                    <button type="button" class="layui-btn layui-bg-orange" id="uploadItemPicture">
                        <i class="layui-icon"></i>上传广告标题图片
                    </button><input class="layui-upload-file" type="file" name="image">
                    <br/><br/>
                    <%--<input class="layui-upload-file" type="file" name="image">--%>
                </div>
            </div>
            <div class="layui-col-md12 layui-col-sm9">
                <form class="layui-form" id="AdvertiseForm" action="#">
                    <%--<div class="layui-form-item">--%>
                    <%--<label class="layui-form-label"><i class="fa fa-cube fa-fw"></i>卖家编号</label>--%>
                    <%--<div class="layui-input-inline">--%>
                    <%--<input type="text" value="${sellerid}" name="seller" disabled="" required="" lay-verify="required"  class="layui-input">--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="fa fa-cube fa-fw"></i>广告标题</label>
                        <div class="layui-input-inline" style="width: 900px">
                            <input type="text" name="advertiseName" required="" lay-verify="required" placeholder="请输入广告标题" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">持续时间选择</label>
                        <div class="layui-input-block">
                            <input type="radio" name="timePersist" value="1" title="一天" checked="">
                            <input type="radio" name="timePersist" value="3" title="三天">
                            <input type="radio" name="timePersist" value="7" title="一星期">
                            <input type="radio" name="timePersist" value="30" title="一个月">

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <textarea name="content" style="width:100%"></textarea>

                    </div>




                    <input type="hidden" id="imageUrl" name="itemImage" value="" lay-verify="imageUpload">
                    <div class="layui-form-item" id="luanch">
                        <div class="layui-input-block" id="buttonWrapper">
                            <button class="layui-btn layui-btn-danger" lay-submit="" lay-filter="launch">发布</button>
                            <button class="layui-btn layui-btn-warm" lay-submit="" lay-filter="store">保存</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<![endif]-->


<ul class="layui-fixbar" style="left: 15px; bottom: 14px;">
    <li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li>
</ul>
</body>
</html>