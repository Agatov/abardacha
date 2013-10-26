$ ->

  $('.feature-case').bind 'mouseover', ->
    $('.feature-case').removeClass('active')
    $(@).addClass('active')

    $('.feature-image').removeClass('active')
    $(".feature-image[rel=#{$(@).attr('target')}]").addClass('active')


  $('#first-button').bind 'click', ->
    console.log '123'
    $("body").animate({ scrollTop: $('.last-offer').offset().top }, "slow")