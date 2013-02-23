# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

league = League.create name: "Vizir League"

Player.create [
  {email: 'diego@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Diego Nakamashi', username: 'nakamashi', pictureUrl: ''},
  {email: 'fabricio@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Fabricio Campos', username: 'fabricio', pictureUrl: ''},
  {email: 'antonio@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Antonio Anderson', username: 'antonio', pictureUrl: ''},
  {email: 'tiago@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Tiago de Assis Gonçalves', username: 'tiago', pictureUrl: ''},
  {email: 'vitor@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Vitor Margis', username: 'vitor', pictureUrl: ''},
  {email: 'andre@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'André Pantalião', username: '12345678', pictureUrl: ''},
  {email: 'ricardo.georgel@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Ricardo Georgel', username: 'argentino', pictureUrl: ''},
  {email: 'david@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'David Lojudice Sobrinho', username: 'david', pictureUrl: ''},
  {email: 'daniel@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Daniel Arthaud', username: 'daniel', pictureUrl: ''},
  {email: 'paulo@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Paulo Felisbino', username: 'paulo', pictureUrl: ''},
  {email: 'ricardo@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Ricardo Zambelli', username: 'zambelli', pictureUrl: 'http://profile.ak.fbcdn.net/hprofile-ak-snc7/c20.20.256.256/s160x160/300271_184313231640090_4762926_n.jpg'}
]

#Criação de rankings
Player.all.each do |player|
  Ranking.create player: player, league: league, position: player.id
end

Game.create :player1 => Player.first, :player2 => Player.last,  :player1_score => 5, :player2_score => 2, :league => league