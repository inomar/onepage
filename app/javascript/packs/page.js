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

$(document).on('click', '', () => {
  $.ajax({
      url: '/',
      type
  })
})

function ajaxLike() {
  const xhr = $.ajax({
    type: 'POST',
    url: '/'
  });
  return xhr;
}
const getLike = ajaxLike();
getLike.done((response) => {
    $('#hoge').html(response);
});
getLike.fail((response) => {
    alert('えらぁ');
});
getLike.always((response) =>{
    alert('コンプリート');
});
