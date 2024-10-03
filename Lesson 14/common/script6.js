let text;
switch (new Date().getDay()) {
    case 3:
        text="Đầu tuần";
        break;
    case 0:
    text="Cuối tuần";
    break;
    default:
        text="Tôi không biết"
    break;
}
document.getElementById("demo").innerHTML=text;