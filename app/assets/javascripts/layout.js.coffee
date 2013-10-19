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
