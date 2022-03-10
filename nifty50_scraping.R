library(tidyverse)
library(readxl)
library(curl)


url <- "https://www.gov.br/anp/pt-br/assuntos/precos-e-defesa-da-concorrencia/precos/precos-revenda-e-de-distribuicao-combustiveis/shlp/semanal/semanal-estados-desde-2013.xlsx"
destfile <- "semanal_estados_desde_2013.xlsx"
curl_download(url, destfile)
estadual_semanal<- read_excel(destfile, 
                              col_types = c("date", "date", "text", "text", 
                                            "text", "numeric", "skip", "numeric", 
                                            "skip", "numeric", "numeric", "skip", 
                                            "skip", "numeric", "skip", "skip", 
                                            "skip", "skip"), skip = 16)


colnames(estadual_semanal) <- c('datai','dataf', 'regiao', 'estado', 
                                'combustivel', 'npostos', 'pmediorevenda', 
                               'pminrevenda', 'pmaxrevenda', 'pmediodist')


#Exportar rds
saveRDS(estadual_semanal, "estadual_semanal.rds")
