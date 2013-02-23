# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

League.create name: "Vizir League"

Player.create [
  {email: 'diego@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Diego Nakamashi', username: 'nakamashi'},
  {email: 'fabricio@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Fabricio Campos', username: 'fabricio'},
  {email: 'antonio@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Antonio Anderson', username: 'antonio'},
  {email: 'tiago@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Tiago de Assis Gonçalves', username: 'tiago'},
  {email: 'vitor@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Vitor Margis', username: 'vitor'},
  {email: 'andre@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'André Pantalião', username: 'panta'},
  {email: 'ricardo.georgel@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Ricardo Georgel', username: 'argentino'},
  {email: 'david@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'David Lojudice Sobrinho', username: 'david'},
  {email: 'daniel@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Daniel Arthaud', username: 'daniel'},
  {email: 'paulo@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Paulo Felisbino', username: 'paulo'},
  {email: 'ricardo@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Ricardo Zambelli', username: 'zambelli'}
]

#Criação de rankings
Player.all.each do |player|
  Ranking.create player: player, league: League.first, position: player.id
end

Game.create :player1 => Player.first, :team1 => Team.first, :player2 => Player.last, :team2 => Team.last,  :player1_score => 5, :player2_score => 2, :league => League.first