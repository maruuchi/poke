require './message_dialog'

class Character

  include MessageDialog
  # 値の取り出しのみ可能
  attr_reader :offense, :defense
  # 値の代入・取り出しが可能
  attr_accessor :hp, :name

  # 引数に**を記述：ハッシュしか受け取れなくなる
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end
