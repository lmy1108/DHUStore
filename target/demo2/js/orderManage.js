var username = $.cookie("username");
var token = $.cookie("token");
var table;
layui.use(['element', 'laydate'], function () {
    var element = layui.element;
    var laydate = layui.laydate;
    laydate.render({
        elem: '#test1' //指定元素
        ,type: 'datetime'
    });laydate.render({
        elem: '#test2' //指定元素
        ,type: 'datetime'
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
                        elem: '#test3' //指定元素
                        ,type: 'datetime'
                    });laydate.render({
                        elem: '#test4' //指定元素
                        ,type: 'datetime'
                    });
                    table.render({//已发布
                        elem: '#itemStatus2'
                        , id: 'item2'
                        , url: "/demo2/sellerOrderjson2" //数据接口
                        // , where: {username: username, token: token}
                        // , initSort: {field: 'addTime', type: 'desc'}
                        , page: {
                            layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        }
                        , limit: 8
                        , cols: [[ //表头
                            {field: 'orderid', title: '订单号', event: 'viewItem', width: 100}
                            , {field: 'userid', title: '用户id', width: 100, sort: true}
                            , {field: 'ordertime', title: '订单时间', width: 200, sort: true}
                            , {field: 'newprice', title: '成交价格', width: 100, sort: true}
                            , {field: 'ispay', title: '是否付款', width: 120, sort: true}
                            , {field: 'issend', title: '是否发货', width: 120, sort: true}
                            , {field: 'isreceive', title: '是否收货', width: 120, sort: true}
                            , {field: 'note', title: '备注', width: 400, sort: true}
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

            case 2:
                if (firstLoad[data.index]) {
                    laydate.render({
                        elem: '#test5' //指定元素
                        ,type: 'datetime'
                    });laydate.render({
                        elem: '#test6' //指定元素
                        ,type: 'datetime'
                    });
                    table.render({//已发布
                        elem: '#itemStatus3'
                        , id: 'item3'
                        , url: "/demo2/sellerOrderjson3" //数据接口
                        // , where: {username: username, token: token}
                        // , initSort: {field: 'addTime', type: 'desc'}
                        , page: {
                            layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        }
                        , limit: 8
                        , cols: [[ //表头
                            {field: 'orderid', title: '订单号', event: 'viewItem', width: 100}
                            , {field: 'userid', title: '用户id', width: 100, sort: true}
                            , {field: 'ordertime', title: '订单时间', width: 200, sort: true}
                            , {field: 'newprice', title: '成交价格', width: 100, sort: true}
                            , {field: 'ispay', title: '是否付款', width: 120, sort: true}
                            , {field: 'issend', title: '是否发货', width: 120, sort: true}
                            , {field: 'isreceive', title: '是否收货', width: 120, sort: true}
                            , {field: 'note', title: '备注', width: 300, sort: true}
                            , {fixed: 'right', title: '操作', width: 85, align: 'center', toolbar: '#finishOperate'}
                        ]]
                    });
                    firstLoad[data.index] = false;
                } else {
                    table.reload('item3', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                }
                break;

        }
    });



    $('#reload1').click(function() {
        table.reload('item1', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            , where: {
                minTime: $("input[name='minTime1']").val(),
                maxTime: $("input[name='maxTime1']").val()

            }
        });
    });

    $('#reload2').click(function() {
        table.reload('item2', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            , where: {
                minTime: $("input[name='minTime2']").val(),
                maxTime: $("input[name='maxTime2']").val()

            }
        });
    });
    $('#reload3').click(function() {
        table.reload('item3', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            , where: {
                minTime: $("input[name='minTime3']").val(),
                maxTime: $("input[name='maxTime3']").val()

            }
        });
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
        ,url:"/demo2/sellerOrderjson"
        // , url: itemGetItemsByPagerUrl + "?itemStatus=1" //数据接口
        // , where: {username: username, token: token}
        , initSort: {field: 'saveTime', type: 'desc'}
        , page: {
            layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
        }
        , limit: 8
        , cols: [[ //表头
            {field: 'orderid', title: '订单号', event: 'viewItem', width: 100}
            , {field: 'userid', title: '用户id', width: 100, sort: true}
            , {field: 'ordertime', title: '订单时间', width: 200, sort: true}
            , {field: 'newprice', title: '成交价格', width: 100, sort: true}
            , {field: 'ispay', title: '是否付款', width: 120, sort: true}
            , {field: 'issend', title: '是否发货', width: 120, sort: true}
            , {field: 'isreceive', title: '是否收货', width: 120, sort: true}
            , {field: 'note', title: '备注', width: 300, sort: true}
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
        } else if (obj.event === 'Launch') {//发布
            $.ajax({
                url: '/demo2/launchOrder',
                type: 'post',
                data: {orderId:data.orderid},
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layui.use("layer", function (layer) {
                                layer.msg("发货成功");
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
                url: itemDeleteAnyWayUrl,
                type: 'post',
                data: {itemId: data.itemId, username: username, token: token},
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
        }
    });
    // 已发布操作
    table.on('tool(itemStatus3)', function (obj) {
        var data = obj.data;
        if (obj.event === 'finish') {//取消发布
            $.ajax({
                url: '/demo2/finishOrder',
                data:{orderId:data.orderid},
                type: 'post',
                success: function (data) {
                    switch (data.code) {
                        case 0:
                            layui.use("layer", function (layer) {
                                layer.msg("订单已完成");
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
                url: itemDeleteAnyWayUrl,
                type: 'post',
                data: {itemId: data.itemId, username: username, token: token},
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
                url: itemChangeStatusUrl,
                type: 'post',
                data: {itemId: data.itemId, itemStatus: 6, username: username, token: token},
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