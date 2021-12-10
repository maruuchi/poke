# character.rbを読み込む：Characterクラスが使えるようになる
require './pika'
require './nya'
require './games_controller'

games_controller = GamesController.new

pika = Pika.new(name: "ピカ", hp: 300, offense: 50, defense: 10)
nya = Nya.new(name:"ニャー", hp: 170, offense: 30, defense: 20)

games_controller.battle(pika: pika, nya: nya)