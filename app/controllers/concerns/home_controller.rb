class HomeController < ApplicationController
  def top

  end

  def result
    @cards = params[:cards]
    @hand_card=Hand.new(@cards)
    validation_empty
    render("home/top") and return if @validation_empty.present?
    validation_number_of_cards
    render("home/top") and return if @validation_number_of_cards.present?
    validations
    render("home/top") and return if @validations_result.present?
    outcome = @hand_card.result
    @result  = outcome[:result]
    render("home/top")
  end

  def validation_empty
    @validation_empty=@hand_card.validation_empty_card
  end

  def validation_number_of_cards
    @validation_number_of_cards=@hand_card.number_of_cards
  end

  def validations
    @validations_result = @hand_card.validation
  end

end










