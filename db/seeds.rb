# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

#Criação de rankings
row = 1
max_row = 1
current_row = 0
Player.all.each_with_index.map do |player, index|
  row += 1 and max_row += 1 and current_row = 0 if current_row >= max_row
  Ranking.create player: player, league: league, position: player.id, row: row
  current_row += 1
end