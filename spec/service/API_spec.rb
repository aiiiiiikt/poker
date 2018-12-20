# require "rails_helper"
#
# RSpec.describe "poker", type: :request do
#   context "result method" do
#
#     it "return poker" do
#       post "/api/poker",{cards:["H1 H13 H12 H11 H10","H7 S6 C5 C4 C3","H1 H13 H12 H11 H10]}
#       body = JSON.parse(response.body)
#       expect(body).to eq("result"=>(:result=>"フラッシュ", :score=>5, "cards"=>"H1 H13 H12 H11 H10", "best"=>false), (:result=>"ストレート", :score=>4, "cards"=>"H7 S6 C5 C4 C3", "best"=>false), (:result=>"フラッシュ", :score=>5, "cards"=>"H1 H13 H12 H11 H10", "best"=>false)
#     end
#   end
# end
# end

require "rails_helper"
require "json"
RSpec.describe "poker", type: :request do
  context "result method" do
    it "return poker" do
      post"/api/poker",{"cards":["H1 H13 H12 H11 H10","H7 S6 C5 C4 C3","H1 H13 H12 H11 H10"]}
      body= JSON.parse(response.body)
      expect(body).to eq("result"=>[:result =>"フラッシュ", :score=>5, "cards"=>"H1 H13 H12 H11 H10", "best"=>false, :result　=>"ストレート", :score=>4, "cards"=>"H7 S6 C5 C4 C3", "best"=>false, :result=>"フラッシュ", :score=>5, "cards"=>"H1 H13 H12 H11 H10", "best"=>false])


    end

  end

end
