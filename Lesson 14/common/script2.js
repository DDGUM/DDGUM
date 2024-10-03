const hour = new Date().getHours();
let gretting;
if(hour<18){
    gretting ="GoodDay";
}else{
    gretting="GoodEvening"
}
document.getElementById("demo").innerHTML=gretting