# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Role.new(name: "Administrador", code: 1)
func = Role.new(name: "Funcionário", code: 2)

admin.save
func.save

u = User.new(username: "luzeiro", password: "luzeiroadmin123", email: "luzeiro@luzeiro.com",password_confirmation:"luzeiroadmin123", role: Role.find_by({code: 1}))
u.save
u = User.new(username: "edu",email: "edu@luzeiro.com", password: "luzeiro123", password_confirmation:"luzeiro123", role: Role.find_by({code: 2}))
u.save
u = User.new(username: "marcia",email: "marcia@luzeiro.com", password: "marcia123", password_confirmation:"marcia123", role: Role.find_by({code: 2}))
u.save
c = Company.new(id: 1, name: "Luzeiro Navegação")
c.save
cc = ChartOfAccount.new(id: 1, title: "Balanço Patrimonial", company: c)

cc.save
# Primeiro Nível
at1 = AccountType.new(name: "Ativo", id: 1, code: 1, chart_of_account: cc)
at2 = AccountType.new(name: "Passivo", id: 2, code: 2, chart_of_account: cc)
at3 = AccountType.new(name: "Receita", id: 3, code: 3, chart_of_account: cc)
at4 = AccountType.new(name: "Custo", id: 4, code: 4, chart_of_account: cc)
at5 = AccountType.new(name: "Despesa", id: 5, code: 5, chart_of_account: cc)

at1.save
at2.save
at3.save
at4.save
at5.save

# Segundo Nível
acc1 = Account.new(name: "Circulante", id: 1, code: 1, account_type: at1)
acc2 = Account.new(name: "Patrimônio", id: 2, code: 2, account_type: at1)
acc3 = Account.new(name: "Circulante", id: 3, code: 1, account_type: at2)
acc4 = Account.new(name: "Patrimônio Líquido", id: 4, code: 2, account_type: at2)
acc5 = Account.new(name: "Receitas Operacionais", id: 5, code: 1, account_type: at3)
acc6 = Account.new(name: "Custos Gerais", id: 6, code: 1, account_type: at4)
acc7 = Account.new(name: "Despesas Administrativas Geral", id: 7, code: 1, account_type: at5)

acc1.save
acc2.save
acc3.save
acc4.save
acc5.save
acc6.save
acc7.save

# Terceiro Nível
sin1 = SyntheticAccount.new(id: 1, name: "Disponível", code: 1, account: acc1 )
sin2 = SyntheticAccount.new(id: 2, name: "Realizável a Curto Prazo", code: 2, account: acc1 )
sin3 = SyntheticAccount.new(id: 3, name: "Imobilizado Técnico", code: 1, account: acc2)
sin4 = SyntheticAccount.new(id: 4, name: "Exigível", code: 1, account: acc3)
sin5 = SyntheticAccount.new(id: 5, name: "Credores Diversos", code: 2, account: acc3)
sin6 = SyntheticAccount.new(id: 6, name: "Capital", code: 1, account: acc4 )
sin7 = SyntheticAccount.new(id: 7, name: "Lucros / Prejuizos Acumulados", code: 2, account: acc4 )
sin8 = SyntheticAccount.new(id: 8, name: "Vendas", code: 1, account: acc5 )
sin9 = SyntheticAccount.new(id: 9, name: "Financeiras", code: 2, account: acc5 )
sin10 = SyntheticAccount.new(id: 10, name: "Outras Receitas Op", code: 3, account: acc5 )
sin11 = SyntheticAccount.new(id: 11, name: "N/M LUZEIRO", code: 1, account: acc6 )
sin12 = SyntheticAccount.new(id: 12, name: "N/M LUZEIRO", code: 1, account: acc7 )

sin13 = SyntheticAccount.new(id: 13, name: "Clientes", code: 2, account: acc1 )
sin14 = SyntheticAccount.new(id: 14, name: "Bancos Conta Movimento", code: 3, account: acc1 )
sin15 = SyntheticAccount.new(id: 15, name: "Bancos Aplicações Financeiras", code: 4, account: acc1 )
sin16 = SyntheticAccount.new(id: 16, name: "Estoque", code: 5, account: acc1 )
sin17 = SyntheticAccount.new(id: 17, name: "Adiantamento", code: 6, account: acc1 )

sin1.save
sin2.save
sin3.save
sin4.save
sin5.save
sin6.save
sin7.save
sin8.save
sin9.save
sin10.save
sin11.save
sin12.save
sin13.save
sin14.save
sin15.save
sin16.save
sin17.save


# Quarto Nível
scd1 = SecondSyntheticAccount.new(id: 1, name:"Caixa", code: 1, synthetic_account: sin1 )
scd2 =SecondSyntheticAccount.new(id: 2, name:"Bancos", code: 2, synthetic_account: sin1 )
scd3 =SecondSyntheticAccount.new(id: 3, name:"Estoque de Materiais", code: 1, synthetic_account: sin2 )
scd4 =SecondSyntheticAccount.new(id: 4, name:"Contas a receber", code: 2, synthetic_account: sin2 )
scd5 = SecondSyntheticAccount.new(id: 5, name:"Móveis e utensilios", code: 1, synthetic_account: sin3 )
scd6 = SecondSyntheticAccount.new(id: 6, name:"Instalações", code: 2, synthetic_account: sin3 )
scd7 = SecondSyntheticAccount.new(id: 7, name:"Maquinas e Equipamentos", code: 3, synthetic_account: sin3 )
scd8 = SecondSyntheticAccount.new(id: 8, name:"Imoveis", code: 4, synthetic_account: sin3 )
scd9 = SecondSyntheticAccount.new(id: 9, name:"Obrigações Sociais", code: 1, synthetic_account: sin4 )
scd10 = SecondSyntheticAccount.new(id: 10, name:"Obrigações Tributarias", code: 2, synthetic_account: sin4 )
scd11= SecondSyntheticAccount.new(id: 11, name:"Fornecedores", code: 1, synthetic_account: sin5 )
scd12 = SecondSyntheticAccount.new(id: 12, name:"Financiamentos", code: 2, synthetic_account: sin5 )
scd13 = SecondSyntheticAccount.new(id: 13, name:"Capital Social", code: 1, synthetic_account: sin6 )
scd14 = SecondSyntheticAccount.new(id: 14, name:"Reserva de Capital", code: 2, synthetic_account: sin6 )
scd15 = SecondSyntheticAccount.new(id: 15, name:"Sócios c/aumento de capital", code: 3, synthetic_account: sin6 )
scd16 = SecondSyntheticAccount.new(id: 16, name:"Result.exercs anteriores", code: 1, synthetic_account: sin7 )
scd17 = SecondSyntheticAccount.new(id: 17, name:"Resultado do exercicio", code: 2, synthetic_account: sin7 )
#ativo contas que faltaram
scd18 = SecondSyntheticAccount.new(id: 18, name:"Contas a Receber-clientes Belém ", code: 1, synthetic_account: sin13 )
scd19 = SecondSyntheticAccount.new(id: 19, name:"Contas a Receber-clientes Muanã ", code: 2, synthetic_account: sin13 )
scd20 = SecondSyntheticAccount.new(id: 20, name:"Belém", code: 1, synthetic_account: sin14 )
scd21 = SecondSyntheticAccount.new(id: 21, name:"Muanã", code: 2, synthetic_account: sin14 )
scd22 = SecondSyntheticAccount.new(id: 22, name:"Belém", code: 1, synthetic_account: sin15 )
scd23 = SecondSyntheticAccount.new(id: 23, name:"Muanã", code: 2, synthetic_account: sin15 )
scd24 = SecondSyntheticAccount.new(id: 24, name:"N/M LUZEIRO", code: 1, synthetic_account: sin16 )
scd25 = SecondSyntheticAccount.new(id: 25, name:"Muanã", code: 2, synthetic_account: sin16 )
scd26 = SecondSyntheticAccount.new(id: 26, name:"Funcionarios", code: 1, synthetic_account: sin17 )
#--------------------------------------------------------------------------------------------------------------------------
#receita
scd27 = SecondSyntheticAccount.new(id: 27, name:"Á Vista", code: 1, synthetic_account: sin8 )
scd28 = SecondSyntheticAccount.new(id: 28, name:"Á Prazo", code: 2, synthetic_account: sin8 )
scd29 = SecondSyntheticAccount.new(id: 29, name:"Alugueis e arrendamentos", code: 1, synthetic_account: sin10 )
scd30 = SecondSyntheticAccount.new(id: 30, name:"Derivados de Petróleo", code: 1, synthetic_account: sin11 )
scd31 = SecondSyntheticAccount.new(id: 31, name:"Custos com Material", code: 2, synthetic_account: sin11 )
scd32 = SecondSyntheticAccount.new(id: 32, name:"Custos de serviços prestados", code: 3, synthetic_account: sin11 )
scd33 = SecondSyntheticAccount.new(id: 33, name:"Despesas com vendas", code: 1, synthetic_account: sin12 )
scd34 = SecondSyntheticAccount.new(id: 34, name:"Despesas Administrativas", code: 2, synthetic_account: sin12 )
scd35 = SecondSyntheticAccount.new(id: 35, name:"Despesas Tributarias", code: 3, synthetic_account: sin12 )
scd36 = SecondSyntheticAccount.new(id: 36, name:"Despesas Financeiras", code: 4, synthetic_account: sin12 )
scd37 = SecondSyntheticAccount.new(id: 37, name:"Despesas não Operacionais", code: 5, synthetic_account: sin12 )

scd1.save
scd2.save
scd3.save
scd4.save
scd5.save
scd6.save
scd7.save
scd8.save
scd9.save
scd10.save
scd11.save
scd12.save
scd13.save
scd14.save
scd15.save
scd16.save
scd17.save
scd18.save
scd19.save
scd20.save
scd21.save
scd22.save
scd23.save
scd24.save
scd25.save
scd26.save
scd27.save
scd28.save
scd29.save
scd30.save
scd31.save
scd32.save
scd33.save
scd34.save
scd35.save
scd36.save
scd37.save

#contas analiticas
 anal1 = AnalyticAccount.new(id: 1, name:"Caixa-Escritorio/NM-LUZEIRO", code: 1, second_synthetic_account: scd1 )
 anal2 = AnalyticAccount.new(id: 2, name:"Caixa-Escritorio/Muanã", code: 2, second_synthetic_account: scd1 )
 anal3 = AnalyticAccount.new(id: 3, name:"Banco Do Brasil", code: 1, second_synthetic_account: scd20 )
 anal4 = AnalyticAccount.new(id: 4, name:"Bradesco", code: 2, second_synthetic_account: scd20 )
 anal5 = AnalyticAccount.new(id: 5, name:"Banco Do Brasil", code: 1, second_synthetic_account: scd22 )
 anal6 = AnalyticAccount.new(id: 6, name:"Bradesco", code: 2, second_synthetic_account: scd22 )
 anal7 = AnalyticAccount.new(id: 7, name:"CMF", code: 1, second_synthetic_account: scd26 )
 anal8 = AnalyticAccount.new(id: 8, name:"MFC", code: 2, second_synthetic_account: scd26 )
 anal9 = AnalyticAccount.new(id: 9, name:"MFM", code: 3, second_synthetic_account: scd26 )
 anal10 = AnalyticAccount.new(id: 10, name:"MAC", code: 4, second_synthetic_account: scd26 )
 anal11 = AnalyticAccount.new(id: 11, name:"Receita de prestação de serviço de passagem", code: 1, second_synthetic_account: scd27 )
 anal12 = AnalyticAccount.new(id: 12, name:"Receita de prestação de serviço de frete", code: 2, second_synthetic_account: scd27 )
 anal13 = AnalyticAccount.new(id: 13, name:"Receita de venda de produtos", code: 3, second_synthetic_account: scd27 )
 anal14 = AnalyticAccount.new(id: 14, name:"Receita de venda de mercadorias", code: 4, second_synthetic_account: scd27 )
 anal15 = AnalyticAccount.new(id: 15, name:"Receita de prestação de serviço de passagem", code: 1, second_synthetic_account: scd28 )
 anal16 = AnalyticAccount.new(id: 16, name:"Receita de prestação de serviço de frete", code: 2, second_synthetic_account: scd28 )
 anal17 = AnalyticAccount.new(id: 17, name:"Receita de venda de produtos", code: 3, second_synthetic_account: scd28 )
 anal18 = AnalyticAccount.new(id: 18, name:"Receita de venda de mercadorias", code: 4, second_synthetic_account: scd28 )
 anal19 = AnalyticAccount.new(id: 19, name:"Oleo Diesel", code: 1, second_synthetic_account: scd30 )
 anal20 = AnalyticAccount.new(id: 20, name:"Lubrificantes", code: 2, second_synthetic_account: scd30 )
 anal21 = AnalyticAccount.new(id: 21, name:"Impressos c/passagem-fretes", code: 1, second_synthetic_account: scd31 )
 anal22 = AnalyticAccount.new(id: 22, name:"Carregador", code: 1, second_synthetic_account: scd32 )
 anal23 = AnalyticAccount.new(id: 23, name:"Comissão Vendas", code: 1, second_synthetic_account: scd33 )
 anal24 = AnalyticAccount.new(id: 24, name:"Propaganda e publicidade", code: 2, second_synthetic_account: scd33 )
 anal25 = AnalyticAccount.new(id: 25, name:"Honorarios da Diretoria", code: 1, second_synthetic_account: scd34 )
 anal26 = AnalyticAccount.new(id: 26, name:"Salarios Ordenados", code: 2, second_synthetic_account: scd34 )
 anal27 = AnalyticAccount.new(id: 27, name:"Encargos Sociais", code: 3, second_synthetic_account: scd34 )
 anal28 = AnalyticAccount.new(id: 28, name:"Indenizações e aviso prévio", code: 4, second_synthetic_account: scd34 )
 anal29 = AnalyticAccount.new(id: 29, name:"Contador", code: 5, second_synthetic_account: scd34 )
 anal30 = AnalyticAccount.new(id: 30, name:"Serviço prestado por Terceiros", code: 6, second_synthetic_account: scd34 )
 anal31 = AnalyticAccount.new(id: 31, name:"Manutenção e Reparo", code: 7, second_synthetic_account: scd34 )
 anal32 = AnalyticAccount.new(id: 32, name:"Material de Expediente", code: 8, second_synthetic_account: scd34 )
 anal33 = AnalyticAccount.new(id: 33, name:"Conservação e Limpeza", code: 9, second_synthetic_account: scd34 )
 anal34 = AnalyticAccount.new(id: 34, name:"Seguros", code: 10, second_synthetic_account: scd34 )
 anal35 = AnalyticAccount.new(id: 35, name:"Energia eletrica", code: 11, second_synthetic_account: scd34 )
 anal36 = AnalyticAccount.new(id: 36, name:"Comunicação", code: 12, second_synthetic_account: scd34 )
 anal37 = AnalyticAccount.new(id: 37, name:"Despesas com Alimentação", code: 13, second_synthetic_account: scd34 )
 anal38 = AnalyticAccount.new(id: 38, name:"Despesas Diversas", code: 14, second_synthetic_account: scd34 )
 anal39 = AnalyticAccount.new(id: 39, name:"Tributos Federais", code: 1, second_synthetic_account: scd35 )
 anal40 = AnalyticAccount.new(id: 40, name:"Tributos Estaduais", code: 2, second_synthetic_account: scd35 )
 anal41 = AnalyticAccount.new(id: 41, name:"Tributos Municipais", code: 3, second_synthetic_account: scd35 )
 anal42 = AnalyticAccount.new(id: 42, name:"Desconto a Clientes", code: 1, second_synthetic_account: scd36 )
 anal43 = AnalyticAccount.new(id: 43, name:"Juros Multas Comissões bancarias", code: 2, second_synthetic_account: scd36 )
 anal44 = AnalyticAccount.new(id: 44, name:"Juros Tributarios", code: 3, second_synthetic_account: scd36 )
 anal45 = AnalyticAccount.new(id: 45, name:"Multas Tributarias", code: 4, second_synthetic_account: scd36 )
 anal46 = AnalyticAccount.new(id: 46, name:"Ajustes Monetarios", code: 5, second_synthetic_account: scd36 ) 
 anal47 = AnalyticAccount.new(id: 47, name:"Perdas com Clientes Duvidosos", code: 1, second_synthetic_account: scd37 )
 anal48 = AnalyticAccount.new(id: 48, name:"Perdas com Equipamentos", code: 2, second_synthetic_account: scd37 )

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
anal18.save
anal19.save
anal20.save
anal21.save
anal22.save
anal23.save
anal24.save
anal25.save
anal26.save
anal27.save
anal28.save
anal29.save
anal30.save
anal31.save
anal32.save
anal33.save
anal34.save
anal35.save
anal36.save
anal37.save
anal38.save
anal39.save
anal40.save
anal41.save
anal42.save
anal43.save
anal44.save
anal45.save
anal46.save
anal47.save
anal48.save


