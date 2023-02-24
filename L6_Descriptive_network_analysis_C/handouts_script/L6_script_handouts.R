#=================================================================================
# 9595N1: Network Analysis and Infographics
# Dr. Daniele Rotolo (www.danielerotolo.com)
# SPRU Science Policy Research Unit, University of Sussex
#=================================================================================
# L6 -  Descriptive network analysis C
#=================================================================================

#0.Remove objects  ---------- 
rm(list=ls())
library(readr)
library(dplyr)
library(igraph)

#1.Loading data  ---------- 
df <- read_csv("alliance_v4.1_by_dyad.csv") %>%
      filter(nonaggression == 1)

#2.Network Before WWI  ---------- 
g <-  df %>%
      filter(dyad_st_year > 1884 & dyad_st_year < 1914) %>%
      distinct(state_name1, state_name2) %>%
      graph_from_data_frame(., directed = F)

V(g)$size <- constraint(g) * 10
V(g)$label.cex <- 0.6
V(g)$color <- 1:vcount(g)
palette(gray.colors(vcount(g)))

pdf('alliances_before_wwi.pdf', width = 6, height = 4)
plot(g, layout = layout_nicely(g), vertex.label.dist = 1, vertex.label.degree = 30)
title(main = "Non-aggression alliances before WWI (1885-1913)", cex.main = 0.7)
dev.off()

#3.Network After WWI (but before WWII)  ---------- 
g <-  df %>%
      filter(dyad_st_year > 1918 & dyad_st_year < 1938) %>%
      distinct(state_name1, state_name2) %>%
      graph_from_data_frame(., directed = F)

V(g)$size <- constraint(g) * 10
V(g)$label.cex <- 0.5
V(g)$color <- 1:vcount(g)
palette(gray.colors(vcount(g)))

pdf('alliances_after_wwi.pdf', width = 6, height = 6)
plot(g, layout = layout_nicely(g), vertex.label.dist = 1, vertex.label.degree = 30)
title(main = "Non-aggression alliances after WWI (1919-1937)", cex.main = 0.7)
dev.off()




