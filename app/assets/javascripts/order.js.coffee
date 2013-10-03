$ ->
  $(document).bind 'click', ->
    hideFormErrors()


  $('#hide-thank-you').bind 'click', ->
    hide_thank_you()

  $('.send-order').bind 'click', ->
    name = $(@).parent().find('input[name=username]')
    if name.val().length < 2
      name.css 'border', '1px solid red'
      return false

    phone = $(@).parent().find('input[name=phone]')
    if phone.val().length < 7
      phone.css 'border', '1px solid red'
      return false

    $.post '/orders', {'order[username]': name.val(), 'order[phone]': phone.val()}, (data) =>

    $('.form-body').hide()
    $('.form-success').show()


    name.val('')
    phone.val('')

    window.show_thank_you()

    yaCounter22346590.reachGoal('new_order')

    false


window.show_thank_you = ->


  $('.modal-overlay').show()
  $('.modal-overlay').animate({'opacity': '0.8'}, 300, ->

    $('.modal-thank-you').css('right', '-500px')
    $('.modal-thank-you').css('top', '50%')
    $('.modal-thank-you').show()
    $('.modal-thank-you').animate {'right': '50%'}, 500

    $('.modal-overlay').bind 'click', ->
      window.hide_thank_you()


  )

window.hide_thank_you = ->

  $('.modal-thank-you').animate {'top': '-2000px'}, 500, ->
    $('.modal-thank-you').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()

window.hideFormErrors = ->
  $('input').attr 'style', ''

