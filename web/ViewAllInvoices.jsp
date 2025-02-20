<%-- 
    Document   : DashBoard
    Created on : Mar 31, 2021, 7:54:26 PM
    Author     : ADMIN
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--Favicon-->
        <link rel="icon" type="image/png" href="image/faviconLogo.png" />

        <!--Table Styling-->
        <link rel="stylesheet" href="css/OrderTableStyle.css" type="text/css"/>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

        <title>Computer ERA</title>
        <!--Favicon-->
        <link rel="icon" type="image/png" href="image/faviconLogo.png" />
    </head>
    <body>

        <a class="nav-link" href="logout" style="position: fixed; right: 10px;">LogOut</a>

        <div class="container">
            <div class="row">
                <div class="col-3">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light flex-column">
                        <a class="navbar-brand" href="dashBoard"><img src="image/MenuLogo.png" width="200px"></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="home">Home</a>
                            </li>
                            <c:if test="${sessionScope.acc == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="login">Login</a>
                                </li>
                            </c:if>
                            <c:if test = "${sessionScope.acc != null}">
                                <li class="nav-item">
                                    <a class="nav-link text-info" href="login">Hello ${sessionScope.acc.user}</a>
                                </li>
                                <c:if test="${sessionScope.acc.isSell == 1}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="manager">Manager Product</a>
                                        <a class="nav-link" href="blogManager"><i class="fas fa-tasks"></i>Manager Blog</a>
                                        <a class="nav-link" href="manage-feedback"><i class="fas fa-tasks"></i>Manage Feedback</a>
                                    </li> 
                                </c:if>
                                <c:if test="${sessionScope.acc.isAdmin == 1}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="accountManager">Manager Account</a>
                                    </li> 
                                </c:if>
                            </c:if>

                            <li class="nav-item">&nbsp;
                            </li> 
                        </ul>
                    </nav>
                </div>
                <div class="col-6">
                    <section class="jumbotron text-center" style="background-color: white;">
                        <div class="container">
                            <h1 class="jumbotron-heading"><img src="image/MainLogo.png" alt="Main Logo" width="60%"/></h1>
                            <p class="lead text-muted mb-0">Điện thoại, Tablet, Laptop, Phụ kiện chính hãng giá tốt...</p>
                        </div>
                    </section>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <!--                <div class="col-4">
                                    <div class="card mb-3" style="max-width: 540px;">
                                        <div class="row g-0">
                                            <div class="col-md-4">
                                                <img src="image/AccountIcon.png" alt="..." width="70%;">
                                            </div>
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">Total Accounts</h5>
                                                    <h5 class="card-title">${totalAccount}</h5>
                                                    <p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="card mb-3" style="max-width: 540px;">
                                        <div class="row g-0">
                                            <div class="col-md-4">
                                                <img src="image/ProductIcon.png" alt="..." width="70%;">
                                            </div>
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">Total Products</h5>
                                                    <h5 class="card-title">${totalProduct}</h5>
                                                    <p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
                <div class="col-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="image/InvoiceIcon.png" alt="..." width="70%;" style="margin-top: 10px;">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Total Invoices</h5>
                                    <h5 class="card-title">${totalCart}</h5>
                                    <p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <style>
                        td{
                            padding-right:3em;
                            padding:10px; border: 1px solid;
                        }
                    </style>
                    <table id="customers" style="margin-left:3em; border: 1px solid;">
                        <thead >
                            <tr >
                                <th style="text-align: center;">Order ID</th>
                                <th style="text-align: center;">User Id</th>
                                <th style="text-align: center;">Total Price</th>
                                <th style="text-align: center;">Note</th>
                                <th style="text-align: center;">Status  </th>
                                <th style="text-align: center;">Day Buy</th>
                                <th style="text-align: center;">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${orders}" varStatus="x">
                                <tr style="padding:2px; border: 1px solid">
                                    <td>${item.id}</td>
                                    <td>${item.userId}</td>
                                    <td>
                                        <fmt:formatNumber type = "number" maxFractionDigits = "1" value = "${item.totalPrice}"/>VNĐ
                                    </td>
                                    <td>${item.note}</td>
                                    <c:if test="${item.status eq 'Packaging'}">
                                        <td>${item.status}</td>
                                        <td>${item.date}</td>
                                        <td><a  style="cursor: pointer " onclick="formAutoSubmit('${item.id}');">View</a></td>
                                <form style="display:none;" id="${item.id}" action="viewInvoiceDetailAdmin">
                                    <input type="hidden" value="Packaging" name="status">
                                    <input type="hidden" value="${item.id}" name="id">
                                </form>
                            </c:if>                                   
                            <c:if test="${item.status eq 'Canceled'}">
                                <td>${item.status}</td>
                                <td>${item.date}</td>
                                <td><a style="cursor: pointer "  onclick="formAutoSubmit('${item.id}');">View</a></td>
                                <form style="display:none;" id="${item.id}" action="viewInvoiceDetailAdmin">
                                    <input type="hidden" value="Canceled" name="status">
                                    <input type="hidden" value="${item.id}" name="id">
                                </form>
                            </c:if>
                            <c:if test="${item.status eq 'Delivering'}">
                                <td>${item.status}</td>
                                <td>${item.date}</td>
                                <td><a  style="cursor: pointer "onclick="formAutoSubmit('${item.id}');">Products being shipped</a></td>
                                <form style="display:none;" id="${item.id}" action="viewInvoiceDetailAdmin">
                                    <input type="hidden" value="Delivering" name="status">
                                    <input type="hidden" value="${item.id}" name="id">
                                </form>
                            </c:if>
                            <c:if test="${item.status eq 'Waiting for Confirmation'}">
                                <td>${item.status}</td>
                                <td>${item.date}</td>
                                <td><a style="cursor: pointer " onclick="formAutoSubmit('${item.id}');">Manage</a></td>
                                <form style="display:none;" id="${item.id}" action="viewInvoiceDetailAdmin">
                                    <input type="hidden" value="Waiting for Confirmation" name="status">
                                    <input type="hidden" value="${item.id}" name="id">
                                </form>
                            </c:if>
                            <c:if test="${item.status eq 'Completed'}">
                                <td>${item.status}</td>
                                <td>${item.date}</td>
                                <td><a  style="cursor: pointer "onclick="formAutoSubmit('${item.id}');">View</a></td>
                                <form style="display:none;" id="${item.id}" action="viewInvoiceDetailAdmin">
                                    <input type="hidden" value="Delivering" name="status">
                                    <input type="hidden" value="${item.id}" name="id">
                                </form>
                            </c:if>

                            <c:set var="total" value="${total + item.totalPrice}" />
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    </br>
                    </hr>
                    <h1 style="color:red;">Total:                                        
                        <fmt:formatNumber type = "number" maxFractionDigits = "1" value = "${total}"/> 
                        VNĐ</h1>
                </div>
                <div class="row">
                    <div class="col-6">
                        <h3>Most Selling Product</h3>
                        <c:forEach var="o" items="${top3MostSellD}">
                            <h6>${o.name}</h6>
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${o.proportion}%" aria-valuenow="${o.proportion}" aria-valuemin="0" aria-valuemax="100">${o.amount}</div>
                            </div>
                            <br>
                        </c:forEach>
                    </div>
                    <div class="col-6">
                        <h3>Least Selling Product</h3>
                        <c:forEach var="o" items="${top3LeastSellD}">
                            <h6>${o.name}</h6>
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${o.proportion}%" aria-valuenow="${o.proportion}" aria-valuemin="0" aria-valuemax="100">${o.amount}</div>
                            </div>
                            <br>
                        </c:forEach>
                    </div>
                </div>
            </div>


            <script type="text/javascript">

                function formAutoSubmit(name) {

                    var frm = document.getElementById(name);

                    frm.submit();

                }
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>