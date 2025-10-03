devtools::install_github("danicat/read.dbc")
library(dplyr)

require(read.dbc)
devtools::install_github("edwindj/ffbase", subdir="pkg")
devtools::install_github("mtennekes/tabplot")


url <- "http://leg.ufpr.br/~ara/data/TUBEBR22.dbc"
download.file(url, destfile = "TUBEBR22.dbc", mode = "wb")
dados22 <- read.dbc("TUBEBR22.dbc")
head(dados22 )
ncol(dados22)


url <- "http://leg.ufpr.br/~ara/data/TUBEBR23.dbc"
download.file(url, destfile = "TUBEBR23.dbc", mode = "wb")
dados23 <- read.dbc("TUBEBR23.dbc")
head(dados23 )
ncol(dados23)


url <- "http://leg.ufpr.br/~ara/data/TUBEBR24.dbc"
download.file(url, destfile = "TUBEBR24.dbc", mode = "wb")
dados24 <- read.dbc("TUBEBR24.dbc")
head(dados24 )
ncol(dados24)

names(dados22 ) == names(dados23)
names(dados23) == names(dados24)

dadosT = rbind(dados22,
               dados23,
               dados24)

nas.por.variavel <- apply(is.na.data.frame(dadosT),2,sum)
nas.por.variavel
prop.mis <- round(nas.por.variavel/nrow(dadosT),2)
prop.mis

par(mar = c(4,6,1,1),mfrow = c(1,4))
CEX = 0.85

nosso_bar <- function(x){
  barplot(x,
        horiz =  T,
        las = 1,
        cex.names = 0.85 ,
        xlab = "Na Prop",
        border = NA,
        col ="hotpink")
}


nosso_bar(prop.mis[1:25])
nosso_bar(prop.mis[26:50])
nosso_bar(prop.mis[51:75])
nosso_bar(prop.mis[76:97])


nomesCut = c(names(dadosT)[prop.mis < 0.05])
dadosCut <- subset(dadosT,select = nomesCut)
names(dadosCut)

barplot(table(cbind(dadosCut$TRATAMENTO,dadosCut$FORMA)))

as.numeric(as.character(dadosCut$ANO_NASC)

#11 a 17n
#21 a 19NO
#31a35 SD
#41a45
Regiao <- dados
head(dadosCut)
tableplot(dadosCut$TRATAMENTO)
