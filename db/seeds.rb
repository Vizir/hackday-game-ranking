# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Player.create ([{:email => 'admin@player.com', :password => 'vizir123', :password_confirmation => 'vizir123', :username => 'Admin'}])
league = League.create name: "Liga Padrão"

Player.create [
  {email: 'diego@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Diego Nakamashi', username: 'nakamashi'},
  {email: 'fabricio@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Fabricio Campos', username: 'fabricio'},
  {email: 'antonio@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Antonio Anderson', username: 'antonio'},
  {email: 'tiago@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Tiago de Assis Gonçalves', username: 'tiago'},
  {email: 'vitor@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Vitor Margis', username: 'vitor'},
  {email: 'andre@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'André Pantalião', username: '12345678'},
  {email: 'ricardo.georgel@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Ricardo Georgel', username: 'argentino'},
  {email: 'david@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'David Lojudice Sobrinho', username: 'david'},
  {email: 'daniel@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Daniel Arthaud', username: 'daniel'},
  {email: 'paulo@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Paulo Felisbino', username: 'paulo'},
  {email: 'ricardo@vizir.com.br', password: '12345678', password_confirmation: '12345678', name: 'Ricardo Zambelli', username: 'zambelli'}
]

Player.all.each do |player|
  Ranking.create player: player, league: league, position: player.id
end

league = League.create ({:name => "Vizir League" })

g = Game.create ([{:player1 => Player.first, :player2 => Player.last,  :player1_score => 5, :player2_score => 2, :league => league }])
