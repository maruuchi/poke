require './message_dialog'

class GamesController

  include MessageDialog

  def battle(**params)
    battle_characters(params)

    loop do
      # 処理
      @pika.attack(@nya)
      # 無限ループ終了のためのbreak
      break if battle_end?
      @nya.attack(@pika)
      break if battle_end?
    end

    battle_judgment

  end

  private

    def battle_characters(**params)
      @pika = params[:pika]
      @nya = params[:nya]
    end

    def battle_end?
      @pika.hp <= 0 || @nya.hp <= 0
    end

    def battle_win?
      @pika.hp > 0
    end


    def battle_judgment
      result = calculate_of_exp_and_gold

      end_message(result)
    end
    
    def calculate_of_exp_and_gold
      if battle_win?
        pika_win_flag = true
        # puts "#{@pika.name}は戦いに勝利した"
        # puts "#{@pika.name}は次のステージに進んだ"
      else
        pika_win_flag = false
        # puts "#{@pika.name}は戦いに敗北した"
        # puts "目の前が真っ暗になった"
      end


      {pika_win_flag: pika_win_flag}
    end

end
