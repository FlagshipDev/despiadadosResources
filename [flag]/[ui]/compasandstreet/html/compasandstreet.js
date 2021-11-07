this.console.log('streetandcompas JS loaded');
$(function(){
    window.addEventListener("message", function(event){   
        if(event.data.action == 'setStreetName'){
            $('.streetname').text(event.data.streetname);
        } else if (event.data.action == 'false') {
            $('.streetname').text("");
        };
    });
});