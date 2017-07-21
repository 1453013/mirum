


// external js: flickity.pkgd.js





// $(".carousel").swipe({

//   swipe: function(event, direction, distance, duration, fingerCount, fingerData) {

//     if (direction == 'left') $(this).carousel('next');
//     if (direction == 'right') $(this).carousel('prev');

//   },
//   allowPageScroll:"vertical"

// });




// var el = document.querySelector('.swiper-main');

// Ps.initialize(el,{
//     wheelSpeed: 0.5,
//     // suppressScrollX:false,
//     // suppressScrollY:false,
//     onReachEnd: function(el) {
//         console.log('sw1');
//       //callback function code here
//     }
// });


// Ps.update(el);

$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });

});

//  $(window).scroll(function() {   
//    if($(window).scrollTop() + $(window).height() == $(document).height()) {
//        //$('#mySideBar').addClass('toolow');

//        var element = document.getElementById("mySideBar");
//         element.classList.add("toolow"); 
//    }
// });

$('.portfolio-item-slider').on('init', function(event, slick, currentSlide){
  var nrCurrentSlide = slick.currentSlide + 1, // din cauza ca e array si incepe de la 0
      totalSlidesPerPage = nrCurrentSlide + 4; // daca ai 5 thumb-uri pe pagina pui + 4
  $('.controls').html(nrCurrentSlide + " - " + totalSlidesPerPage + " of " + slick.slideCount);
});

$('.portfolio-thumb-slider').slick({
  slidesToShow: 5,
  slidesToScroll: 1,
  asNavFor: '.portfolio-item-slider',
  arrows: false,
  focusOnSelect: true,
  infinite: false,
  //prevArrow: $('.slick-prev'),
  //nextArrow: $('.next'),
  prevArrow:"<img class='a-left control-c prev slick-prev' src='../traning/js/left-arrow.png'>",
  nextArrow:"<img class='a-right control-c next slick-next' src='../traning/js/right-arrow.png'>"
});

$('.portfolio-item-slider').slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: true,
  asNavFor: '.portfolio-thumb-slider',
  infinite: false,
  prevArrow:"<img class='a-left control-c prev slick-prev' src='../traning/js/left-arrow.png'>",
  nextArrow:"<img class='a-right control-c next slick-next' src='../traning/js/right-arrow.png'>"
});

var current = 0; // current slider dupa refresh
$('.portfolio-thumb-slider .slick-slide:not(.slick-cloned)').eq(current).addClass('slick-current');
$('.portfolio-item-slider').on('afterChange', function(event, slick, currentSlide, nextSlide){
  current = currentSlide;
  $('.portfolio-thumb-slider .slick-slide').removeClass('slick-current');
  $('.portfolio-thumb-slider .slick-slide:not(.slick-cloned)').eq(current).addClass('slick-current');
  var nrCurrentSlide = slick.currentSlide + 1, // din cauza ca e array si incepe de la 0
      totalSlidesPerPage = nrCurrentSlide + 4; // daca ai 5 thumb-uri pe pagina pui + 4

  if(totalSlidesPerPage > slick.slideCount) {
    $('.controls').html(nrCurrentSlide + " - " + slick.slideCount + " of " + slick.slideCount);
  } else {
    $('.controls').html(nrCurrentSlide + " - " + totalSlidesPerPage + " of " + slick.slideCount);
  }

  console.log(current);
  console.log(totalSlidesPerPage);

});

//$("#mySideBar").stick_in_parent();


 $('.slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    speed: 50,
     cssEase: 'linear',
    dots: true,
    centerMode: true,
    asNavFor: '.slider-nav'
});
$('.slider-nav').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    asNavFor: '.slider-for',
    arrows: false,
    dots: false,
    centerMode: true,
    focusOnSelect: true,
    //autoplay: true,
});