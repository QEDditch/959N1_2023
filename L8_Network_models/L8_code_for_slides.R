#=================================================================================
# 9595N1: Network Analysis and Infographics
# Dr. Daniele Rotolo (www.danielerotolo.com)
# SPRU Science Policy Research Unit, University of Sussex
#=================================================================================
# L8 - Network models
#=================================================================================


#DO NOT CHANGE THE SPACE BETWEEN LINES OTHERWISE LATEX WOULD NOT READ THE RIGHT SECTIONS#
rm(list=ls())
setwd("/Users/danielerotolo/Dropbox/--Teaching--/959N1_Network_analysis_and_infographics/959N1_2016_17/L8_Network_models")
library(igraph)



#Erdos 3 nodes and 1 edge
g1 <- graph.formula(1--2, 3)
l_g1 <- layout_in_circle(g1)
g2 <- graph.formula(1, 2--3)
l_g2 <- layout_in_circle(g2)
g3 <- graph.formula(1, 2, 1--3)
l_g3 <- layout_in_circle(g3)

pdf('erdos_3_1.pdf', width = 9, height = 3)
par(mfrow=c(1, 3), mar=c(1,1,1,1))
plot(g1, vertex.size = 20, vertex.color = "lightblue", layout = l_g1)
box(which = "plot", lty = "solid") 
plot(g2, vertex.size = 20, vertex.color = "lightblue", layout = l_g2)
box(which = "plot", lty = "solid") 
plot(g3, vertex.size = 20, vertex.color = "lightblue", layout = l_g3)
box(which = "plot", lty = "solid") 
dev.off()



#Erdos 4 nodes and 1 edge
g1 <- graph.formula(1, 2, 3, 4, 1--2)
l_g1 <- layout_in_circle(g1)
g2 <- graph.formula(1, 2, 3, 4, 1--3)
l_g2 <- layout_in_circle(g2)
g3 <- graph.formula(1, 2, 3, 4, 1--4)
l_g3 <- layout_in_circle(g3)
g4 <- graph.formula(1, 2, 3, 4, 2--3)
l_g4 <- layout_in_circle(g4)
g5 <- graph.formula(1, 2, 3, 4, 2--4)
l_g5 <- layout_in_circle(g5)
g6 <- graph.formula(1, 2, 3, 4, 3--4)
l_g6 <- layout_in_circle(g6)

pdf('erdos_4_1.pdf', width = 9, height = 6)
par(mfrow=c(2, 3), mar=c(1,1,1,1))
plot(g1, vertex.size = 20, vertex.color = "lightblue", layout = l_g1)
box(which = "plot", lty = "solid") 
plot(g2, vertex.size = 20, vertex.color = "lightblue", layout = l_g2)
box(which = "plot", lty = "solid") 
plot(g3, vertex.size = 20, vertex.color = "lightblue", layout = l_g3)
box(which = "plot", lty = "solid") 
plot(g4, vertex.size = 20, vertex.color = "lightblue", layout = l_g4)
box(which = "plot", lty = "solid") 
plot(g5, vertex.size = 20, vertex.color = "lightblue", layout = l_g5)
box(which = "plot", lty = "solid") 
plot(g6, vertex.size = 20, vertex.color = "lightblue", layout = l_g6)
box(which = "plot", lty = "solid") 
dev.off()



#Bernoulli
g <- sample_gnp(10, 0.2)
l_g <- layout.circle(g)
pdf('bernoulli.pdf', width = 9, height = 6)
par(mfrow=c(2, 3), mar=c(1,1,1,1))
for(i in 1:6)
{
  plot(sample_gnp(10, 0.2), vertex.size = 20, vertex.color = "lightblue", layout = l_g)
  box(which = "plot", lty = "solid") 
}
dev.off()

g <- sample_gnp(300, 0.01)
V(g)$size <- 5
pdf('bernoulli_giant.pdf', 
    width = 6, height = 6)
plot(g, 
     vertex.label = "",
     vertex.color = "lightblue", 
     layout = layout_nicely(g))
dev.off()



#Generalised random: Degree sequence
degs <- c(2,2,2,2,2,4,4,4,4,4)
degseq1 <- degree.sequence.game(degs, method="vl")
degseq2 <- degree.sequence.game(degs, method="vl")
degseq3 <- degree.sequence.game(degs, method="vl")
l_ds <- layout.circle(degseq1)

pdf('generalised.pdf', width = 9, height = 3)
par(mfrow=c(1, 3), mar=c(1,1,1,1))
plot(degseq1, vertex.size = 20, vertex.color = "lightblue", layout = l_ds)
box(which = "plot", lty = "solid") 
plot(degseq2, vertex.size = 20, vertex.color = "lightblue", layout = l_ds)
box(which = "plot", lty = "solid") 
plot(degseq3, vertex.size = 20, vertex.color = "lightblue", layout = l_ds)
box(which = "plot", lty = "solid") 
dev.off()




#Small-world
smallworld <- watts.strogatz.game(1,30,3,0.1)
l_sm <- layout_in_circle(smallworld)
pdf('sm.pdf', width = 5, height = 5)
par(mfrow=c(1, 1), mar=c(1,1,1,1))
plot(smallworld, vertex.size = 10, vertex.color = "lightblue", layout = l_sm)
dev.off()


#Small-world
smallworld <- watts.strogatz.game(1,30,3,0)
l_sm <- layout_in_circle(smallworld)
pdf('sm.pdf', width = 5, height = 5)
par(mfrow=c(1, 1), mar=c(1,1,1,1))
plot(smallworld, vertex.size = 10, vertex.color = "lightblue", layout = l_sm)
dev.off()



#Small world-lattice
sm1 <- watts.strogatz.game(1,27,3,0)
sm2 <- watts.strogatz.game(1,27,3,0.1)

l1 <- layout_with_gem(sm1)
l2 <- layout_in_circle(sm1)
l3 <- layout_in_circle(sm1)

pdf('sm1.pdf', width = 6, height = 6)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(sm1, vertex.size = 10, vertex.color = "lightblue", layout = l1)
dev.off()

pdf('sm1_c.pdf', width = 6, height = 6)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(sm1, vertex.size = 10, vertex.color = "lightblue", layout = l2)
dev.off()

pdf('sm2.pdf', width = 6, height = 6)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(sm2, vertex.size = 10, vertex.color = "lightblue", layout = l3)
dev.off()




