<%-- 
    Document   : cart
    Created on : Feb 23, 2019, 6:23:59 AM
    Author     : lendle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script
            src="https://code.jquery.com/jquery-3.3.1.js"
        ></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.7/dist/vue.js"></script>
        <script>
            var v=null;
            $(document).ready(function(){
                $.ajax("webapi/items", {
                    success: function(items){
                        v=new Vue({
                            el: "#items",
                            data: {
                                "items": items
                            },
                            methods:{
                                edit: function(item){
                                    window.location.href="editCart.jsp?item="+item.product;
                                },
                                remove: function(item){
                                    window.location.href="deleteCart.jsp?item="+item.product;
                                }
                            }
                        });
                    }
                });
            });
            function addCart(){
                window.location.href="addCart.jsp";
            }
        </script>
    </head>
    <body>
        <button onclick="addCart();">NEW</button>
        <div id="items">
            <table border="1" style="width: 90%">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Unit Price</th>
                        <th>Amount</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in items">
                        <td>{{item.product}}</td>
                        <td>{{item.unitPrice}}</td>
                        <td>{{item.amount}}</td>
                        <td><button v-on:click="edit(item);">EDIT</button>
                            <button v-on:click="remove(item);">DELETE</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
