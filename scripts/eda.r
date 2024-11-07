"""
coding: utf-8
Project: EDA com R
Author: Wellington Moreira
"""


# importando dados
dados = read.csv('../data/Churn.csv', sep =';', na.strings ='', stringsAsFactors = T)

# na.strings='' preenche valores vazios como NA
# stringsAsFactors=T fatores são dados categoricos

# visualizando dados
head(dados)

# resumo dos dados sumarizados
summary(dados)

# renomeando colunas para melhor compreensao dos dados
# a funcao colnames permite que colunas sejam renomeadas utilizando um vetor
colnames(dados) = c('id', 'score', 'estado', 'genero', 'idade', 'patrimonio', 'saldo', 'produtos', 'tem_cartao_credito', 'ativo', 'salario', 'saiu')

# visualizando alterações
head(dados)

# explorando dados categoricos [genero]
counts <- table(dados$genero)
barplot(counts, main='genero', xlab='genero')

# explorando dados categoricos [estado]
counts <- table(dados$estado)
barplot(counts, main='estados', xlab='estados')

# explorando dados numericos
# score
summary(dados$score)
boxplot(dados$score)
hist(dados$score)

# idade
summary(dados$idade)
boxplot(dados$idade)
hist(dados$idade)

# saldo
summary(dados$saldo)
boxplot(dados$saldo)
hist(dados$saldo)

# salario
summary(dados$salario)
boxplot(dados$salario)
hist(dados$salario)

# verificando valores faltantes NAs
dados[!complete.cases(dados),]

# complete.cases busca todas os registros completos, mas com uso da negacao '!' retorna as imcompletas

# atribuir mediana aos NAs do atributo salario
dados[is.na(dados$salario),]$salario <- median(dados$salario, na.rm=T)

# com 'is.na' foi feito um teste logico em todos registros onde retornar TRUE 
# será atribuido a mediana sem NAs utilizando o parametro 'na.rm=T'

# conferindo alteracoes no atributo salario
dados[!complete.cases(dados$salario),]

# pradronizando atributo genero
unique(dados$genero)
summary(dados$genero)

# transformando 'F' e 'Fem' em Feminino e 'M'e 'NAs' em masculino
dados[is.na(dados$genero) | dados$genero == 'M',]$genero <- 'Masculino'
dados[dados$genero == 'F' | dados$genero == 'Fem',]$genero <- 'Feminino'

# todas os registros do atributo 'genero' sao filtrados os que satisfazerem as 
# condicoes são substituidos os valores conforme a logica, os valores NAs são 
# transformados em 'Masculino' por ser a moda

# conferindo alteracoes no atributo
summary(dados$genero)

# removendo levels nao utilizados
dados$genero <- factor(dados$genero)

# conferindo alteracoes 
summary(dados$genero)

# padronizando atributo idade
summary(dados$idade)

# idades fora do dominio estabelecido por regra de negocio
dados[dados$idade <= 0 | dados$idade>110,]

# atribuindo mediana para idades fora do dominio
dados[dados$idade <= 0 | dados$idade > 110,]$idade <- median(dados$idade)

# conferindo alteracoes
dados[dados$idade <= 0 | dados$idade>110,]

# os dados sao filtrados e reatribuidos com o valor da mediana 
# com a ausencia de NAs o parametro na.rm=T não foi necessario,

# pesquisando dados duplicados pelo id
dados[duplicated(dados$id),]

# removendo dados duplicados pelo indice do atributo id
dados <- dados[-c(82),]

# conferindo alteracoes
dados[duplicated(dados$id),]

# visualizando o indice deletado
dados[dados$id == dados[duplicated(dados$id)],]

# padronizando atributo estado onde dados estao fora do dominio
summary(dados$estado)
unique(dados$estado)

# atribuindo moda para dados fora do dominio
dados[!dados$estado %in% c('RS', 'SC', 'PR'),]$estado <- 'RS'

# conferindo alteracoes
summary(dados$estado)
unique(dados$estado)

# removendo fatores fora do dominio
dados$estado <- factor(dados$estado)

# conferindo alteracoes
summary(dados$estado)

head(dados)

# visualizando outliers
boxplot(dados[, c('score', 'idade', 'saldo', 'salario')])

for (i in c('score', 'idade', 'saldo', 'salario')) {
    boxplot(dados[,i], main = i)
}

# removendo outliers do atributo salario
dados[dados$salario > 2 * sd(dados$salario, na.rm = T),]$salario <- median(dados$salario, na.rm=T)

# confirmando alteracoes
boxplot(dados[, c('score', 'idade', 'saldo', 'salario')])
