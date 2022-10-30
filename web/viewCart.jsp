<%-- 
    Document   : tesst
    Created on : Jun 10, 2022, 4:42:18 PM
    Author     : DELL
--%>

<%@page import="trongtoan.entity.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="trongtoan.entity.Product"%>
<%@page import="trongtoan.entity.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Table Of Product</title>
        <link rel="stylesheet" href="css/index.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/stylemenu.css" >
    </head>

    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            if (loginUser != null) {
        %>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
        %>

        <div class="table_section">
            <table>
                <thead>
                    <tr>
                        <th>S No.</th>
                        <th>P.No</th>
                        <th>Name Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <h3> Giỏ Hàng Của Bạn Đang Trống </h3>
            </table>
            <a href="HomeController"  class="btn btn-lg btn-primary text-uppercase"> Continue Shopping </a>  
        </div>
        <%
        } else {
        %>
        <div class="table">
            <div class="table_header">
                <p>Order Details</p>
                <nav class="navbar">
                    <a href="HomeController"><i class="fa-solid fa-house"></i></a>
                </nav>
                <div> <input placeholder="search..." /> <button class="add_new">Search</button> </div>
            </div>
            <div class="table_section">
                <table>
                    <thead>
                        <tr>
                            <th>S No.</th>
                            <th>P.No</th>
                            <th>Name Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            double total = 0;
                            for (Product tea : cart.getCart().values()) {
                                total += tea.getQuantity() * tea.getPrice();
                        %> 
                    <form action="MainController"> 
                        <tr>
                            <td>
                                <input type="text" name="" value="<%= count++%>" readonly="" />
                            </td> 
                            <td>
                                <img src= <%= tea.getImage()%> readonly=""/> 
                            </td> 
                            <td>
                                <input type="text" name="name" value=" <%= tea.getName()%>" readonly="" />
                            </td>
                            <td>
                                <input type="text" name="quantity" value="<%= tea.getQuantity()%>"
                            </td>
                            <td>
                                <input type="text" name="price" value="<%= tea.getPrice()%>" readonly="" />
                            </td> 
                            <td>
                                <%= tea.getQuantity() * tea.getPrice()%>
                            </td>
                            <td>
                                <button name="action" value="updateCart"><i class="fa-solid fa-pen-to-square" ></i></button> 
                                <input type="hidden" name="id" value="<%= tea.getId()%>" />
                            </td> 
                            <td>                             
                                <a href="MainController?id=<%=tea.getId()%>&action=deleteCart">Delete</a> 
                            </td> 
                    </form>




                    <%
                        }
                    %>   


                    </tbody>
                </table>
                <h3> Total: <%= total + " VND"%> </h3>
            </div> 


            <%
                String error_message = (String) request.getAttribute("ERROR_QUANTITY");
                if (error_message == null) {
                    error_message = "";
                }
            %>
            <h5 style="color: red  " > <%= error_message%> </h5>          
            <a href="MainController?action=CheckOut&total=<%= total%>"  class="btn btn-lg btn-primary text-uppercase"> Check Out </a>        
            <a href="HomeController"  class="btn btn-lg btn-primary text-uppercase"> Continue Shopping </a>   
            <div class="pagination">
                <div><i class="fa-brands fa-facebook"></i></div>
                <div><i class="fa-brands fa-instagram"></i></div>
                <div><i class="fa-solid fa-cart-shopping"></i></div>
            </div>
        </div>

        <%
                }
            }
        %>
    </body>

</html>