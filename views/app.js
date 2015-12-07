var main = function() {
    $('.arrow-next').click(function(){
        var currentSlide = $('.active-slide');
        var nextSlide = currentSlide.next();
        currentSlide.fadeOut(600).removeClass('active-slide');
        nextSlide.fadeIn(600).addClass('active-slide');
    });
}

$(document).ready(main)