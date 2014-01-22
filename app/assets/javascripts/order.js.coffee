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

    parent_form = $(@).parent()

    if parent_form.attr('type') == 'modal-form'
      hide_modal_form(true)
      show_thank_you()
    else
      window.show_thank_you_with_overlay()


    name.val('')
    phone.val('')

    yaCounter22346590.reachGoal('new_order')

    false


  $('#first-button').on 'click', ->

    $('.modal-overlay').unbind 'click'
    $('.modal-overlay').on 'click', ->
      hide_modal_form()

    show_modal_form()



window.show_modal_form = ->
  $('.modal-overlay').show()
  $('.modal-overlay').animate({'opacity': '0.8'}, 300, ->

    $('.modal-dialog').css('right', '-500px')
    $('.modal-dialog').css('top', '50%')
    $('.modal-dialog').show()
#    $('.modal-dialog').animate {'right': '50%'}, 500
  )

window.hide_modal_form = (with_overlay = false) ->
  $('.modal-dialog').animate {'top': '-2000px'}, 300, ->
    $('.modal-dialog').hide()

    unless with_overlay
      $('.modal-overlay').animate {'opacity': '0'}, 100, ->
      $('.modal-overlay').hide()


# @todo - отрефакторить этот ужас
window.show_thank_you_with_overlay = ->

  $('.modal-overlay').show()
  $('.modal-overlay').animate({'opacity': '0.8'}, 300, ->

    $('.modal-thank-you').css('right', '-500px')
    $('.modal-thank-you').css('top', '50%')
    $('.modal-thank-you').show()
    $('.modal-thank-you').animate {'right': '50%'}, 500

    $('.modal-overlay').bind 'click', ->
      window.hide_thank_you()

  )

window.show_thank_you = ->
  $('.modal-thank-you').css('right', '-500px')
  $('.modal-thank-you').css('top', '50%')
  $('.modal-thank-you').show()
  $('.modal-thank-you').animate {'right': '50%'}, 500


window.hide_thank_you = ->

  $('.modal-thank-you').animate {'top': '-2000px'}, 500, ->
    $('.modal-thank-you').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()

window.hideFormErrors = ->
  $('input').attr 'style', ''

