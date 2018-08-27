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
    <form id="updateUser" class="layui-form" >

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户编号</label>
                <div class="layui-input-inline">
                    <input value = ${userid} type="text" name="userid" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="username" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户密码</label>
            <div class="layui-input-inline">
                <input type="text" name="password" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
        <label class="layui-form-label">电子邮件</label>
        <div class="layui-input-inline">
            <input type="text" name="email" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">电话号码</label>
            <div class="layui-input-inline">
                <input type="text" name="telephone" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
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
                url: 'updateUser' ,
                type: 'post',
                data: $('#updateUser').serialize(),
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