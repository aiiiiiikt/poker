require "rails_helper"

RSpec.describe Hand, :type => :model do
  context "result method" do
    it "split at space" do
      hand = Hand.new("C7 C6 C5 C4 C3")
      expect(hand.result).to eq "ストレートフラッシュ"
    end
    it "split at space" do
      hand = Hand.new("C10 D10 H10 S10 S1")
      expect(hand.result).to eq "フォーオブアカインド"
    end
    it "split at space" do
      hand = Hand.new("S10 H10 D10 S4 H4")
      expect(hand.result).to eq "フルハウス"
    end
    it "split at space" do
      hand = Hand.new("H1 H12 H10 H5 H3")
      expect(hand.result).to eq "フラッシュ"
    end
    it "split at space" do
      hand = Hand.new("S1 S2 S3 S4 D5 S6")
      expect(hand.result).to eq "ストレート"
    end
    it "split at space" do
      hand = Hand.new("C7 D7 H7 S6 C3")
      expect(hand.result).to eq "スリーオブアカインド"

    end
    it "split at space" do
      hand = Hand.new("H2 S2 H3 S3 D4")
      expect(hand.result).to eq "ツーペア"
    end
    it "split at space" do
      hand = Hand.new("C7 C7 C5 H4 D3")
      expect(hand.result).to eq "ワンペア"
    end
    it "split at space" do
      hand = Hand.new("C8 C6 D5 S4 C1")
      expect(hand.result).to eq "ハイカード"
    end


#      expect(hand.cardList[0]).to eq("S1")
#      expect(hand.cardList[1]).to eq("S2")
#      expect(hand.cardList[2]).to eq("S3")
#      expect(hand.cardList[3]).to eq("S4")
#      expect(hand.cardList[4]).to eq("S5")
  end
end

