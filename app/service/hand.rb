class Hand
  def initialize(card)
    @cards = card
  end

  def result
    #半角スペースで区切って取り出す

    @cardlist = @cards.split


    #英語と数字に分けて英語を認識する
    @suits = @cardlist.map {|x| x.split(//, 2)}.map(&:first).sort
    #英語と数字に分けて、数字を認識する
    @numbers = @cardlist.map {|x| x.split(//, 2)}.map(&:last).map(&:to_i).sort

    @kazu = @numbers.uniq
    @marks = @suits.uniq

    #小さい順に数字に名付ける
    v1 = @numbers[0]
    v2 = @numbers[1]
    v3 = @numbers[2]
    v4 = @numbers[3]
    v5 = @numbers[4]

    # 数字が5つ連続している
    if (v5 - v4) == 1 && (v4 - v3) == 1 && (v3 - v2) == 1 && (v2 - v1) == 1
      # マークが全て同じ

      if @marks.count == 1

        @result = { result: "ストレートフラッシュ", score: 8 }
        # マークが全て同じではない
      else
        @result = { result: "ストレート", score: 4 }

      end

      #同じ数字のカードが4枚（フォーオブアカインド）
    elsif
      # 数字が2種類
    @kazu.count == 2
      # （28888，22228）
      if v2 == v3 && v3 == v4
        @result = { result: "フォーオブアカインド", score: 7 }

        # 同じ数字のカードが3枚残りの二枚も同じ数字（22888,22288)
      else
        @result = { result: "フルハウス", score: 6 }
      end
      #   同じ数字のカードが三枚残りの二枚のカードは違う数字（22278,27778,27888)
    elsif @kazu.count == 3
      if ((v1 == v2 && v2 == v3) || (v2 == v3 && v3 == v4) || (v3 == v4 && v4 == v5))
        @result = { result: "スリーオブアカインド", score: 3 }

        # 同じ数字のカードが二組（22778,27788,22788)　
      else
        # 　残りの三枚のうち2枚が同じ数字（ツーペア）
        @result = { result: "ツーペア", score: 2 }
      end
    elsif @kazu.count == 4
      @result = { result: "ワンペア", score: 1 }
    elsif @marks.count==1
        @result = { result: "フラッシュ", score: 5 }
      else
        @result = { result: "ハイカード", score: 0 }
    end
    return @result
    end

  def validation_empty_card
    validation_empty = "カードを入力してください" if @cards.blank?
    return validation_empty
  end

  def number_of_cards
    @cardlist = @cards.split
    number_of_cards_message="5つのカード指定文字を半角スペースで区切り入力してください（例）H3 S3 D4 D12 S1"  if @cardlist.count != 5
    return number_of_cards_message
    end


  def validation
    @validations_array = []
    #半角スペースで区切って取り出す
    @cardlist = @cards.split
    #   カードが重複している場合
    duplication = @cardlist.uniq.size
    if duplication != 5
      validation_duplication="カードが重複しています"
      @validations_array<< validation_duplication
    end
    # 半角大文字英数以外が使われている場合
    index = 1
    if !(@cards =~ /[SHCD]([1-9]|1[0-3])\s[SHCD]([1-9]|1[0-3])\s[SHCD]([1-9]|1[0-3])\s[SHCD]([1-9]|1[0-3])\s[SHCD]([1-9]|1[0-3])\z/)
      errornumber = []
      errorcard   = []
      @cardlist.each do |card|
        if !(card =~ /[SHCD]([1-9]|1[0-3])\z/)
          errornumber << index
          errorcard << card

        end
        index += 1

      end
      numbers=errornumber.join(",")
      cards=errorcard.join(",")


      validation_card="半角大文字英語のスート(H,D,S,C)と数字（1~13)で記入してください。#{numbers}番目のカードの指定文字が不正です(#{cards})"
      @validations_array << validation_card
    end
    # @validation_message=@validations_array.join(",")
     @validations_array

  end
end

