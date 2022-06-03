
library(tidyverse)
library(simstudy)
library(clusterGeneration)

############# La sulució!!!!


n <- 200                              ## Mida de la mostra
k <- 5                                ## Nombre de variables
mu <- runif(k,50,200) %>% round(1)    ## Vector de mitjanes  
sigma <- runif(k,3,20) %>% round(1)   ## Vector de sigmes

mat <- rcorrmatrix(k,alphad=1) %>%  ## Generem la matriu de correlacions
  round(2)
mat     

dt <- genCorData(n,
                 mu = mu,
                 sigma = sigma, 
                 corMatrix = mat)     ## Generem les dades
dt <- dt %>% dplyr::select(c(-id))    ## Esborrem id
dt <- dt %>% round(1)                 ## Arrodoniment
dt%>% head()                          ## Les dades

cor(dt) %>% round(2)

plot(dt)
