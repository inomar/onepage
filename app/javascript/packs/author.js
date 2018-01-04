// iconアップロード時に画像名を表示
$(document).on('change', '.js-imageUpload', () => {
  const $file = $('.js-imageUpload');
  const $input = $('.js-imageUploadText')
  const label = $file[0].files[0].name;
  $input.val(label);
});