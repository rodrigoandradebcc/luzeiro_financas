# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


c = Company.new(id: 1, name: "Luzeiro Navegação")
c.save
cc = ChartOfAccount.new(id: 1, title: "Balanço Patrimonial", company: c)

cc.save
# Primeiro Nível
at1 = AccountType.new(name: "Ativo", id: 1, code: 1, chart_of_account: cc)
at2 = AccountType.new(name: "Passivo", id: 2, code: 2, chart_of_account: cc)
at3 = AccountType.new(name: "Receita", id: 3, code: 3, chart_of_account: cc)
at4 = AccountType.new(name: "Despesas", id: 4, code: 4, chart_of_account: cc)

at1.save
at2.save
at3.save
at4.save

# Segundo Nível
acc1 = Account.new(name: "Circulante", id: 1, code: 1, account_type: at1)
acc2 = Account.new(name: "Patrimônio", id: 2, code: 2, account_type: at1)
acc3 = Account.new(name: "Circulante", id: 3, code: 1, account_type: at2)
acc4 = Account.new(name: "Patrimônio Líquido", id: 4, code: 2, account_type: at2)
acc1.save
acc2.save
acc3.save
acc4.save
# Terceiro Nível
sin1 = SyntheticAccount.new(id: 1, name: "Disponível", code: 1, account: acc1 )
sin2 = SyntheticAccount.new(id: 2, name: "Realizável a Curto Prazo", code: 2, account: acc1 )
sin3 = SyntheticAccount.new(id: 3, name: "Imobilizado Técnico", code: 1, account: acc2)
sin4 = SyntheticAccount.new(id: 4, name: "Exigível", code: 1, account: acc3)
sin5 = SyntheticAccount.new(id: 5, name: "Credores Diversos", code: 2, account: acc3)
sin6 = SyntheticAccount.new(id: 6, name: "Capital", code: 1, account: acc4 )
sin7 = SyntheticAccount.new(id: 7, name: "Lucros / Prejuizos Acumulados", code: 2, account: acc4 )

sin1.save
sin2.save
sin3.save
sin4.save
sin5.save
sin6.save
sin7.save
# Quarto Nível
anal1 = AnalyticAccount.new(id: 1, name:"Caixa", code: 1, synthetic_account: sin1 )
anal2 =AnalyticAccount.new(id: 2, name:"Bancos", code: 2, synthetic_account: sin1 )
anal3 =AnalyticAccount.new(id: 3, name:"Estoque de Materiais", code: 1, synthetic_account: sin2 )
anal4 =AnalyticAccount.new(id: 4, name:"Contas a receber", code: 2, synthetic_account: sin2 )
anal5 = AnalyticAccount.new(id: 5, name:"Móveis e utensilios", code: 1, synthetic_account: sin3 )
anal6 = AnalyticAccount.new(id: 6, name:"Instalações", code: 2, synthetic_account: sin3 )
anal7 = AnalyticAccount.new(id: 7, name:"Maquinas e Equipamentos", code: 3, synthetic_account: sin3 )
anal8 = AnalyticAccount.new(id: 8, name:"Imoveis", code: 4, synthetic_account: sin3 )
anal9 = AnalyticAccount.new(id: 9, name:"Obrigações Sociais", code: 1, synthetic_account: sin4 )
anal10 = AnalyticAccount.new(id: 10, name:"Obrigações Tributarias", code: 2, synthetic_account: sin4 )
anal11= AnalyticAccount.new(id: 11, name:"Fornecedores", code: 1, synthetic_account: sin5 )
anal12 = AnalyticAccount.new(id: 12, name:"Financiamentos", code: 2, synthetic_account: sin5 )
anal13 = AnalyticAccount.new(id: 13, name:"Capital Social", code: 1, synthetic_account: sin6 )
anal14 = AnalyticAccount.new(id: 14, name:"Reserva de Capital", code: 2, synthetic_account: sin6 )
anal15 = AnalyticAccount.new(id: 15, name:"Sócios c/aumento de capital", code: 3, synthetic_account: sin6 )
anal16 = AnalyticAccount.new(id: 16, name:"Result.exercs anteriores", code: 1, synthetic_account: sin7 )
anal17 = AnalyticAccount.new(id: 17, name:"Resultado do exercicio", code: 2, synthetic_account: sin7 )

anal1.save
anal2.save
anal3.save
anal4.save
anal5.save
anal6.save
anal7.save
anal8.save
anal9.save
anal10.save
anal11.save
anal12.save
anal13.save
anal14.save
anal15.save
anal16.save
anal17.save