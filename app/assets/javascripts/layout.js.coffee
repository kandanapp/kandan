$(document).ready ->
  $('.nav-toggle').click ->
    $('body').removeClass('slide-left')
    $('body').toggleClass('slide-right')
    false

  $('.sidebar-toggle').click ->
    $('body').removeClass('slide-right')
    $('body').toggleClass('slide-left')
    false

  $('.user-menu-toggle').click ->
    $('.user-header').toggleClass('open-menu')
    false

  $('.user-menu a').click ->
    $('.user-header').removeClass('open-menu')

  $('.search .query')
    .on 'focus', ->
      $(this).closest('.nav').addClass('search-focus')
    .on 'blur', ->
      $(this).closest('.nav').removeClass('search-focus')

  $.fn.hasScrollBar = ->
    (if @get(0) then @get(0).scrollHeight > @innerHeight() else false)
