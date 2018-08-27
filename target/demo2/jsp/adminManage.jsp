
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台管理-东华商城</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="css/layui.css"  media="all">
    <link rel="stylesheet" href="css/bootstrap/css/bootstrap.css"  media="all">

    <script src="${pageContext.request.contextPath}/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>

    <script src="${pageContext.request.contextPath}/javascript/adminProduct.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

</head>
<style>
    .layui-table{
        align-content: center;
    }
</style>
<body class="layui-layout-body">
<jsp:include page="adminSidebar.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="margin-bottom: 5px;">


            <!-- 示例-970 -->
            <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>

        </div>
        <div style="text-align: center;">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>商品管理</legend>
            </fieldset>
            <div class="layui-container">
                <div class="layui-row" id="searchWrapper">
                    <div class="demoTable">
                        <div class="layui-inline">
                            <label class="layui-label">商品ID</label>
                            <div class="layui-input-inline">
                                <input type="text" name="itemId" placeholder="请输入商品ID" autocomplete="off"
                                       class="layui-input" >
                            </div>
                            <label class="layui-label">商品名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="itemName" placeholder="请输入商品名" autocomplete="off"
                                       class="layui-input">
                            </div>

                        </div>
                        <br/>
                        <br/>

                        <div class="layui-inline">
                            <label class="layui-label">商品类别</label>
                            <div class="layui-input-inline">
                                <input type="text" name="itemCate" placeholder="请输入商品类别号" autocomplete="off"
                                       class="layui-input" >
                            </div>
                            <label class="layui-label">搜索商品描述</label>
                            <div class="layui-input-inline">
                                <input type="text" name="itemDes" placeholder="请输入商品描述" autocomplete="off"
                                       class="layui-input" >
                            </div>

                        </div>
                        <br/>
                        <br/>

                        <div class="layui-inline">
                            <label class="layui-label">价格</label>
                            <div class="layui-input-inline" style="width: 70px;">
                                <input type="text" name="priceMin" placeholder="￥" autocomplete="off"
                                       class="layui-input">
                            </div>
                            -
                            <div class="layui-input-inline" style="width: 70px;">
                                <input type="text" name="priceMax" placeholder="￥" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <input type="hidden" name="" value="" id="itemType"><!--存放商品类别代号-->
                        <div class="layui-inline">
                            <button class="layui-btn layui-btn-normal" data-type="reload" >
                                <i class="layui-icon">&#xe615;</i> 搜索
                            </button>

                        </div>
                    </div>
                </div>

                <div class="layui-row">
                    <div class="layui-col-md1">
                        &nbsp;

                    </div>
                    <div class="layui-col-md9">


                        <table class="layui-table" lay-data="{width: 1000, height:800, url:'/demo2/productjson', id:'testReload'}" lay-filter="demo">
                            <thead>
                            <tr>
                                <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
                                <th lay-data="{field:'productid', width:80, sort: true, fixed: true}">商品ID</th>
                                <th lay-data="{field:'productname', width:80}">商品名</th>
                                <th lay-data="{field:'price', width:80, sort: true}">价格</th>
                                <th lay-data="{field:'num', width:80}">数量</th>
                                <th lay-data="{field:'uptime', width:160}">时间</th>
                                <th lay-data="{field:'cate', width:80, sort: true}">类别</th>
                                <th lay-data="{field:'detailcate', width:80}">详细类别</th>
                                <th lay-data="{field:'description', width:150}">详细描述</th>
                                <th lay-data="{field:'discountid', width:80, sort: true, fixed: 'right'}">折扣号</th>
                                <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
                </div>
            </div>
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>

        <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
        <script>
            layui.use('table', function(){
                var table = layui.table;
                //监听表格复选框选择
                table.on('checkbox(demo)', function(obj){
                    console.log(obj)
                });
                //监听工具条
                table.on('tool(demo)', function(obj){
                    var data = obj.data;
                    if(obj.event === 'detail'){
                        window.location.href="/demo2/detail?productid="+data.productid;
                        // layer.msg('ID：'+ data.id + ' 的查看操作');
                    } else if(obj.event === 'del'){
                        layer.confirm('真的删除行么', function(index){
                            obj.del();

                            deleteProduct(data['productid']);
                            layer.close(index);
                        });
                    } else if(obj.event === 'edit'){
                        // updateProduct(data);
                        selectProduct(data);
                        // layer.alert('编辑行：<br>'+ JSON.stringify(data))
                    }
                });

                var $ = layui.$, active = {
                    getCheckData: function(){ //获取选中数据
                        var checkStatus = table.checkStatus('idTest')
                            ,data = checkStatus.data;
                        layer.alert(JSON.stringify(data.field));
                    }
                    ,getCheckLength: function(){ //获取选中数目
                        var checkStatus = table.checkStatus('idTest')
                            ,data = checkStatus.data;
                        layer.msg('选中了：'+ data.length + ' 个');
                    }
                    ,isAll: function(){ //验证是否全选
                        var checkStatus = table.checkStatus('idTest');
                        layer.msg(checkStatus.isAll ? '全选': '未全选')
                    }
                };

                $('.demoTable .layui-btn').on('click', function(){
                    var type = $(this).data('type');
                    active[type] ? active[type].call(this) : '';
                });
                var $ = layui.$, active = {

                    reload: function(){
                        // var demoReload = $('#demoReload');
                        //执行重载

                        table.reload('testReload', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                            ,where: {
                                itemName:$("input[name='itemName']").val(),
                                priceMin:$("input[name='priceMin']").val(),
                                priceMax:$("input[name='priceMax']").val(),
                                itemCate:$("input[name='itemCate']").val(),
                                itemDes:$("input[name='itemDes']").val(),
                                itemId:$("input[name='itemId']").val()
                            }
                        });
                    }
                };

                $('.demoTable .layui-btn').on('click', function(){
                    var type = $(this).data('type');
                    active[type] ? active[type].call(this) : '';
                });
            });
            layui.use('laydate', function(){
                var laydate = layui.laydate;
                laydate.render({
                    elem: '#test5'
                    ,type: 'datetime'
                });
                laydate.render({
                    elem: '#test6'
                    ,type: 'datetime'
                });
            });


        </script>
    </div>
</body>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>
</body>

</html>


