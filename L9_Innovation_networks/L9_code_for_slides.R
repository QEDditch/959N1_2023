#=================================================================================
# 9595N1: Network Analysis and Infographics
# Dr. Daniele Rotolo (www.danielerotolo.com)
# SPRU Science Policy Research Unit, University of Sussex
#=================================================================================
# L9 - Innovation networks
#=================================================================================


#DO NOT CHANGE THE SPACE BETWEEN LINES OTHERWISE LATEX WOULD NOT READ THE RIGHT SECTIONS#
rm(list=ls())
setwd("/Users/danielerotolo/Dropbox/--Teaching--/959N1_Network_analysis_and_infographics/959N1_2016_17/L9_Innovation_networks")
library(igraph)


#Document reference
g <- graph.formula("Doc"-+"Ref 1",
                   "Doc"-+"Ref 2",
                   "Doc"-+"Ref 3",
                   "Doc"-+"Ref 4",
                   "Doc"-+"Ref 5",
                   "Doc"+-"Cit 1",
                   "Doc"+-"Cit 2",
                   "Doc"+-"Cit 3")
V(g)
V(g)$shape <- "circle"
V(g)[1]$shape <- "square"

V(g)[1]$color <- "lightblue"
V(g)[2:6]$color <- "orange"
V(g)[7:9]$color <- "green"

l <- matrix( c(1, 2,
               0, 0, 0, 1, 0, 2, 0, 3, 0, 4,
               2, 1, 2, 2, 2, 3),
              nrow=9, ncol=2, byrow = T)

pdf('documents_citations.pdf', width = 4, height = 4)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(g, layout = l, edge.arrow.size = 0.5, vertex.size = 30)
dev.off()



#Document terms
g <- graph.formula("Doc 1", "Doc 2", "Doc 3",
                   "Doc 1"--"Term 1",
                   "Doc 1"--"Term 2",
                   "Doc 1"--"Term 3",
                   "Doc 2"--"Term 2",
                   "Doc 2"--"Term 4",
                   "Doc 3"--"Term 1",
                   "Doc 3"--"Term 3",
                   "Doc 3"--"Term 5")
V(g)
V(g)$shape <- "circle"
V(g)[1:3]$shape <- "square"

V(g)[1:3]$color <- "lightblue"
V(g)[4:8]$color <- "orange"

l <- matrix( c(0, 1, 0, 2, 0, 3,
               1, 0, 1, 1, 1, 2, 1, 3, 1, 4),
               ncol=2, byrow = T)

pdf('documents_terms1.pdf', width = 4, height = 4)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(g, layout = l, edge.arrow.size = 0.5, vertex.size = 30)
dev.off()


V(g)$type <- TRUE
V(g)[1:3]$type <- FALSE
g <- bipartite_projection(g, multiplicity = FALSE, which = TRUE)
pdf('documents_terms2.pdf', width = 4, height = 4)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(g, vertex.size = 30)
dev.off()



