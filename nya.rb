require './character'

class Nya < Character

  POWER_UP = 1.5
  HALF_HP = 0.5

  def initialize(**params)
    # オーバーライドとは「親クラスのメソッドを子クラスで上書きすること」
    super(
      name: params[:name],
      hp: params[:hp],
      offense: params[:offense],
      defense: params[:defense]
    )
    # nyaが変身したかどうかを判定するフラグ
    @transform_flag = false

    # 変身する際の閾値（トリガー）を計算
    @trigger_of_transform = params[:hp] * HALF_HP
  end

  def attack(pika)
    # HPが半分以下、かつ、nya変身判定フラグがfalseの時に実行
    if @hp <= @trigger_of_transform && @transform_flag == false
      # モンスター変身判定フラグにtrueを代入
      @transform_flag = true
      # 返信メソッドの実行
      transform
    end

    # puts "#{@name}の攻撃"

    damage = calculate_damage(pika)

    cause_damage(target: pika, damage: damage)

    # attack_messageの呼び出し
    attack_message(target: pika)

    damage_message(target: pika, damage: damage)

    # puts "#{pika.name}の残りHPは#{pika.hp}になった"
  end

  # クラス外から呼び出せないようにする
    private

      def calculate_damage(target)
        @offense - target.defense
      end

      def cause_damage(**params)
        target = params[:target]
        damage = params[:damage]

        target.hp -= damage

        target.hp = 0 if target.hp < 0

        # puts "#{target.name}は#{damage}の攻撃を受けた"
      end
      # 変身メソッドの定義
      def transform
        transform_name = "ペルー"

        # puts <<~EOS
        #{@name}は激怒した
        #{@name}は#{transform_name}に進化した
        # EOS
        transform_message(origin_name: @name, transform_name: transform_name)

        @offense *= POWER_UP
        @name = transform_name
      end

end
