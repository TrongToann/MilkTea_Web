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
            String orderID = request.getParameter("orderID");
            List<Order> list = new ArrayList<>();
            List<Product> listP = new ArrayList<>();
            list = (List<Order>) session.getAttribute("listOrderDetail");
            listP = (List<Product>) session.getAttribute("listP");
            if (list == null) {
        %>

        <div class="table_section">
            <table>
                <thead>
                    <tr class="col d-flex justify-content-center">
                        <th class="col d-flex justify-content-center">S No.</th>
                        <th class="col d-flex justify-content-center">Detail ID</th>
                        <th class="col d-flex justify-content-center">Order ID</th>
                        <th class="col d-flex justify-content-center">Product ID</th>
                        <th class="col d-flex justify-content-center">Price</th>
                        <th class="col d-flex justify-content-center">Quantity</th>
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
                    <a href="updateOrder.jsp"><i class="fa-solid fa-house"></i>RETURN</a>
                </nav>

            </div>
            <div class="table_section">
                <table>
                    <thead>
                        <tr >
                            <th>S No.</th>
                            <th>Detail ID</th>
                            <th>Order ID</th>
                            <th>Product ID</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (Order order : list) {
                                if (order.getOrderID().equals(orderID)) {
                        %> 
                    <form action="MainController"> 
                        <tr>
                            <td>
                                <input type="text" name="" value="<%= count++%>" readonly="" />


                            </td> 
                            <td >
                                <input type="text" name="id" value="<%= order.getDetailID()%>" readonly=""/>
                            </td> 
                            <td>
                                <input type="text" name="rid" value="<%= order.getOrderID()%>" readonly=""/>
                            </td> 
                            <td>
                                <%
                                    for (Product elem : listP) {
                                        if (elem.getId().equalsIgnoreCase(order.getProductID())) {

                                %>
                                <img src= <%= elem.getImage()%> readonly=""/> 
                                <%
                                        }
                                    }
                                %> 

                            </td> 
                            <td>
                                <input type="text" name="rid" value="<%= order.getPrice()%>" readonly=""/>
                            </td> 
                            <td>
                                <input type="text" name="total" value=" <%= order.getQuantity()%> " />

                            </td>

                    </form>



                    </tr>





                    <%
                            }
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