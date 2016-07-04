# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
a1 = AnalyticAccount.new(id:1, name: "Conta analítica 1", balance: 20)
a2 = AnalyticAccount.new(id:2, name: "Conta analítica 2", balance: 20)