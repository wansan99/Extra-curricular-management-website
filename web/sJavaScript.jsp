<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 13/7/2020
  Time: 12:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    document.querySelector(".header .buttons .user").addEventListener("click",
        function(){
            this.classList.toggle("active");
        });
</script>

<script>
    document.querySelector(".header .buttons .notification").addEventListener("click",
        function(){
            this.classList.toggle("active");
        });
</script>

<script>
    var mini = true;

    function toggleSidebar() {
        if (mini) {
            console.log("opening sidebar");
            document.getElementById("mySidebar").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
            this.mini = false;
        } else {
            console.log("closing sidebar");
            document.getElementById("mySidebar").style.width = "85px";
            document.getElementById("main").style.marginLeft = "85px";
            this.mini = true;
        }
    }
</script>

<script src="https://kit.fontawesome.com/01129367d3.js"></script>
