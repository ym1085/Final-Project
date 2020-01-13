/*
 * 
 *공연 정보에 사용되는 javascript
 * 
 */

$(document).foundation();

$(function() {
  $('.button-like')
    .bind('click', function(event) {
      $(".button-like").toggleClass("liked");
    })
});
