var username = $.cookie("username");
var token = $.cookie("token");
var table;
layui.use(['element', 'laydate'], function () {
    var element = layui.element;
    var laydate = layui.laydate;
    laydate.render({
        elem: '#date1' //指定元素
    });
    var firstLoad = [false, true, true, true, true];
    element.on("tab(statusChange)", function (data) {
        switch (data.index) {
            case 0:
                table.reload('item1', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });
                break;
            case 1:
                if (firstLoad[data.index]) {
                    laydate.render({
                        elem: '#date2' //指定元素
                    });
                    table.render({//已发布
                        elem: '#itemStatus2'
                        , id: 'item2'
                        , url: "/demo2/sellerProductjson" //数据接口
                        , page: {
                            layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        }
                        , limit: 8
                        , cols: [[ //表头
                            {field: 'productname', title: '商品名', width: 190}
                            ,{field: 'productname', title: '商品名', event: 'viewItem', width: 190}
                            , {field: 'price', title: '价格', width: 80, sort: true}
                            , {field: 'num', title: '数量', width: 80, sort: true}
                            , {field: 'cate', title: '分类', width: 80, sort: true}
                            , {field: 'detaildescribe', title: '描述', width: 230, sort: true}
                            , {field: 'discountid', title: '折扣号', width: 80, sort: true}
                            , {field: 'uptime', title: '上架时间', width: 150, sort: true}
                            , {fixed: 'right', title: '操作', width: 85, align: 'center', toolbar: '#launchedOperate'}
                        ]]
                    });
                    firstLoad[data.index] = false;
                } else {
                    table.reload('item2', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                }
                break;

        }
    });
});

layui.use('util', function () {
    var util = layui.util;
    util.fixbar({
        css: {
            right: 15,
            bottom: 10
        }
    });
});

layui.use('table', function () {
    table = layui.table;
    table.render({//待发布
        elem: '#itemStatus1'
        , id: 'item1'
        ,url:"/demo2/sellerProductjson"
        // , url: itemGetItemsByPagerUrl + "?itemStatus=1" //数据接口
        // , where: {username: username, token: token}
        , initSort: {field: 'saveTime', type: 'desc'}
        , page: {
            layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
        }
        , limit: 8
        , cols: [[ //表头
            {field: 'imagepath', title: '商品图片', templet:'<div><img src="/upload/{{d.imagepath}}"></div>', width: 140}
            ,{field: 'productname', title: '商品名', event: 'viewItem', width: 190}
            , {field: 'price', title: '价格', width: 80, sort: true}
            , {field: 'num', title: '数量', width: 80, sort: true}
            , {field: 'cate', title: '分类', width: 80, sort: true}
            , {field: 'detaildescribe', title: '描述', width: 230, sort: true}
            , {field: 'discountid', title: '折扣号', width: 80, sort: true}
            , {field: 'uptime', title: '上架时间', width: 150, sort: true}
            , {fixed: 'right', title: '操作', width: 85, align: 'center', toolbar: '#launchedOperate'}
        ]]
    });
    table.reload('item1', {
        page: {
            curr: 1 //重新从第 1 页开始
        }
    });
    table.on('edit(item1)', function(obj){
        var value = obj.value //得到修改后的值
            ,data = obj.data //得到所在行所有键值
            ,field = obj.field; //得到字段
        layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
    });





    // 待发布操作
    table.on('tool(itemStatus1)', function (obj) {
        var data = obj.data;
        if (obj.event === 'edit') {
            window.location.href = "editItem.html?itemId=" + data.itemId;
        } else if (obj.event === 'launch') {//发布
            $.ajax({
                url: itemChangeStatusUrl,
                type: 'post',
                data: {itemId: data.itemId, itemStatus: 2, username: username, token: token},
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layui.use("layer", function (layer) {
                                layer.msg("发布成功");
                            });
                            obj.del();
                            break;
                        default:
                            layui.use("layer", function (layer) {
                                layer.msg("操作失败");
                            });
                            break;
                    }
                }
            });
        } else if (obj.event === 'delete') {//彻底删除

            $.ajax({
                url: '/demo2/sellerDeleteProduct',
                type: 'post',
                data: {productname:data.productname},
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layui.use("layer", function (layer) {
                                layer.msg("删除成功");
                            });
                            obj.del();
                            break;
                        default:
                            layui.use("layer", function (layer) {
                                layer.msg("操作失败");
                            });
                            break;
                    }
                }
            });
        }
    });
    // 已发布操作
    table.on('tool(itemStatus2)', function (obj) {
        var data = obj.data;
        if (obj.event === 'cancelLaunch') {//取消发布
            $.ajax({
                url: itemChangeStatusUrl,
                data: {itemId: data.itemId, itemStatus: 1, username: username, token: token},
                type: 'post',
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layui.use("layer", function (layer) {
                                layer.msg("下架成功");
                            });
                            obj.del();
                            break;
                        default:
                            layui.use("layer", function (layer) {
                                layer.msg("操作失败");
                            });
                            break;
                    }
                }
            });
        } else if (obj.event === 'delete') {//彻底删除
            $.ajax({
                url: '/demo2/sellerDeleteProduct',
                type: 'post',
                data: {productname:data.productname},
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layui.use("layer", function (layer) {
                                layer.msg("彻底删除成功");
                            });
                            obj.del();
                            break;
                        default:
                            layui.use("layer", function (layer) {
                                layer.msg("操作失败");
                            });
                            break;
                    }
                }
            });
        } else if (obj.event === 'viewItem') {
            window.open("itemDetail.html?itemId=" + data.itemId);
        }
    });
    //已售出操作
    table.on('tool(itemStatus4)', function (obj) {
        var data = obj.data;
        if (obj.event === 'delete') {
            $.ajax({
                url: itemChangeStatusUrl,
                data: {itemId: data.itemId, itemStatus: 0, username: username, token: token},
                type: 'post',
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layui.use("layer", function (layer) {
                                layer.msg("删除成功");
                            });
                            obj.del();
                            break;
                        default:
                            layui.use("layer", function (layer) {
                                layer.msg("操作失败");
                            });
                            break;
                    }
                }
            });
        } else if (obj.event === 'viewItem') {
            window.open("itemDetail.html?itemId=" + data.itemId);
        }
    });
    //回收站操作
    table.on('tool(itemStatus5)', function (obj) {
        var data = obj.data;
        if (obj.event === 'restore') {//还原
            $.ajax({
                url: itemChangeStatusUrl,
                data: {itemId: data.itemId, itemStatus: 5, username: username, token: token},
                type: 'post',
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layui.use("layer", function (layer) {
                                layer.msg("还原成功");
                            });
                            obj.del();
                            break;
                        default:
                            layui.use("layer", function (layer) {
                                layer.msg("操作失败");
                            });
                            break;
                    }
                }
            });
        } else if (obj.event === 'delete') {//彻底删除
            $.ajax({
                url: '/demo2/sellerDeleteProduct',
                type: 'post',
                data: {productid:data.productid},
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layui.use("layer", function (layer) {
                                layer.msg("彻底删除成功");
                            });
                            obj.del();
                            break;
                        default:
                            layui.use("layer", function (layer) {
                                layer.msg("操作失败");
                            });
                            break;
                    }
                }
            });
        } else if (obj.event === 'viewItem') {
            window.open("itemDetail.html?itemId=" + data.itemId);
        }
    });


});