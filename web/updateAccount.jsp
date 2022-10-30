<%-- 
    Document   : tesst
    Created on : Jun 10, 2022, 4:42:18 PM
    Author     : DELL
--%>

<%@page import="trongtoan.entity.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Account Updating</title>
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
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
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
            List<UserDTO> list = new ArrayList<>();
            list = (List<UserDTO>) session.getAttribute("listA");
            if (list == null) {
        %>
        <div class="table_section">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>UserID</th>
                        <th>Password</th>
                        <th>FullName</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <h3> Sản Phẩm Hiện Tại Đang Trống </h3>
            </table>
        </div>
        <%
        } else {
        %>
        <div class="table">
            <div class="table_header">
                <p>Order Details</p>
                <nav class="navbar">
                    <a href="AdminHomeController"><i class="fa-solid fa-house"></i>HOME</a>
                </nav>
               <form action="MainController" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input value="${txtSearch}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search By Name...">
                            <div class="input-group-append">
                                <button type="submit" name="action" value="SearchAccount" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div> 
                    </form>
            </div>
            <div class="table_section">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>UserID</th>
                            <th>Password</th>
                            <th>FullName</th>
                            <th>Role</th>
                        </tr>
                       <%
                        String error_message = (String) request.getAttribute("ERROR_SEARCH");
                        if (error_message == null) {
                            error_message = "";
                        }
                    %>
                    <h3 style="color: red  " > <%= error_message%> </h3>   
                    </thead>
                    <tbody>
                        <%
                            double total = 0;
                            for (UserDTO account : list) {
                        %> 
                    <form action="MainController"> 
                        <tr>
                            <td >
                                <input type="text" name="rid" value="<%= account.getrID() %>" />
                            </td> 
                            <td>
                                <input type="text" name="id" value="<%= account.getUserID()%>" />
                            </td> 
                            <td>
                                <input type="text" name="name" value=" <%= account.getPassword() %> " />

                            </td>
                            <td>
                                <input type="text" name="fullName" value="<%= account.getFullName() %>" />

                            </td> 
                            <td>
                                <input type="text" name="role" value="<%= account.getRoleID() %>" />

                            
                            <td>

                                <button name="action" value="updateAccount"><i class="fa-solid fa-pen-to-square" ></i></button> 
                            </td> 
                            <td>

                                <a href="MainController?id=<%=account.getrID() %>&action=deleteAccount">Delete</a> 
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
        <a href="createAccount.jsp" class="btn btn-outline-primary">Create New Account</a>

        <%
            }
        %>
        
         <%
            }
        %> 
    </body>

</html>