#=================================================================================
# 9595N1: Network Analysis and Infographics
# Dr. Daniele Rotolo (www.danielerotolo.com)
# SPRU Science Policy Research Unit, University of Sussex
#=================================================================================
# L5 -  Descriptive network analysis B
#=================================================================================

#1.Remove objects  ---------- 
rm(list=ls())


#2.Degree distribution example  ---------- 
library(igraph)
library(igraphdata)
data(yeast)

pdf('yeast1.pdf', width = 6, height = 6)
d.yeast <- degree(yeast)
hist(d.yeast, col = "blue",
     xlab = "Degree", 
     ylab = "Frequency",
     main = "")
dev.off()

pdf('yeast2.pdf', width = 6, height = 6)
dd.yeast <- degree.distribution(yeast)
d <- 1:max(d.yeast) - 1
ind <- (dd.yeast != 0)
plot(d[ind], dd.yeast[ind], 
     log = "xy", col = "blue",
     xlab = c("Log-Degree"), 
     ylab = c("Log-Frequency"),
     main = "")
dev.off()


#3.Degree distribution example: The Godfather 1 and 2  ---------- 
library(igraph)
gf <- read_graph("gf1.gml", format = "gml")

degree_gf <- cbind(V(gf)$label, degree(gf))
write.csv(degree_gf, "degree_gf.csv")

pdf('gf_dist.pdf', width = 6, height = 6)
d_gf <- degree(gf)
hist(d_gf, col = "blue", 
     xlab = "Degree", 
     ylab = "Frequency", 
     main = "")
dev.off()