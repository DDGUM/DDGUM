$(document).ready(function(){
    $("#HTML").click(function(){
        $("#HTML").css("background-color","red")
        $("#content").text("Html viết tắt HyperText Markup Language")
        $("#PHP,#CSS,#Jquery").css("background-color","#ccc");
    })

    $("#CSS").click(function(){
        $("#CSS").css("background-color","green")
        $("#content").text("Thay đổi cách hiển thị mặc định của thẻ HTML")
        $("#PHP,#HTML,#Jquery").css("background-color","#ccc");
    })

    $("#Jquery").click(function(){
        $("#Jquery").css("background-color","blue")
        $("#content").text("jquery là một thư viện của JavaScript")
        $("#PHP,#CSS,#HTML").css("background-color","#ccc");
    })

    $("#PHP").click(function(){
        $("#PHP").css("background-color","aqua")
        $("#content").text("PHP là một ngôn ngữ lập trình phía server")
        $("#HTML,#CSS,#Jquery").css("background-color","#ccc");
    })
})