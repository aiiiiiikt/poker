class HomeController < ApplicationController
  # def initialize(card)
  #   @cards = card
  # end

  def top

  end

  def result
    @cards = params[:cards]
    error
    render("home/top") and return if @put_error.present?
    @outcome = Hand.new(@cards).result
    @result = @outcome[:result]


    render("home/top")


  end

  def error
    p '@cards'
    p @cards
    @card_error = Hand.new(@cards).error

    @lasterror = @card_error.values
    @put_error = @lasterror.join(", ")


  end
end










