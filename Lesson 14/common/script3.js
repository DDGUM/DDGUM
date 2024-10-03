const time = new Date().getHours;
let greeting;
if(time<10){
    greeting="Goodmorning";
}else if(time<20){
    greeting="Goodday";
}else{
    greeting="GoodEcenning";
}
document.getElementById("demo").innerHTML=greeting;