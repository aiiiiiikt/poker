module API
  module Ver1
    class Poker < Grape::API
      resource :poker do

        # GET /api/ver1/poker
        desc 'ポーカーの役を返す'
        # prefix 'poker/'

        post do

          #   入力したデータを受け取る
          @cards = params[:cards]

          array1 = []


          @cards.each do |card|
            @results = Hand.new(card).result[:score]


            array1 << @results

          end
          @max = array1.max


          #   # poker.rb？でもう一つベストのハッシュを作る
          #
          #
          #   # @resultとかで全部出す
          array = []

          @cards.each do |card|

            @resultall = Hand.new(card).result

            array << @resultall


          end

          @scoree = array.each do |score|


            if score[:score] == @max


              score["best"] = "true"

            else
              score["best"] = "false"

            end

          end

          hash={"result"=>array}

          return hash







          # maxを取り出す


          # マックスの数字に合うスコアのものをfindbyで取り出し、trueがつくようにする

          # array.each do |a|
          #
          #
          # end




          # データを加工して、homecontrollerが受け取れる形にする
          # コントローラに渡して、役をつける
          # 強さを判定する
          # 役とその強さを返す

        end
      end
    end
  end
end

