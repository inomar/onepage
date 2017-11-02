/* eslint no-console:0 */

import 'tag-it'

$('select').dropdown();

$(document).ready(function() {
    const $tagHidden = $('.js-tagHidden');
    $('.tag-it').tagit(
        {
            fieldName:   'page[tag_list]',
            singleField: true
        }
    );
    if($tagHidden != null) {
        const tags = $tagHidden.val().split(' ')
        console.log(tags)
        for(var i = 0; i < tags.length; i++) {
            $('.tag-it').tagit('createTag', tags[i])
        }
    }

});

$(() => {
  const size = $(window).height();
  $(".js-pageStory").css("height", size + "px");
});
$(() => {
    const size = $(window).height();
    $(".js-pageStory").css("height", size + "px");
});

$(document).on('click', '.js-imageModal', () => {
  $('.js-modal').modal('show');
})

$('.ui.search').search({
  showNoResults: true,
  searchOnFocus: false,
  apiSettings: {
    url: '/pages/search_image?q={query}',
      onResponse: function(response) {
        $.each(response, (index, item) => {
            const $img = $('<img>', {
                src: ''
            });
            const $link = $('<a></a>', {
                href: '',
                addClass: 'ui small rounded image image__fit js-setBookCover'
            });
            $('.js-responseImages').append($link.html($img.attr('src', item.image)))
        })
      }
  },
  minCharacters : 3
  })
;

$(document).on('click', '.js-setBookCover', (e) => {
    const $target = $(e.currentTarget);
    console.log($target.attr('src'));
})
