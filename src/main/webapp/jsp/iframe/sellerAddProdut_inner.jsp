
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>个人信息</title>
    <link rel="shortcut icon" href="http://www.goudden.cn/images/icons/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addItem.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-cookie-1.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/requests.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui.js"></script>
    <link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath}/css/layer.css" media="all"></head>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/addItem.js"></script>--%>

<div class="layui-body">

    <fieldset class="layui-elem-field layui-field-title">
        <legend>发布商品</legend>
    </fieldset>
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md4 layui-col-sm5" id="uploadItempicWrapper">
                <div class="layui-row">
                    <img id="itemPic" src="image/noPic.png">
                </div>
                <div class="layui-row">
                    <button type="button" class="layui-btn layui-bg-orange" id="uploadItemPicture">
                        <i class="layui-icon"></i>上传商品照片
                    </button><input class="layui-upload-file" type="file" name="image">
                    <%--<input class="layui-upload-file" type="file" name="image">--%>
                </div>
            </div>
            <div class="layui-col-md8 layui-col-sm7">
                <form class="layui-form" id="productForm" action="#">
                    <%--<div class="layui-form-item">--%>
                        <%--<label class="layui-form-label"><i class="fa fa-cube fa-fw"></i>卖家编号</label>--%>
                        <%--<div class="layui-input-inline">--%>
                            <%--<input type="text" value="${sellerid}" name="seller" disabled="" required="" lay-verify="required"  class="layui-input">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="fa fa-cube fa-fw"></i>商品名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="productname" required="" lay-verify="required" placeholder="请输入商品名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="fa fa-folder-open-o fa-fw"></i>商品类别</label>
                        <div class="layui-input-inline" id="itemBigTypeWrapper">
                            <select name="cate" id="itemBigType" required="" lay-verify="required" lay-filter="itemBigType">
                                <option value="">请选择商品类别</option>
                                <option value="1">图书</option><option value="2">电子产品</option><option value="3">生活用品</option><option value="4">化妆品</option><option value="5">零食小吃</option><option value="6">服装</option>
                            </select>
                        </div>

                    </div>
                    <div class="layui-form-item">

                        <label class="layui-form-label"><i class="fa fa-rmb fa-fw"></i>价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="price" required="" lay-verify="required|number" placeholder="请输入商品价格（元）" autocomplete="off" class="layui-input">
                        </div>
                        <label class="layui-form-label"><i class="fa fa-rmb fa-fw"></i>数量</label>
                        <div class="layui-input-inline">
                            <input type="text" name="num" required="" lay-verify="required|number" placeholder="请输入商品数量（个）" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">优惠选择</label>
                        <div class="layui-input-block">
                            <input type="radio" name="discountid" value="0" title="无优惠" checked="">
                            <input type="radio" name="discountid" value="1" title="打折(10%)">
                            <input type="radio" name="discountid" value="2" title="甩卖(20%)">
                            <input type="radio" name="discountid" value="3" title="跳楼价(30%)">

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="fa fa-comments-o fa-fw"></i>支持议价</label>
                        <div class="layui-input-inline">
                            <input type="checkbox" name="supportBargain" lay-skin="switch" lay-text="ON|OFF" checked=""><div class="layui-unselect layui-form-switch layui-form-onswitch" lay-skin="_switch"><em>ON</em><i></i></div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <textarea  id="itemDetail" placeholder="(*╹▽╹*) 请在此填写商品详细信息并添加更多商品图片！" style="display: none;" class="layui-hide"></textarea><div class="layui-layedit"><div class="layui-unselect layui-layedit-tool"><i class="layui-icon layedit-tool-b" title="加粗" lay-command="Bold" layedit-event="b" "=""></i><i class="layui-icon layedit-tool-i" title="斜体" lay-command="italic" layedit-event="i" "=""></i><i class="layui-icon layedit-tool-u" title="下划线" lay-command="underline" layedit-event="u" "=""></i><i class="layui-icon layedit-tool-d" title="删除线" lay-command="strikeThrough" layedit-event="d" "=""></i><span class="layedit-tool-mid"></span><i class="layui-icon layedit-tool-left" title="左对齐" lay-command="justifyLeft" layedit-event="left" "=""></i><i class="layui-icon layedit-tool-center" title="居中对齐" lay-command="justifyCenter" layedit-event="center" "=""></i><i class="layui-icon layedit-tool-right" title="右对齐" lay-command="justifyRight" layedit-event="right" "=""></i><span class="layedit-tool-mid"></span><i class="layui-icon layedit-tool-link" title="插入链接" layedit-event="link" "=""></i><i class="layui-icon layedit-tool-unlink layui-disabled" title="清除链接" lay-command="unlink" layedit-event="unlink" "=""></i><i class="layui-icon layedit-tool-face" title="表情" layedit-event="face" "=""></i><i class="layui-icon layedit-tool-image" title="图片" layedit-event="image"><input type="file" name="file"></i></div><div class="layui-layedit-iframe"><iframe id="LAY_layedit_1" name="LAY_layedit_1" textarea="itemDetail" frameborder="0" style="height: 280px;" src="./saved_resource.html"></iframe></div></div>
                    </div>
                    <input type="hidden" id="imageUrl" name="itemImage" value="" lay-verify="imageUpload">
                    <div class="layui-form-item">
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
<script>

var pictureName;
    layui.use(['form', 'upload', 'layedit'], function () {
        alert("upload");
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
            detailDes = layedit.getContent(index);
            var productData = {};
            productData.product=data.field;
            productData.seller= <%= session.getAttribute("sellerId")  %>;
            productData.detailDes = detailDes;
            productData.imageName=pictureName;

            data.field.seller=<%= session.getAttribute("sellerId")  %>;
            data.field.detailDes=detailDes;
            data.field.imageName=pictureName;
            alert(JSON.stringify(data.field));


            $.ajax({
                url: '/demo2/confirmAddProduct/',
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
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>


<![endif]-->
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/addItem.js"></script>--%>

</html>
