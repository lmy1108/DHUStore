<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>

    <script src="${pageContext.request.contextPath}/javascript/adminProduct.js"></script>


</head>
<body>
<br/>
<br/>
    <form id="updateProduct" class="layui-form" >

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">商品编号</label>
                <div class="layui-input-inline">
                    <input value = ${productid} type="text" name="productid" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="productname" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-inline">
                <input type="text" name="price" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
        <label class="layui-form-label">商品分类</label>
        <div class="layui-input-inline">
            <input type="text" name="num" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">商品折扣</label>
            <div class="layui-input-inline">
                <input type="text" name="discountid" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">商品描述</label>
            <div class="layui-input-block">
                <textarea name = "description"  placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit='' lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</body>
<script>
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

        //……

        form.render();

        form.on('submit(demo1)',function(data){
            $.ajax({
                url: 'updateProduct' ,
                type: 'post',
                data: $('#updateProduct').serialize(),
                datatype:'json',
                success: function (returndata) {

                    layer.alert(returndata);
                    layer.closeAll();
                },
                error: function (returndata) {
                    layer.alert(returndata);
                }
            });
        });
    });

    // var parentId=parent.$("#id").val();

</script>