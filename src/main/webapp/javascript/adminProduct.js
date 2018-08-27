//returndata 指的是从controller传回来的data，是什么格式都可以，都会变为json
var selectProduct;
function deleteProduct(id) {
    var product={};
    product.productid=id;
    alert(id);
    $.ajax({
        url: 'deleteProduct' ,
        type: 'post',
        data: product,
        datatype:'json',
        success: function (returndata) {
            alert(returndata);
        },
        error: function (returndata) {
            alert(returndata);
        }
    });
}
//弹窗和后台交互使用的ajax
function selectProduct(data){
    $.ajax({
        url: 'selectProduct' ,
        type: 'post',
        data: {'productid':data.productid},
        datatype:'json',
        success: function (returndata) {
            alert(returndata);
            layer.open({
                type: 1,
                title:false,
                shift: 7,
                shadeClose: true,
                area: ['800px', '600px'], //宽高
                content: returndata
            });
        },
        error: function (returndata) {
            alert(returndata);
        }
    });
}
//通过选择框选择列表元素ajax
// function searchProduct(){
//     var product={};
//     product.itemName=$("input[name='itemName']").val();
//     product.priceMin=$("input[name='priceMin']").val()
//     product.priceMax=$("input[name='priceMax']").val()
//     alert(JSON.stringify(product));
//     $.ajax({
//         url: 'productjson' ,
//         type: 'post',
//         data: product,
//         datatype:'json',
//         success: function (returndata) {
//             alert(returndata);
//         },
//         error: function (returndata) {
//             alert(returndata);
//         }
//     });
// }
var awards = "";
function updateProduct(data) {
    // alert(JSON.stringify(data));
    selectProduct = data;

    /*$.ajax({
        type: 'POST',
        url: 'showUpdate',//发送请求
        data: {"productid":data.productid},
        dataType : "jsp",
        success: function(result) {

            layer.open({
            type: 2,
            title:false,
            shift: 7,
            shadeClose: true,
            area: ['800px', '600px'], //宽高
            content: 'jsp/layer/editProductLayer.jsp'
    });
        }
});*/
/*    layer.open({
        type: 2,
        title:false,
        shift: 7,
        shadeClose: true,
        area: ['800px', '600px'], //宽高
        content: "jsp/layer/editProductLayer.jsp"
    });*/
}

