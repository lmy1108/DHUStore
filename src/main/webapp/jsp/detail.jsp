<%--
  Created by IntelliJ IDEA.
  User: lmy
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>商城-${goodsInfo['product'].productname}</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- all css here -->
    <!-- bootstrap v3.3.6 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">

    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">--%>
    <!-- style css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <link href="${pageContext.request.contextPath}/css/shopdetail.css" rel="stylesheet">
    <!-- <script src="./detail/js/jquery.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>

    <%--<script src="${pageContext.request.contextPath}/js/sort.js"></script>--%>

    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/detail.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.raty.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            <%--alert(JSON.stringify(${goodsInfo}));--%>
            var showproduct = {
                "boxid": "showbox",
                "sumid": "showsum",
                "boxw": 400,
                "boxh": 550,
                "sumw": 60, //列表每个宽度,该版本中请把宽高填写成一样
                "sumh": 60, //列表每个高度,该版本中请把宽高填写成一样
                "sumi": 7, //列表间隔
                "sums": 5, //列表显示个数
                "sumsel": "sel",
                "sumborder": 1, //列表边框，没有边框填写0，边框在css中修改
                "lastid": "showlast",
                "nextid": "shownext"
            }; //参数定义
            $.ljsGlasses.pcGlasses(showproduct); //方法调用，务必在加载完后执行

            $(function () {

                $('.tabs a').click(function () {

                    var $this = $(this);
                    $('.panel').hide();
                    $('.tabs a.active').removeClass('active');
                    $this.addClass('active').blur();
                    var panel = $this.attr("href");
                    $(panel).show();
                    return fasle; //告诉浏览器  不要纸箱这个链接
                }); //end click


                $(".tabs li:first a").click(); //web 浏览器，单击第一个标签吧

            }); //end ready

            $(".centerbox li").click(function () {
                $("li").removeClass("now");
                $(this).addClass("now");

            });

            /*$("#chatto").click(function () {
                $.ajax({
                    url: "/demo2/chat/", //把表单数据发送到ajax.jsp
                    type: "POST",
                    data: {
                        sendto: 5
                    },
                    error: function (request) {
                        alert(result.msg);
                    },
                    success: function (result) {
                    }
                });
            });*/

            $('.fav-button').click(function(){
                //$(this).removeClass("glyphicon-heart-empty");
                var productId = $(this).attr('data-id');
                var isChangeBtn = true;
                if(!$(this).children("i").hasClass('fa-heart')) {
                    //收藏
                    $.ajax({
                        url:"/demo2/collect",
                        type:"POST",
                        data:{
                            productid:productId
                        },
                        success:function (result) {
                            //收藏成功
                            if(result.code === 200){
                                location.href = "/demo2/login";
                                isChangeBtn = false;
                            }
                        },
                        error:function () {
                            alert("收藏失败");
                        }
                    })
                } else {
                    //取消收藏
                    $.ajax({
                        url:"/demo2/deleteCollect",
                        type:"POST",
                        data:{
                            productid:productId
                        },
                        success:function (result) {
                            //取消收藏成功
                            if(result.code === 200){
                                location.href = "/demo2/login";
                                isChangeBtn = false;
                            }
                        },
                        error:function () {
                            alert("取消收藏失败");
                        }
                    })
                }

                /*$.post("servlet/CollectServlet", {
                 productId: productId,
                 });
                 // alert("商品已加入购物车！");*/

                if(isChangeBtn) {
                    $(this).children("i").toggleClass("fa-heart fa-heart-o");
                    var likeContent = $(this).children("span").text();
                    if(likeContent == '收藏'){
                        $(this).children("span").text('取消收藏');
                    } else {
                        $(this).children("span").text('收藏');
                    }
                }
            });
            $("#star").raty({path: '${pageContext.request.contextPath}/image/img'});

            $("#saveEvaluate").click(function (){
                var score=$("[name='score']").val();
                var content=$("#description").val();
                var comment={};
                comment.commentid={};
                comment.userid={};
                comment.productid=${productInfo['product'].productid};
                comment.point=score;
                comment.content=content;
                $.ajax({
                    type:"POST",
                    url:"/demo2/addComment",
                    contentType:"application/x-www-form-urlencoded; charset=utf-8",
                    data:comment,
                    dataType:"json",
                    success:function (result){
                        $("#comment").modal('hide');
                        swal(result.msg);
                    },
                    error:function (){
                        alert("评论失败");
                    }
                });


            })
        });

    </script>
    <style>
        .head{
            width: 45px !important;
            background: rgba(0,0,0,.0001) none repeat scroll 0 0 !important;
            border: 1px solid rgba(0,0,0,.075) !important;
        }
        .span-block{
            display: block !important;
            padding:5px;
        }
        #headPic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-bottom: 25px;
        }
        #commentPic {
            width: 80px;
            height: 80px;
            border-radius: 80%;
        }
    </style>

</head>

<body>
<%--商品评价模态框--%>
<div class="modal fade" id="comment" tabindex="-1" role="dialog" aria-labelledby="myModalLabelPsw">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabelPsw">商品评价</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updatePsw-form" name="update-form" method="post">
                    <div class="form-group">
                        <label for="star" class="col-sm-2 control-label">商品评分</label>
                        <div class="col-sm-9">
                            <div id="star" data-num="3.5"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">详细描述</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" rows="3" id="description"></textarea>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="saveEvaluate" >保存</button>
            </div>
        </div>
    </div>
</div>
<!--zoom elavator area one start-->
<div class="elavator_area">
    <div class="container">
        <jsp:include page="header.jsp"/>
        <div class="shop_menu shop_menu_2 main-detail-div">
            <ul class="cramb_area cramb_area_5 main-detail-nav">
                <li><a href="/demo2/main">首页 /</a></li>
                <%--<li><a href="index.html">Shop /</a></li>
                <li><a href="index.html">Headlight/</a></li>
                <li><a href="index.html">Hats /</a></li>--%>
                <li class="br-active">${productInfo['product'].productname}</li>
            </ul>
        </div>
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                <div class="shopdetails">
                    <div id="leftbox">
                        <div id="showbox">
                            <%--<c:forEach items="${productInfo['image']}" var="path">--%>
                                <img src="/upload/${productInfo['product'].imagepath}" width="300" height="300"/>
                            <%--</c:forEach>--%>
                        </div></div>

                    </br>
                    </br>
                    </br>
                    </br>

                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="elav_titel">
                    <div class="elv_heading">
                        <h3>${productInfo['product'].productname}</h3>
                    </div>
                    <div class="price_rating">
                        <%--<a href="#">
                            <i class="fa fa-star"></i>
                        </a>
                        <a href="#">
                            <i class="fa fa-star"></i>
                        </a>
                        <a href="#">
                            <i class="fa fa-star"></i>
                        </a>
                        <a href="#">
                            <i class="fa fa-star"></i>
                        </a>
                        <a class="not-rated" href="#">
                            <i class="fa fa-star-o"></i>
                        </a>
                        <a class="review-link" href="#">
                            (
                            <span class="count">2</span>
                            customer reviews)
                        </a>--%>
                    </div>
                    <!-- <div class="evavet_description">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce posuere metus vitae arcu imperdiet, id aliquet ante scelerisque. Sed sit amet sem vitae urna fringilla tempus.</p>
                    </div> -->
                </div>
                <div class="elav_info">
                    <!-- 价格 -->
                    <div class="price_box price_box_acr new_meta">
                        <%--<span class="old- price old- price-2">$250.00</span>--%>
                        <span class="spical-price spical-price-2">￥${productInfo['product'].price}</span>
                    </div>
                    <div class="new_meta">
                            <span class="sku_wrapper big-font">
                                类别:
                                <span class="sku">${productInfo['cate'].catename}</span>
                                <br><br>
                                <span  class="sku">
                                卖家编号:
                                    <span class="sku">${productInfo['product'].sellerid}</span>
                                <br><br>
                                <span  class="sku">
                            </span>
                            </span>
                                <span  class="sku">
                                库存:
                                    <span class="sku">${productInfo['product'].num}</span>
                                <br><br>
                                <span  class="sku">
                            </span>
                            </span>
                                <span  class="sku">
                                上架时间:
                                    <span class="sku">${productInfo['product'].uptime}</span>
                                <br><br>
                            </span>


                            </span>
                    </div>
                    <div class="rel-div">

                        <form class="cart-btn-area new_meta" action="${pageContext.request.contextPath}/addCart" method="post">
                            <input type="hidden" value="${productInfo['product'].productid}" name="productid"/>

                            <button class="add-tocart cart_zpf" type="submit">加入购物车</button>
                            <input type="number" value="1" name="goodsnum" class="invisible">
                        </form>
                        <div class="add_defi new_meta">
                            <a data-original-title="Add to Wishlist" data-toggle="tooltip" class="fav-button big-font" data-id="${productInfo['product'].productid}">
                                <c:if test="${productInfo['product'].fav}">
                                    <i class="fa fa-heart"></i>
                                    取消收藏
                                </c:if>
                                <c:if test="${!productInfo['product'].fav}">
                                    <i class="fa fa-heart-o"></i>
                                    <span class="like-content">收藏</span>
                                </c:if>
                            </a>
                        </div>
                    </div>

                    <!-- <div class="add_defi_2">
                        <a data-original-title="Compare" title="" data-toggle="tooltip" rel="nofollow" data-product_id="45" href=""><i class="fa fa-refresh another_icon"></i> Compare</a>
                    </div> -->

                </div>
            </div>
        <div class="col-lg-1 col-md-1 ">
            &nbsp;
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
            <div class="elav_titel">
                <div class="elv_heading">
                    <h3>卖家：${productInfo['seller'].sellername} &nbsp; <img id="headPic" src="/upload/${productInfo['seller'].imagepath}"></h3>
                    <h3>卖家注册时间：${productInfo['seller'].regtime}</h3>

                </div>
            </div>
            <div class="elav_info">
                <!-- 价格 -->
                <%--<div class="price_box price_box_acr new_meta">--%>
                    <%--&lt;%&ndash;<span class="old- price old- price-2">$250.00</span>&ndash;%&gt;--%>
                    <%--<span class="spical-price spical-price-2">￥${productInfo['product'].price}</span>--%>
                <%--</div>--%>
                <div class="new_meta">
                            <span class="sku_wrapper big-font">
                                卖家电话:
                                <span class="sku">${productInfo['seller'].telephone}</span>
                                <br><br>
                                <span  class="sku">
                                卖家邮箱:
                                    <span class="sku">${productInfo['seller'].email}</span>
                                <br><br>
                                <span  class="sku">
                            </span>
                            </span>
                                <span  class="sku">
                                微信:
                                    <span class="sku">${productInfo['seller'].wechat}</span>
                                <br><br>
                                <span  class="sku">
                            </span>
                            </span>
                                <span  class="sku">
                                支付宝:
                                    <span class="sku">${productInfo['seller'].alipay}</span>
                                <br><br>
                            </span>
                            </span>
                </div>

                <div >
                    <a href="${pageContext.request.contextPath}/sellerMain?sellerId=${productInfo['seller'].sellerid}">

                        <button class="add-tocart cart_zpf" type="submit" >访问卖家主页</button>
                    </a>
                </div>

                <!-- <div class="add_defi_2">
                    <a data-original-title="Compare" title="" data-toggle="tooltip" rel="nofollow" data-product_id="45" href=""><i class="fa fa-refresh another_icon"></i> Compare</a>
                </div> -->

            </div>
        </div>
            <!-- <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">

        </div> -->
        </div>
    </div>
</div>
<!--zoom elavator area one end-->
<!--tab area start-->
<div class="tab_area_start">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 text-right">
                <div class="my-tabs">
                    <!-- Nav tabs -->
                    <ul class="favtabs favtabs-2 favtabs-nytr" role="tablist">
                        <%--<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Discription</a></li>--%>
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                                                  data-toggle="tab">商品描述</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">评价
                            (${commentList.size()})</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div class="row">
                                <div class="col-md-12 col-xs-12">
                                    <div class="tb_desc">
                                        <h2>商品描述</h2>
                                        <p>${productInfo['product'].detaildescribe}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile">
                            <div class="row">
                                <div class="col-md-12 col-xs-12">
                                    <div class="tb_desc">
                                        <div class="review_area_heading">
                                            <div id="comnt">
                                                <h2>${commentList.size()}条评论</h2>
                                                <ol class="commentlist">
                                                    <c:forEach items="${commentList}" var="comment">
                                                        <li id="li-comment-22" class="comment even thread-even depth-1"
                                                            itemscope="">
                                                            <div id="comment-22" class="comment_container">

                                                                <div class="comment-text">
                                                                    <div class="star-rating" title="Rated ${comment.point} out of 5"
                                                                         itemscope="">
                                                                        <div class="price_rating price_rating_2">
                                                                          <c:forEach  begin="1" end="${comment.point}">
                                                                              <a href="#">
                                                                                  <i class="fa fa-star"></i>
                                                                              </a>
                                                                          </c:forEach>
                                                                            <c:forEach begin="${comment.point+1}" end="5">
                                                                                <a class="not-rated" href="#">
                                                                                    <i class="fa fa-star-o"
                                                                                       aria-hidden="true"></i>
                                                                                </a>
                                                                            </c:forEach>
                                                                            <span>
                                                                                <strong>${comment.point}</strong>
                                                                                out of ${5-comment.point}
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <img id="commentPic" src="/upload/${comment.userImage}">

                                                                    <h5 class="meta">
                                                                        <strong>${comment.username}</strong>
                                                                        –
                                                                        <time datetime="${comment.commenttime}">
                                                                            ${comment.commenttime.year+1900}年
                                                                            ${comment.commenttime.month+1}月
                                                                            ${comment.commenttime.date}日
                                                                        </time>
                                                                        :
                                                                            <i class="fa fa-commenting"></i>
                                                                        </a>
                                                                    </h5>
                                                                    <br/>
                                                                    <div class="description">
                                                                        <h4>${comment.content}</h4>
                                                                    </div>
                                                                    <br/>

                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ol>




                                                　　
                                                <c:choose><c:when test="${hasBought}"><h4>您已购买，请评论：&nbsp;</h4><button class="btn btn-success" data-toggle="modal"  data-target="#comment" >添加评论</button></c:when><c:otherwise><h4>您尚未购买，无法评论！&nbsp;</h4></c:otherwise></c:choose>






                                            </div>
                                            <%--<div class="review_form_area">
                                                <div class="review_form">
                                                    <div class="revew_form_content">
                                                        <h3 id="reply-title" class="comment-reply-title">
                                                            Add a review
                                                            <small>
                                                                <a id="cancel-comment-reply-link" style="display:none;" href="#" rel="nofollow">Cancel reply</a>
                                                            </small>
                                                        </h3>
                                                        <form id="commentform" class="comment-form" method="post" action="form">
                                                            <div class="comment-form-rating">
                                                                <label class="comment">Your Rating</label>
                                                                <div class="price_rating price_rating_2 price_rating_3">
                                                                    <a href="#">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="comment-form-comment">
                                                                <label class="comment">Your Review</label>
                                                                <textarea id="comment" aria-required="true" rows="8" cols="45" name="comment"></textarea>
                                                            </div>
                                                            <div class="comment-form-author">
                                                                <label class="comment">
                                                                    Name
                                                                    <span class="required required_menu">*</span>
                                                                </label>
                                                                <input id="author" class="mix_type" type="text" aria-required="true" size="30" value="" name="author">
                                                            </div>
                                                            <div class="comment-form-email">
                                                                <label class="comment">
                                                                    Email
                                                                    <span class="required required_menu">*</span>
                                                                </label>
                                                                <input id="email" class="mix_type" type="text" aria-required="true" size="30" value="" name="email">
                                                            </div>
                                                            <div class="form-submit">
                                                                <input id="sub" class="submt" type="submit" value="Submit" name="submit">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--tab area end-->
<!-- jquery latest version -->
<!-- <script src="js/vendor/jquery-1.12.0.min.js"></script> -->
<!-- bootstrap js -->
<!-- <script src="js/bootstrap.min.js"></script> -->

</body>

</html>


