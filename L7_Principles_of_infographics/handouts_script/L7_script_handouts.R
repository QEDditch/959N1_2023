#=================================================================================
# 9595N1: Network Analysis and Infographics
# Dr. Daniele Rotolo (www.danielerotolo.com)
# SPRU Science Policy Research Unit, University of Sussex
#=================================================================================
# L7 -  Principle of infographics
#=================================================================================

#0.Remove objects  ---------- 
rm(list=ls())
library(igraph)


#1.Random layout  ---------- 
grandom <- erdos.renyi.game(100, 0.02)
V(grandom)$color <- "lightblue"
V(grandom)$size  <- 5
E(grandom)$width <- 2
l_random <- layout.random(grandom)
pdf('random.pdf', width = 10, height = 10)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(grandom, layout = l_random)
dev.off()


#2.Cirlce layout  ---------- 
l_circle <- layout.circle(grandom)
pdf('circle.pdf', width = 10, height = 10)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(grandom, layout = l_circle)
dev.off()


#3.Grid layout  ---------- 
l_gr <- layout_on_grid(grandom, width=10)
pdf('grid.pdf', width = 10, height = 10)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(grandom, layout = l_gr)
dev.off()


#4.Kamada-Kawai  ---------- 
l_kk <- layout_with_kk(grandom)
pdf('kamada.pdf', width = 10, height = 10)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(grandom, layout = l_kk)
dev.off()


#5.Fruchterman Reingold  ---------- 
l_fr <- layout_with_fr(grandom)
pdf('fr.pdf', width = 10, height = 10)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(grandom, layout = l_fr)
dev.off()