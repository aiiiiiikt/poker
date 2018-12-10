class HomeController < ApplicationController
  def top


  end


  def result
    error
    if @error.present?
      return @error

    end
    render("home/top")
    @cards = params[:cards]
    #半角スペースで区切って取り出す
    @cardList = @cards.split

    #英語と数字に分けて英語を認識する
    @suits = @cardList.map {|x| x.split(//, 2)}.map(&:first).sort
    #英語と数字に分けて、数字を認識する
    @numbers = @cardList.map {|x| x.split(//, 2)}.map(&:last).map(&:to_i).sort

    @kazu = @numbers.uniq

    #小さい順に数字に名付ける
    v1 = @numbers[0]
    v2 = @numbers[1]
    v3 = @numbers[2]
    v4 = @numbers[3]
    v5 = @numbers[4]

    # 数字が5つ連続している
    if @cardList.count == 5
      if (v5 - v4) == 1 && (v4 - v3) == 1 && (v3 - v2) == 1 && (v2 - v1) == 1
        # マークが全て同じ
        @marks = @suits.uniq
        if @marks.count == 1

          @result = "ストレートフラッシュ"
          # マークが全て同じではない
        else
          @result = "ストレート"

        end

        #同じ数字のカードが4枚（フォーオブアカインド）
      elsif
        # 数字が2種類
      @kazu.count == 2
        # （28888，22228）
        if v2 == v3 && v3 == v4
          @result = "フォーオブアカインド"

          # 同じ数字のカードが3枚残りの二枚も同じ数字（22888,22288)
        else
          @result = "フルハウス"
        end
        #   同じ数字のカードが三枚残りの二枚のカードは違う数字（22278,27778,27888)
      elsif @kazu.count == 3
        if ((v1 == v2 && v2 == v3) || (v2 == v3 && v3 == v4) || (v3 == v4 && v4 == v5))
          @result = "スリーオブアカインド"

          # 同じ数字のカードが二組（22778,27788,22788)　
        else
          # 　残りの三枚のうち2枚が同じ数字（ツーペア）
          @result = "ツーペア"
        end
      elsif @kazu.count == 4
        @result = "ワンペア"
      elsif @marks = @suits.uniq
        @marks.count == 1
        @result = "フラッシュ"
      else
        @result = "ハイカード"

      end
    end

    render("home/top")


  end

  def error
    @cards = params[:cards]
    #半角スペースで区切って取り出す
    @cardList = @cards.split
    # 2つの塊が5つ以外で構成されている場合（
    if @cardList.count != 5

      @error = "5つのカード指定文字を半角スペースで区切り入力してください
  （例）H3 S3 D4 D12 S1"

    end

    # render ("home/top")

    #   カードが重複している場合
    @Duplication = @cardList.uniq
    if @Duplication.count != 5
      @error = "カードが重複しています"
    end




    # 半角大文字英数以外が使われている場合

    if !(@cards=~/[SHCD]([1-9]|1[0-3])\s[SHCD]([1-9]|1[0-3])\s[SHCD]([1-9]|1[0-3])\s[SHCD]([1-9]|1[0-3])\s[SHCD]([1-9]|1[0-3])\z/)
      @error ="半角大文字英語のスート(H,D,S,C)と数字（1~13)で記入してください"
    end





  end


end
