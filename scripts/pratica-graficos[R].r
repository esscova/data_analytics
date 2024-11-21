# datasets
head(trees) 
head(CO2)

hist(trees$Height)

# adicionando personalizações
hist(trees$Height,
     main = "Distribuição das Alturas das Árvores",
     xlab = "Altura",
     ylab = "Frequência",
     col = "blue")

# ajustando densidade e intervalos
hist(trees$Height,
     main = "Distribuição das Alturas",
     xlab = "Altura",
     ylab = "Frequência",
     col = "blue",
     density = 20,
     breaks = 20)

# calculo e plot
densidade <- density(trees$Height)
plot(densidade,
     main = 'Densidade da Altura das Árvores',
     xlab = 'Altura',
     ylab = 'Densidade')

# histograma
hist(trees$Height, main=NULL, xlab=NULL, ylab=NULL)
par(new = TRUE)
# densidade
plot(densidade, col='red', lwd=2, main='Histograma com Densidade')

# circunferencia x volume
plot(trees$Girth, trees$Volume,
     main = 'Dispersão: Circunferência vs Volume',
     xlab = 'Circunferência',
     ylab = 'Volume')

# adicionando personalizações
plot(trees$Girth, trees$Volume,
     main = "Dispersão: Circunferência vs Volume",
     xlab = 'Circunferência',
     ylab = 'Volume',
     col = 'blue',
     pch = 20)
        

# adicionando tremulação
plot(jitter(trees$Girth), trees$Volume,
     main = 'Dispersão com Tremulação',
     xlab = 'Circunferência',
     ylab = 'Volume',
     col = 'blue')

# utilizando um atributo para cores
plot(CO2$conc, CO2$uptake,
     col = CO2$Treatment,
     pch = 20,
     main = 'Dispersão: Concentração vs Absorção de CO2')

# adicionando legendas
plot(CO2$conc, CO2$uptake,
     col = CO2$Treatment,
     pch = 20,
     main = 'Dispersão: Concentração vs Absorção de CO2')

legend('bottomright',
       legend = c('Non-chilled', 'Chilled'),
       fill = c('black', 'red'),
       title = 'Tratamento')

# divisao em 4 partes 
split.screen(figs = c(2,2))

# 1
screen(1)
plot(trees$Girth, trees$Volume, main='Circunferência vs Volume')
# 2
screen(2)
plot(trees$Girth, trees$Height, main='Circunferência vs Altura')
# 3
screen(3)
plot(trees$Height, trees$Volume, main='Altura vs Volume')
# 4
screen(4)
hist(trees$Volume, main='Histograma do Volume')

close.screen(all=TRUE)
