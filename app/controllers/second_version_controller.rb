class SecondVersionController < ApplicationController

  layout 'second'

  def index
    if params[:r]
      section = params[:r]
    else
      section = "stranica_zahvata"
    end

    @first_word = I18n.t "titles.#{section}.first"
    @last_word = I18n.t "titles.#{section}.last"

  end
end