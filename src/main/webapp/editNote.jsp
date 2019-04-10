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
            var v = null;
            $(document).ready(function () {
                $.ajax("webapi/note/<%=request.getParameter("id")%>", {
                    success: function (note) {
                        v = new Vue({
                            el: "#note",
                            data: {
                                "note": note
                            },
                            methods: {
                                save: function (note) {
                                    $.ajax("webapi/note", {
                                        type: "PUT",
                                        contentType: "application/json",
                                        data: JSON.stringify(note),
                                        success: function(){
                                            window.location.href="index.jsp";
                                        },
                                        error: function(){
                                            alert("fail!");
                                        }
                                    });
                                }
                            }
                        });
                    }
                });
            });
        </script>
    </head>
    <body>
        <div id="note">
            ID: {{note.id}}<br/>
            Title: <input type="text" v-model="note.title"/><br/>
            Content:<br/>
            <textarea v-model="note.content"></textarea>
            <button v-on:click="save(note);">SAVE</button>
        </div>
    </body>
</html>
