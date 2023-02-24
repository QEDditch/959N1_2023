#=================================================================================
# 9595N1: Network Analysis and Infographics
# Dr. Daniele Rotolo (www.danielerotolo.com)
# SPRU Science Policy Research Unit, University of Sussex
#=================================================================================
# L4 -  Descriptive network analysis A
#=================================================================================


#1.Remove objects  ---------- 
rm(list=ls())


#2.Diameter, APL, density: Karate  ---------- 
library(igraph)
library(igraphdata)
data(karate)
diameter(karate)
mean_distance(karate)
edge_density(karate)
setwd("YOUR WORKING DIRECTORY")
V(karate)$size <- 12
pdf(file = "karate.pdf", 
    width = 4, height = 4)
plot(karate)
dev.off()


#3.Diameter, APL, density: Godfather  ---------- 
library(igraph)
g1 <- read_graph("gf1.gml", format = "gml")
diameter(g1)
mean_distance(g1)
edge_density(g1)

library(igraph)
g2 <- read_graph("gf2.gml", format = "gml")
diameter(g2)
mean_distance(g2)
edge_density(g2)


