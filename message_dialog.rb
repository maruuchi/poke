module MessageDialog

  puts <<~text

    ----------------------------------
    |                                |
    |        バトル スタート !！     | 
    |                                |
    ----------------------------------

  text

  def attack_message(**params)
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃"
    puts "ひっかく攻撃！" if attack_type == "normal_attack"
    puts "電気攻撃！" if attack_type == "special_attack"
    
  end

  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts <<~EOS

    #{target.name}は#{damage}のダメージを受けた！
    #{target.name}の残りHPは#{target.hp}になった！

    EOS
  end

  def end_message(result)
    if result[:pika_win_flag]
      puts <<~EOS

      ピカは戦いに勝利した！！

    ----------------------------------
    |                                |
    |            勝利 !!!            |
    |                                |
    ----------------------------------

      EOS
    else
      puts <<~EOS

      ピカは戦いに負けた！

    ----------------------------------
    |                                |
    |             敗北 ...           |
    |                                |
    ----------------------------------

      EOS
    end
  end

  def transform_message(**params)
    origin_name = params[:origin_name]
    transform_name = params[:transform_name]

    puts <<~EOS

    #{origin_name}の残りHPが少ない！
    おや？#{origin_name}の様子が...！？

    

    #{origin_name}は#{transform_name}に進化した!

    EOS
  end
end