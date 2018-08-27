<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <link rel="stylesheet" href="../css/layui.css" media="all">
    <script src="../layui.js" charset="utf-8"></script>
    <script src="../js/jquery-1.11.2.min.js"></script>

    <script src="../javascript/adminProduct.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/adminProduct.js"></script>


</head>
<body>
<br/>
<br/>
    <form id="updateProduct" class="layui-form" action="">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">${productid}商品编号</label>
                <div class="layui-input-inline">
                    <input value="${productid}" type="text" name="number" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="number" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-inline">
                <input type="text" name="number" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
        <label class="layui-form-label">商品分类</label>
        <div class="layui-input-inline">
            <input type="text" name="number" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">商品折扣</label>
            <div class="layui-input-inline">
                <input type="text" name="number" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">商品描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>




    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</body>
<script>
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

        //……

        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        form.render();
    });
    // var parentId=parent.$("#id").val();
    $(document).ready(function(){
        alert(JSON.stringify(parent.selectProduct['productid']));
        id = parent.selectProduct['productid'];
        $.ajax({
            url: '${pageContext.request.contextPath}/selectProduct' ,
            type: 'post',
            data: {'productid':id},
            datatype:'json',
            success: function (returndata) {
            },
            error: function (returndata) {
            }
        });

        swal()
    })
</script>