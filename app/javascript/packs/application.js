/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import BookCover from './book_cover'

console.log('Hello World from Webpacker')
$('.js-authorMenu .item').tab();

$(document).on('click', '.js-openSidebar', () => {
  $('.js-sidebar').sidebar('toggle');
})
$('.dropdown').dropdown();
$('.js-postMenu .item').tab();

$('.js-navMenu').popup(
    {
        hoverable  : true,
        position   : 'bottom left',
        delay: {
            show: 300,
            hide: 300
        }
    }
);
$('.js-headerOverlay')
    .visibility({
        type   : 'fixed',
        once       : false,
        continuous : true,
        onPassing  : function(calculations) {
            const newColor = 'rgba(255, 255, 255, ' + calculations.percentagePassed +')';
            $(this).css('background-color', newColor);
        }
    })
;
$('.js-fadeInImage')
    .visibility({
        type       : 'image',
        transition : 'fade in',
        duration   : 1000
    })
;