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
          # エラーの場合はエラーを表示。
           @result_array = []
          # @result_all={}
          @cards.each do |card|
            @result_all = {}
            hand_card = Hand.new(card)
            empty_card = hand_card.validation_empty_card
            validation_number_of_cards = hand_card.number_of_cards
            validation_card = hand_card.validation
            # 空欄の場合はエラーを返す
            if empty_card.present?
              @result_all["error"] = empty_card

            elsif validation_number_of_cards.present?
              @result_all["error"]  = validation_number_of_cards
            elsif validation_card.present?
              @result_all["error"]  = validation_card
              # エラーでない場合は結果を表示
            else
              @result_all = hand_card.result
            end
            @result_all["cards"] = card
            @result_array << @result_all
          end
          score_array = []
          #結果の中からスコアだけを取り出す
          @result_array.each do |card|
            unless card["error"].present?
              card_number = card["cards"]
              results    = Hand.new(card_number).result[:score]
              score_array << results
            end
          end
          #スコアが最高のものを出す
          max_score    = score_array.max
          @result_array.each do |card|
            unless card["error"].present?
              # スコアが最高のものにtrueをつける
              if card[:score] == max_score
                card["best"] = true
              else
                card["best"] = false
              end
            end
          end

          hash = { result: @result_array }
          return hash

        end
      end
    end
  end
end







