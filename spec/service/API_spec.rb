require "rails_helper"
require 'json_expressions/rspec'
RSpec.describe "poker", type: :request do
  context "result method" do
    it"200を返す" do
      expect(response).to eq(200)
    end
    it "return poker" do
      first_params={ cards: ["H1 H13 H12 H11 H10", "H7 S6 C5 C4 C3", "H1 H13 H12 H11 H10"] }

      expect_result=
        {"result"=>[{"result"=>"フラッシュ", "score"=>5, "cards"=>"H1 H13 H12 H11 H10", "best"=>true}, {"result"=>"ストレート", "score"=>4, "cards"=>"H7 S6 C5 C4 C3", "best"=>false}, {"result"=>"フラッシュ", "score"=>5, "cards"=>"H1 H13 H12 H11 H10", "best"=>true}]}
      post "/api/poker",first_params
      body = JSON.parse(response.body)
      expect(body).to eq (expect_result)
    end
    it "return poker" do

      second_params={ cards: ["H1 H13 H12 H11 H10", "H7 H6 H5 H8 H3", "H1 H13 H12 H11 H10"] }

      expect_result=
        {"result"=>[{"result"=>"フラッシュ", "score"=>5, "cards"=>"H1 H13 H12 H11 H10", "best"=>true}, {"result"=>"フラッシュ", "score"=>5, "cards"=>"H7 H6 H5 H8 H3", "best"=>true}, {"result"=>"フラッシュ", "score"=>5, "cards"=>"H1 H13 H12 H11 H10", "best"=>true}]}
      post "/api/poker",second_params
      body = JSON.parse(response.body)
      expect(body).to eq (expect_result)

    end
    it "return poker" do
      third_params={ cards: ["H1 H133 H12 H11 H10", "H7 H6 H5 H8 H3", "H1 H13 H12 H11 H10"] }

      expect_result=
        {"result"=>[{"error"=>"半角大文字英語のスート(H,D,S,C)と数字（1~13)で記入してください","error2"=>"2番目のカードの指定文字が不正です(H133)", "cards"=>"H1 H133 H12 H11 H10"}, {"result"=>"フラッシュ", "score"=>5, "cards"=>"H7 H6 H5 H8 H3", "best"=>true}, {"result"=>"フラッシュ", "score"=>5, "cards"=>"H1 H13 H12 H11 H10", "best"=>true}]}
      post "/api/poker",third_params
      body = JSON.parse(response.body)
      expect(body).to eq (expect_result)
    end
  end

end


