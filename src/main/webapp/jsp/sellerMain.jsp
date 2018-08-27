<%--
  Created by IntelliJ IDEA.
  User: lmy
  Date: 2018/5/18
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>东华商城</title>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/holder.js"></script>
    <!-- 	<script>
            $(document).ready(function(){
                $(".list-group-item").hover(function(){
                    $(this).children("div.sort-detail").show();
                },function(){
                    $(this).children("div.sort-detail").hide();
                });
            })
        </script> -->
    <script>
        /*$(document).ready(function () {
            $(".data-item-li").children("div").addClass("to-big");
        });*/
    </script>
</head>
<style>

    .box2-img{width:210px;height:210px;text-align: center;display:table-cell;vertical-align: middle;}
    .box2-img .img2{max-height:100%;max-width:100%;}
    /*.box3-img{width:300px;height:300px;text-align: center;display:table-cell;vertical-align: middle; border-radius: 40%;}*/
    /*.box3-img .img2{max-height:100%;max-width:100%; border-radius: 40%}*/
    #advertise{
        width:200px;
        height: 200px;
    }
    #advertiseli{
        width:200px;

    }
    #sellerInfo{
        text-align: center;
    }
    #sellerhead{
        text-align: center;
    }
    #headPic{
        width: 300px;
        height: 300px;
        border-radius: 40%;
        margin-bottom: 5px;
    }

</style>
<body>
<div id="main" class="container">
    <!-- <div id="header">
        <ul id="header_left">
            <li id="login"><a href="">登录</a></li>
            <li id="register"><a href="">注册</a></li>
        </ul>
        <ul>
            <li><a href="">购物车</a></li>
            <li><a href="">收藏夹</a></li>
            <li><a href="">客服</a></li>
        </ul>
    </div>
    <div>

    </div> -->
    <div id="header">
        <%@ include file="header.jsp" %>


    <div class="content">

        <div class="elav_titel" id="sellerhead">
            <div class="elv_heading">
                <img id="headPic" class="aligncenter" src="/upload/${seller.imagepath}">
                <h3>卖家：${seller.sellername} &nbsp; </h3>
                <h3>卖家注册时间：${seller.regtime}</h3>

            </div>
        </div>
        <div class="elav_info">
            <!-- 价格 -->
            <%--<div class="price_box price_box_acr new_meta">--%>
            <%--&lt;%&ndash;<span class="old- price old- price-2">$250.00</span>&ndash;%&gt;--%>
            <%--<span class="spical-price spical-price-2">￥${productInfo['product'].price}</span>--%>
            <%--</div>--%>
            <div class="new_meta" id="sellerInfo">
                            <span class="sku_wrapper big-font">
                                卖家电话:
                                <span class="sku">${seller.telephone}</span>
                                <br><br>
                                <span  class="sku">
                                卖家邮箱:
                                    <span class="sku">${seller.email}</span>
                                <br><br>
                                <span  class="sku">
                            </span>
                            </span>
                                <span  class="sku">
                                微信:
                                    <span class="sku">${seller.wechat}</span>
                                <br><br>
                                <span  class="sku">
                            </span>
                            </span>
                                <span  class="sku">
                                支付宝:
                                    <span class="sku">${seller.alipay}</span>
                                <br><br>
                            </span>
                            </span>
            </div>

        <c:if test="${!empty advertiseList}">
            <div class="module">
                <div class="hd">
                    <h3>卖家${seller.sellername}的广告</h3>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${advertiseList}" var="advertise">
                                <li class="data-item-li" id="advertiseli">
                                    <div class="to-big" id="advertise">
                                        <a href="${pageContext.request.contextPath}/advertise?advertiseid=${advertise.advertiseid}">
                                            <img src="/upload/${advertise.imagepath}" alt=""
                                                 width="200" height="200">
                                        </a>
                                    </div>
                                    <h4 class="text-center">
                                        <a href="${pageContext.request.contextPath}/advertise?advertiseid=${advertise.advertiseid}">${advertise.advertisename}</a>
                                    </h4>


                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty digGoods}">
            <div class="module">
                <div class="hd">
                    <h3>${seller.sellername}的数码商品</h3>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${digGoods}" var="goods">

                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">
                                            <img class="img-rounded" src="/upload/${goods.imagepath}" width="210" height="210">
                                        </div>
                                        <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}">${goods.productname}</a></h3>
                                            <b>￥${goods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>


                            </c:forEach>


                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty houseGoods}">
            <div class="module">
                <div class="hd">
                    <h3>${seller.sellername}的生活用品</h3>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${houseGoods}" var="housegoods">
                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">

                                            <img class="img-rounded" src="/upload/${housegoods.imagepath}" width="210" height="210">
                                        </div>
                                        <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${housegoods.productid}">${housegoods.productname}</a></h3>
                                            <b>￥${housegoods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${housegoods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${housegoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${housegoods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!housegoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${housegoods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>

                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty colGoods}">
            <div class="module">
                <div class="hd">
                    <h3>${seller.sellername}的化妆品</h3>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${colGoods}" var="colgoods">
                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">

                                            <img class="img-rounded" src="/upload/${colgoods.imagepath}" width="210" height="210">
                                        </div>
                                        <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${colgoods.productid}">${colgoods.productname}</a></h3>
                                            <b>￥${colgoods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${colgoods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${colgoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${colgoods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!colgoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${colgoods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty bookGoods}">
            <div class="module">
                <div class="hd">
                    <h3>${seller.sellername}的书籍</h3>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${bookGoods}" var="bookgoods">
                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">

                                            <img class="img-rounded" src="/upload/${bookgoods.imagepath}" width="210" height="210">
                                        </div>
                                        <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${bookgoods.productid}">${bookgoods.productname}</a></h3>
                                            <b>￥${bookgoods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${bookgoods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${bookgoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${bookgoods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!bookgoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${bookgoods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty dressGoods}">
            <div class="module">
                <div class="hd">
                    <h3>${seller.sellername}的服装</h3>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${dressGoods}" var="goods">

                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">
                                            <img class="img-rounded" src="/upload/${goods.imagepath}" width="210" height="210">
                                        </div>
                                        <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}">${goods.productname}</a></h3>
                                            <b>￥${goods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>


                            </c:forEach>


                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty snackGoods}">
            <div class="module">
                <div class="hd">
                    <h3>${seller.sellername}的零食小吃</h3>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${snackGoods}" var="goods">

                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">
                                            <img class="img-rounded" src="/upload/${goods.imagepath}" width="210" height="210">
                                        </div>
                                        <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}">${goods.productname}</a></h3>
                                            <b>￥${goods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>


                            </c:forEach>


                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

            <c:if test="${!empty studyGoods}">
                <div class="module">
                    <div class="hd">
                        <h2>学习用品</h2>
                        <hr>
                    </div>

                    <div class="bd">
                        <div class="data">
                            <ul>
                                <c:forEach items="${studyGoods}" var="goods">

                                    <div class="col-sm-6 col-md-4">
                                        <div class="thumbnail">
                                            <div class="box2-img">
                                                <img class="img-rounded" src="/upload/${goods.imagepath}" width="210" height="210">
                                            </div>
                                            <div class="caption">
                                                <h3><a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}">${goods.productname}</a></h3>
                                                <b>￥${goods.price}</b>
                                                &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}" class="btn btn-primary" role="button">详细</a>
                                                <c:if test="${goods.fav}">
                                                    <button
                                                            class="like-button glyphicon glyphicon-heart btn btn-default"
                                                            data-id="${goods.productid}"
                                                    ></button>
                                                </c:if>
                                                <c:if test="${!goods.fav}">
                                                    <button
                                                            class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                            data-id="${goods.productid}"
                                                    ></button>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>


                                </c:forEach>


                                <div class="clear-float" style="clear: both;"></div>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:if>
    </div>
</div>
</body>
</html>


