# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.comment-show').click ->
    $block = $(this).parents('.comments-block').find('.comments-area')
    if $block.is(':visible')
      $block.slideUp()
    else
      $block.slideDown()