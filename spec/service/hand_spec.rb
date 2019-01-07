require "rails_helper"

RSpec.describe Hand, :type => :model do
  context "result method" do

    it "result_test" do
      hand = Hand.new("C7 C6 C5 C4 C3")
      expect(hand.result).to eq(:result => "ストレートフラッシュ", :score => 8)

    end

    it "result_test" do
      hand = Hand.new("S10 H10 D10 S4 H4")
      expect(hand.result).to eq(:result => "フルハウス", :score => 6)

    end
    it "result_test" do
      hand = Hand.new("S5 H2 D1 S4 H3")
      expect(hand.result).to eq(:result => "ストレート", :score => 4)

    end
    it "result_test" do
      hand = Hand.new("H1 H12 H10 H5 H3")
      expect(hand.result).to eq(:result => "フラッシュ", :score => 5)

    end
    it "result_test" do
      hand = Hand.new("C10 D10 H10 S10 S1")
      expect(hand.result).to eq(:result => "フォーオブアカインド", :score => 7)

    end
    it "result_test" do
      hand = Hand.new("S10 H10 D10 S5 H4")
      expect(hand.result).to eq(:result => "スリーオブアカインド", :score => 3)

    end
    it "result_test" do
      hand = Hand.new("S3 H10 D10 S4 H4")
      expect(hand.result).to eq(:result => "ツーペア", :score => 2)

    end
  end

  context "error method" do
    it "result_error" do
      hand = Hand.new("H10 H10 D1 S2 H5")
      expect(hand.validation).to eq("カードが重複しています")
    end

    it "result_error" do
      hand = Hand.new("S10 H10 D1 S2 H")
      expect(hand.validation).to eq("半角大文字英語のスート(H,D,S,C)と数字（1~13)で記入してください。5番目のカードの指定文字が不正です(H)")

    end

    it "result_error" do
      hand = Hand.new("S10 H10 D1 S2 H5 H2")
      expect(hand.number_of_cards).to eq("5つのカード指定文字を半角スペースで区切り入力してください（例）H3 S3 D4 D12 S1")

    end
  end
end


