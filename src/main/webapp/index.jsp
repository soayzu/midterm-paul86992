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
                $.ajax("webapi/notes", {
                    success: function(notes){
                        v=new Vue({
                            el: "#notes",
                            data: {
                                "notes": notes
                            },
                            methods:{
                                edit: function(note){
                                    window.location.href="editNote.jsp?id="+note.id;
                                },
                                remove: function(note){
                                    $.ajax("webapi/note/"+note.id, {
                                        type: "DELETE",
                                        success: function(){
                                            window.location.href="index.jsp";
                                        },
                                        error: function(){
                                            alert("failed");
                                        }
                                    });
                                }
                            }
                        });
                    }
                });
            });
            function addNote(){
                window.location.href="addNote.jsp";
            }
        </script>
    </head>
    <body>
        <button onclick="addNote();">NEW</button>
        <div id="notes">
            <table border="1" style="width: 90%">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Content</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="note in notes">
                        <td>{{note.id}}</td>
                        <td>{{note.title}}</td>
                        <td>{{note.content}}</td>
                        <td><button v-on:click="edit(note);">EDIT</button>
                            <button v-on:click="remove(note);">DELETE</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
