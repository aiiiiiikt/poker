require "rails_helper"

RSpec.describe Hand::HomeController, type: :controller do

  describe 'GET #top' do
    it "get top template" do
      get "top"
      expect(response).to render_template(:top)
    end
  end
  context "result method" do

    it "split at space" do
      post :result, { cards: "C7 C6 C5 C4 C3" }
      expect(controller.instance_variable_get(:@result)).to eq "ストレートフラッシュ"
      expect(response).to render_template(:top)
    end

    it "split at space" do
      post :result, { cards: "C10 D10 H10 S10 S1" }
      expect(controller.instance_variable_get(:@result)).to eq "フォーオブアカインド"
      expect(response).to render_template(:top)
    end

    it "split at space" do
      post :result, { cards: "C7 S7 S5 H5 D5" }
      # hand = Hand.new(@input).result
      expect(controller.instance_variable_get(:@result)).to eq "フルハウス"
      expect(response).to render_template(:top)
    end

    it "split at space" do
      post :result, { cards: "H1 H12 H10 H5 H3" }
      expect(controller.instance_variable_get(:@result)).to eq "フラッシュ"
      expect(response).to render_template(:top)
    end

    it "split at space" do
      post :result, { cards: "S1 S2 S3 S4 D5" }
      # hand = Hand.new(@input).result
      expect(controller.instance_variable_get(:@result)).to eq "ストレート"
      expect(response).to render_template(:top)
    end

    it "split at space" do
      post :result, { cards: "C7 D7 H7 S6 C3" }
      expect(controller.instance_variable_get(:@result)).to eq "スリーオブアカインド"
      expect(response).to render_template(:top)
    end

    it "split at space" do
      post :result, { cards: "H2 S2 H3 S3 D4" }
      # hand = Hand.new(@input).result
      expect(controller.instance_variable_get(:@result)).to eq "ツーペア"
      expect(response).to render_template(:top)
    end

    it "split at space" do
      post :result, { cards: "S7 C7 C5 H4 D3" }
      expect(controller.instance_variable_get(:@result)).to eq "ワンペア"
      expect(response).to render_template(:top)
    end

    it "split at space" do
      post :result, { cards: "C8 C6 D5 S4 C1" }
      expect(controller.instance_variable_get(:@result)).to eq "ハイカード"
      expect(response).to render_template(:top)
    end

  end

  context "error method" do
    it "error" do
      post :result, { cards: "C6 C6 D5 S4 C1" }
      expect(controller.instance_variable_get(:@put_error)).to eq "カードが重複しています"
      expect(response).to render_template(:top)
    end

    it "error" do
      post :result, { cards: "C6 C63 D5 S4 C1" }
      expect(controller.instance_variable_get(:@put_error)).to eq "半角大文字英語のスート(H,D,S,C)と数字（1~13)で記入してください, 2番目のカードの指定文字が不正です(C63)"
      expect(response).to render_template(:top)
    end

    it "error" do
      post :result, { cards: "C6 C6 D5 S4 C1 C2" }
      expect(controller.instance_variable_get(:@put_error)).to eq "5つのカード指定文字を半角スペースで区切り入力してください（例）H3 S3 D4 D12 S1"
      expect(response).to render_template(:top)
    end
    it "error" do
      post :result, { cards: "" }
      expect(controller.instance_variable_get(:@put_error)).to eq "カードを入力してください"
      expect(response).to render_template(:top)
    end
  end
end


# post :result,params: {cards:"C7 C6 C5 C4 C3"}
# # hand = HomeController.new("C7 C6 C5 C4 C3")
# expect(assigns(:result)).to eq "ストレートフラッシュ"
#     it "split at space" do

#     end
#     it "split at space" do
#       hand = HomeController.new("C7 D7 H7 S6 C3")
#       expect(hand.result).to eq "スリーオブアカインド"
#
#     end
#     it "split at space" do
#       hand = HomeController.new("H2 S2 H3 S3 D4")
#       expect(hand.result).to eq "ツーペア"
#     end
#     it "split at space" do
#       hand = HomeController.new("C7 S7 C5 H4 D3")
#       expect(hand.result).to eq "ワンペア"
#     end
#     it "split at space" do
#       hand = HomeController.new("C8 C6 D5 S4 C1")
#       expect(hand.result).to eq "ハイカード"
#     end
#
#
#   end
#
#
# context "error method" do
#


