# carregando dados
dados <- read.csv('../data/tempo.csv', sep=';', na.strings = '', stringsAsFactors = T)

# visualizando os dados
head(dados)

# visualisando as estruturas das variaveis e tipos de dados
str(dados)

# resumo dos dados sumarizados
summary(dados)

# identificando valores ausentes
dados[!complete.cases(dados),]

# quantidade de valores ausentes
sum(is.na(dados))

# tratando a variavel Aparencia conforme as regras de negocio
dados[!dados$Aparencia %in% c('sol','nublado','chuva'),]

# sumarizando os dados para opçoes de tratamento 
summary(dados$Aparencia)

# visualizando os dados
counts <- table(dados$Aparencia)
barplot(counts, main='aparencia', xlab='aparencia')

# removendo dados fora do dominio
dados2 <- dados[dados$Aparencia %in% c('sol','nublado','chuva'),]

# removendo fatores nao utilizados
dados2$Aparencia <- factor(dados2$Aparencia)

# visualizando os dados
head(dados2)

# visualizando dados sumarizados
summary(dados2)

# filtrando dados fora do dominio de temperatura
dados2[dados2$Temperatura < -130 | dados2$Temperatura > 130,]

# dados sumarizados para avaliar opçoes para o tratamento
summary(dados2$Temperatura)

# dados sem outlier
summary(dados2[!dados2$Temperatura==1220.0,]$Temperatura)

# substituindo dados fora do dominio pela mediana
dados2[dados2$Temperatura < -130 | dados2$Temperatura > 130,]$Temperatura <- median(dados2[!dados2$Temperatura==1220.0,]$Temperatura, na.rm = T)

# visualizando alteraçoes 
summary(dados2$Temperatura)

# visualizando estatisticas do atributo tratado
hist(dados2$Temperatura)
boxplot(dados2$Temperatura)

# filtrando dados fora do dominio de umidade
dados2[dados2$Umidade < 0 | dados2$Umidade > 100 | is.na(dados2$Umidade),]

# dados sumarizados para avaliar opçoes para o tratamento
summary(dados2$Umidade)

# substituindo NAs pela mediana
dados2[dados2$Umidade < 0 | dados2$Umidade > 100 | is.na(dados2$Umidade),]$Umidade <- median(dados$Umidade, na.rm=T)

# visualizando alteraçoes   
summary(dados2$Umidade)

# visualizando estatisticas do atributo tratado
hist(dados2$Umidade)
boxplot(dados2$Umidade)

# visualizando dados sumarizados do atributo vento
summary(dados2$Vento)

# visualizando os dados do atributo vento
counts <- table(dados2$Vento)
barplot(counts, main='vento', xlab='vento')

# substituindo NAs do atributo vento pela moda
dados2[is.na(dados2$Vento),]$Vento <- 'FALSO'

# visualizando alteraçoes
summary(dados2$Vento)


# filtrando dados NAs ou fora do dominio de jogar
dados2[!dados2$Jogar %in% c('nao','sim') | is.na(dados2$Jogar),]


# visualizando dados fora do dominio de jogar
counts <- table(dados$Jogar)
barplot(counts, main='jogar', xlab='jogar')

# visualizando os dados
head(dados2)

# visualizando a frequencia dos atributos categoricos
barplot(table(dados2$Aparencia), main='aparencia', xlab='aparencia')
barplot(table(dados2$Vento), main='vento', xlab='vento')
barplot(table(dados2$Jogar), main='jogar', xlab = 'jogar')

# visualizando frequencias dos atributos numericos
hist(dados2$Temperatura, main = 'temperatura', xlab = 'temperatura')
hist(dados2$Umidade, main = 'umidade', xlab = 'umidade')

# 
boxplot(Temperatura ~ Aparencia, data = dados2)
boxplot(Temperatura ~ Vento, data = dados2)
boxplot(Umidade ~ Aparencia, data = dados2)
boxplot(Umidade ~ Vento, data = dados2)

# visualisando relações entre as variaveis temperatura x umidade
plot(dados2$Temperatura, dados2$Umidade, main = 'temperatura x umidade', xlab = 'temperatura', ylab = 'umidade')

# visualizando correlaçao entre as variaveis temperatura x umidade
cor(dados2$Temperatura, dados2$Umidade, use = 'complete.obs')

# exportando csv para diretorio com datasets
write.csv(dados2, file='../data/tempo_tratado.csv', row.names=FALSE)
