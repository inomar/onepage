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
