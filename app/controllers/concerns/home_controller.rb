class HomeController < ApplicationController

  def top

  end

  def result
    @cards = params[:cards]
    error
    render("home/top") and return if @put_error.present?
    @outcome = Hand.new(@cards).result
    @result  = @outcome[:result]


    render("home/top")


  end

  def error
    @card_error = Hand.new(@cards).error

    @lasterrors = @card_error.values
    @put_error = @lasterrors.join(", ")
  end
end










