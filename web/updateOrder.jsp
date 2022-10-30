<%-- 
    Document   : updateOrder
    Created on : Jun 13, 2022, 2:28:50 PM
    Author     : DELL
--%>
<%@page import="trongtoan.entity.UserDTO"%>
<%@page import="trongtoan.entity.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="trongtoan.entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Updating</title>
        <link rel="stylesheet" href="css/index.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/stylemenu.css" >
        <link rel="stylesheet" href="css/style1.css">
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"SEL".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            if (loginUser != null) {
        %>
        <% String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <h4 > <%= error%> </h4>
        <%
            List<Order> list = new ArrayList<>();
            list = (List<Order>) session.getAttribute("listOrder");
            if (list == null) {
        %>

        <div class="table_section">
            <table>
                <thead>
                    <tr>
                        <th>S No.</th>
                        <th>Order ID</th>
                        <th>Account ID</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <h3> Đơn Hàng Hiện Tại Đang Trống </h3>
            </table>
        </div>
        <%
        } else {
        %>
        <div class="table">
            <div class="table_header">
                <p>Order Details</p>
                <nav class="navbar">
                    <a href="SellHomeController"><i class="fa-solid fa-house"></i>HOME</a>
                </nav>

            </div>
            <div class="table_section">
                <table>
                    <thead>
                        <tr>
                            <th>S No.</th>
                            <th>Order ID</th>
                            <th>Account ID</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (Order order : list) {
                        %> 
                    <form action="MainController"> 
                        <tr>
                            <td>
                                <input type="text" name="" value="<%= count++%>" readonly="" />
                            </td> 
                            <td >
                                <input type="text" name="id" value="<%= order.getOrderID()%>" readonly=""/>
                            </td> 
                            <td>
                                <input type="text" name="rid" value="<%= order.getrID()%>" readonly=""/>
                            </td> 
                            <td>
                                <input type="text" name="total" value=" <%= order.getTotal()%> "  readonly=""/>

                            </td>
                            <td>
                                <a href="orderDetail.jsp?orderID=<%= order.getOrderID()%>" >OrderDetail</a> 
                            </td> 
                            <td>
                                <button name="action" value="deleteOrder"><i class="fa-solid fa-trash-can" ></i></button>   

                                <input type="hidden" name="orderID" value="<%= order.getOrderID()%>"
                            </td> 
                    </form>
                    </tr>
                    <%
                        }
                    %>   
                    </tbody>
                </table>
            </div>

        </div>
        <%
                }
            }
        %>
    </body>

</html>