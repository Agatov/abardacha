$ ->

  $('.feature-case').bind 'mouseover', ->
    $('.feature-case').removeClass('active')
    $(@).addClass('active')

    $('.feature-image').removeClass('active')
    $(".feature-image[rel=#{$(@).attr('target')}]").addClass('active')