$(document).ready ->
	$(".user_menu_link").click (e)->
      e.preventDefault()
      $(".user_menu").toggle()
      false