$ ->

  setIntroHeight()

  $(window).resize ->
    setIntroHeight()



setIntroHeight = ->
  $('#intro').css('height', "#{$(document).height()}px")