require "rails_helper"
require 'json_expressions/rspec'
RSpec.describe "poker", type: :request do
  context "result method" do


    it "カードを入力したら、何らか出力されるか" do
      first_params = { cards: ["H1 H13 H12 H11 H10", "H7 S6 C5 C4 C3", "D1 H13 H1 S1 H10"] }

      expect_result =
        { "result" => [{ "result" => "フラッシュ", "score" => 5, "cards" => "H1 H13 H12 H11 H10", "best" => true }, { "result" => "ストレート", "score" => 4, "cards" => "H7 S6 C5 C4 C3", "best" => false }, { "result" => "スリーオブアカインド", "score" => 3, "cards" => "D1 H13 H1 S1 H10", "best" => false }] }
      post "/api/poker", first_params
      body = JSON.parse(response.body)
      expect(body).to eq (expect_result)
    end
    it "役の強さが最も強いものには、trueがついている" do

      second_params = { cards: ["H10 S10 H12 S12 D10", "H7 H6 H5 H8 S13", "H1 H13 H12 H11 H10"] }

      expect_result =
        { "result" => [{ "result" => "フルハウス", "score" => 6, "cards" => "H10 S10 H12 S12 D10", "best" => true }, { "result" => "ハイカード", "score" => 0, "cards" => "H7 H6 H5 H8 S13", "best" => false }, { "result" => "フラッシュ", "score" => 5, "cards" => "H1 H13 H12 H11 H10", "best" => false }] }
      post "/api/poker", second_params
      body = JSON.parse(response.body)
      expect(body).to eq (expect_result)

    end
    it "半角英数以外で入力している時にエラーが出る" do
      third_params = { cards: ["H1 H133 H12 H11 H10", "H10 S10 H11 S12 D11", "H1 H13 H12 H11 H10"] }

      expect_result =
        { "result" => [{ "error" => "半角大文字英語のスート(H,D,S,C)と数字（1~13)で記入してください", "error2" => "2番目のカードの指定文字が不正です(H133)", "cards" => "H1 H133 H12 H11 H10" }, { "result" => "ツーペア", "score" => 2, "cards" => "H10 S10 H11 S12 D11", "best" => false }, { "result" => "フラッシュ", "score" => 5, "cards" => "H1 H13 H12 H11 H10", "best" => true }] }
      post "/api/poker", third_params
      body = JSON.parse(response.body)
      expect(body).to eq (expect_result)
    end
  end

end


