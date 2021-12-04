require './character'

class Pika < Character

  Crash_attack = 2

  def attack(nya)
    # puts "#{@name}の攻撃"

    attack_type = decision_attack_type

    damage = calculate_damage(target: nya, attack_type: attack_type)

    cause_damage(target: nya, damage: damage)

    # attack_messageの呼び出し
    attack_message(attack_type: attack_type)

    # damage_messageの呼び出し
    damage_message(target: nya, damage: damage)

    # puts "#{nya.name}の残りHPは#{nya.hp}になった"
  end

  private

    def decision_attack_type
      attack_num = rand(3)

      if attack_num == 0
        # puts "電気攻撃"
        "special_attack"
      else attack_num == 1
        # puts "タックル攻撃"
        "normal_attack"
      end
    end

    def calculate_damage(**params)
      target = params[:target]
      attack_type = params[:attack_type]

      if attack_type == "special_attack"
        calculate_special_attack - target.defense
      else attack_type == "normal_attack"
        @offense - target.defense
      end
    end

    def cause_damage(**params)
      damage = params[:damage]
      target = params[:target]

      target.hp -= damage

      target.hp = 0 if target.hp < 0

      # puts "#{target.name}は#{damage}のダメージを受けた"
    end

    def calculate_special_attack
      @offense * Crash_attack
    end

end