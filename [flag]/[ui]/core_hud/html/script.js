var animating = false;
var usingvoice = false;
var usingid = false;
var usingstress = false;
var anim = false;
var armardura = false;

function toggleMapUI(visable) {

    if (visable) {
       /* $("#pu203").fadeIn('slow',function(){
            $(this).animate({'left': '+=22.5vh'},'slow');
          });
        fade(document.getElementById("u203"));*/
        $("#u203").fadeIn('slow',function(){
            $(this).animate({'left': '+=20.0vh'},'slow');
          });
        fade(document.getElementById("u203"));
        if (armardura == true) {
            $("#armor").fadeIn('slow',function(){
                $(this).animate({'left': '+=10.0vh'},'slow');
              });
            fade(document.getElementById("armor"));
        } else {
            $("#armor").fadeIn('slow',function(){
                $(this).animate({'left': '+=10.0vh'},'slow');
              });
        }
        $("#u222").fadeIn('slow',function(){
            $(this).animate({'left': '+=20.0vh'},'slow');
          });
        $("#u225").fadeIn('slow',function(){
            $(this).animate({'left': '+=14.0vh'},'slow');
            $(this).animate({'bottom': '+=20px'},'slow');
          });
        $("#u230").fadeIn('slow',function(){
           $(this).animate({'left': '+=8.0vh'},'slow');
           $(this).animate({'bottom': '+=40px'},'slow');
        });
       /* $("#u228").fadeIn('slow',function(){
            $(this).animate({'left': '+=2.0vh'},'slow');
            $(this).animate({'bottom': '+=70px'},'slow');
        });*/
    } else {
       /* $("#pu203").fadeIn('slow',function(){
            $(this).animate({'left': '2.5vh'},'slow');
          });
        unfade(document.getElementById("u203"));*/       
        $("#u203").fadeIn('slow',function(){
            $(this).animate({'left': '0vh'},'slow');
          });
        unfade(document.getElementById("u203"));
        if (armardura == true) {
            $("#armor").fadeIn('slow',function(){
                $(this).animate({'left': '0vh'},'slow');
                $(this).animate({'bottom': '0px'},'slow'); 
              });
            unfade(document.getElementById("armor"));
        } else {
            $("#armor").fadeIn('slow',function(){
                $(this).animate({'left': '0vh'},'slow');
                $(this).animate({'bottom': '0px'},'slow'); 
              });
        }
        $("#u222").fadeIn('slow',function(){
            $(this).animate({'left': '0vh'},'slow');
          });
        $("#u225").fadeIn('slow',function(){
            $(this).animate({'left': '0vh'},'slow');
            $(this).animate({'bottom': '0px'},'slow'); 
          });
        $("#u230").fadeIn('slow',function(){
            $(this).animate({'left': '0vh'},'slow');
            $(this).animate({'bottom': '0px'},'slow');
        });
        /*$("#u228").fadeIn('slow',function(){
            $(this).animate({'left': '0vh'},'slow');
            $(this).animate({'bottom': '55%'},'slow');
        });*/
    }
}

function fade(element) {
    var op = 1;  // initial opacity
    var timer = setInterval(function () {
        if (op <= 0.1){
            clearInterval(timer);
            //element.style.display = 'none';
            element.style.visibility = 'hidden';
        }
        element.style.opacity = op;
        element.style.filter = 'alpha(opacity=' + op * 100 + ")";
        op -= op * 0.20;
    }, 50);
}

function unfade(element) {
    var op = 0.1;  // initial opacity
    //element.style.display = 'block';
    element.style.visibility = 'visible';
    var timer = setInterval(function () {
        if (op >= 1){
            clearInterval(timer);
        }
        element.style.opacity = op;
        element.style.filter = 'alpha(opacity=' + op * 100 + ")";
        op += op * 0.1;
    }, 10);
}

function unfade2(element) {
    var op = 0.1;  // initial opacity
    //element.style.display = 'block';
    element.style.visibility = 'visible';
    var timer = setInterval(function () {
        if (op >= 1){
            clearInterval(timer);
        }
        element.style.opacity = op;
        element.style.filter = 'alpha(opacity=' + op * 100 + ")";
        op += op * 0.4;
    }, 10);
}


/*function changeProgress(progress, element) {
    var changed = Math.round(130 - (progress * 1.2));
    var element = $(element).find(".progress")
    if (String(Math.round(parseInt(element[0].style.top))).replace("%", "") != String(changed) && !animating) {
        animating = true;

        element.animate({
            top: changed + '%'

        }, 500, "swing", function () {
            animating = false;

        });
    }
}

function changeProgress2(progress, element) {
    var changed = Math.round(130 - (progress * 1.2));
    var element = $(element).find(".progress2")
    if (String(Math.round(parseInt(element[0].style.top))).replace("%", "") != String(changed) && !animating) {
        animating = true;

        element.animate({
            top: changed + '%'

        }, 500, "swing", function () {
            animating = false;

        });
    }
}


function changeProgress3(progress, element) {
    var changed = Math.round(130 - (progress * 1.2));
    var element = $(element).find(".progress3");

    if (String(Math.round(parseInt(element[0].style.right))).replace("%", "") != String(changed) && !animating) {
        animating = true;

        element.animate({
            right: changed + '%'

        }, 500, "swing", function () {
            animating = false;

        });
    }
}*/

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}


$(document).ready(function () {
    $("#main_container").hide();
});

window.addEventListener('message', function (event) {
    var edata = event.data;

    if (edata.type == "Init") {
        $("#main_container").show();

       if (edata.showstress) {
            usingstress = true;
        }
        if (edata.showvoice) {
            usingvoice = true;
        }

    
        //$(".health").find(".logo").addClass(edata.healthIcon);
        //$(".armor").find(".logo").addClass(edata.armorIcon);
        //$(".food").find(".logo").addClass(edata.foodIcon);
        //$(".thirst").find(".logo").addClass(edata.thirstIcon);
        //$(".fourth").find(".logo").addClass(edata.fourthIcon);
        //$("#u228").addClass('firstColor');
        //fade(document.getElementById("u228"));

    } else if (edata.type == "changeStatus") {

        //changeProgress3(edata.health, ".health");
        //changeProgress(edata.armor, ".armor");
        //changeProgress(edata.food, ".food");
        //changeProgress2(edata.thirst, ".thirst");
        var boxHeal = document.getElementById("boxHeal");
        var boxArmor = document.getElementById("boxArmor");
        var boxFood = document.getElementById("boxFood");
        var boxThirst = document.getElementById("boxThirst");
        var boxStress = document.getElementById("boxStress");

        //boxHeal.css("width", (event.data.health - 100) + "%");
        boxHeal.style.width = (event.data.health) + "%";
        if (event.data.armor == 0) {
            //boxArmor.css("opacity", "0%");
            //document.getElementById('armor').css({'opacity': "0%"})
            boxArmor.style.opacity = "0%";
            document.getElementById('armor').style.opacity = "0%";
            armardura = false
        } else {
            //boxArmor.css("opacity", "100%");
            //document.getElementById('armor').css({'opacity': "100%"})
            document.getElementById('armor').style.opacity = "100%";
            boxArmor.style.opacity = "100%";
            armardura = true
        }

        boxArmor.style.width = event.data.armor + "%";
        boxFood.style.width = event.data.food + "%";
        boxThirst.style.width = event.data.thirst + "%";
        boxStress.style.width = event.data.stress + "%";
        //boxFood.css("width", (event.data.food) + "%");
        //boxThirst.css("width", (event.data.thirst) + "%");
        //boxStress.css("width", (event.data.stress) + "%");

       /* var element = document.getElementById("logoMicro");

        if (element.className === "fas fa-lg "+edata.iconG) {

        } else {
            unfade2(document.getElementById("u228"));
            setTimeout (() => { 
                element.classList.remove("fa-volume-up");
                element.classList.remove("fa-volume-off");
                element.classList.remove("fa-volume-down");
                element.classList.remove("fa-broadcast-tower")
                element.classList.add(edata.iconG);
            }, 50);
            sleep(4000).then(() => { fade(document.getElementById("u228")); });
        }*/

    } else if (edata.type == "closeMapUI") {
        toggleMapUI(false);
    } else if (edata.type == "openMapUI") {
        toggleMapUI(true);
    } else if (edata.type == "hideUI") {
        $("#main_container").hide();
    } else if (edata.type == "showUI") {
        $("#main_container").show();
    } else if (edata.type == "toggleTalking") {
       /* var elem1 = document.getElementById("u228");
        if (edata.talking && usingvoice) {
            $("#u228").removeClass('firstColor').addClass('secondColor');
            unfade2(document.getElementById("u228"));
            //elem1.style.backgroundColor = '#0075149e';
            //elem1.style.borderColor = '#32f54c';    
            elem1.style.borderColor = '#b9b9b9';
        } else {
            $("#u228").removeClass('secondColor').addClass('firstColor');
            //elem1.style.backgroundColor = '#7500009e';
            //elem1.style.borderColor = '#f53232';
            elem1.style.borderColor = '#000000'; 
            sleep(2000).then(() => { fade(document.getElementById("u228")); });
        }*/
    }
});