library(worms)
# Criando o vetor de táxons
sp_Names = unique(DF.benthos$name) 

# Passo 1
# Extraindo taxon rank do WoRMS e identificando os nomes inválidos
scNames_rank = wormsbynames(sp_Names, verbose = F)

# Passo 2 - listando os nomes não aceitos
scNames_rank %>% 
  filter( status == "unaccepted")

# Alterando os nomes manualmente para os nomes válidos indicados pelo WoRMS 
DF.benthos = DF.benthos %>%
  mutate(name = str_replace(name, pattern = "favia_leptophylla", replacement = "mussismilia_leptophylla")) %>%
  mutate(name = str_replace(name, pattern = "protopalythoa", replacement = "palythoa")) %>%  
  
  #  Passo 3  - Rodando novamente para confirmar 
  sp_Names = unique(DF.benthos$name)
scNames_rank = wormsbynames(sp_Names, verbose = F)

scNames_rank %>% 
  filter( status == "unaccepted")
# Zero issues - ok
