module API
  module Ver1
    class Poker < Grape::API
      format :json
      resource :poker do
        # GET /api/ver1/poker
        desc 'ポーカーの役を返す'
        # prefix 'poker/'
        post do

          #   入力したデータを受け取る
          @cards = params[:cards]

          array2 = []
          # エラーの場合はエラーを表示。
          @cards.each do |card|

            @error = Hand.new(card).error
            if @error.present?
              @resultall = @error
              # エラーでない場合は結果を表示
            else
              @resultall = Hand.new(card).result
            end
            @resultall["cards"] = card
            array2 << @resultall
          end
          array1 = []
          #結果の中からスコアだけを取り出す

          array2.each do |card|
            unless card["error"].present?
              @cardnumber = card["cards"]
              @results    = Hand.new(@cardnumber).result[:score]
              array1 << @results
            end
          end
          #スコアが最高のものを出す
          @max    = array1.max
          @scoree = array2.each do |card|
            unless card["error"].present?
              # スコアが最高のものにtrueをつける
              if card[:score] == @max
                card["best"] = true
              else
                card["best"] = false
              end
            end
          end

          hash = { "result" => array2 }
          return hash

        end
      end
    end
  end
end








