#' ===========================================================================================
#' 9595N1: Network Analysis and Infographics
#' Dr. Daniele Rotolo (www.danielerotolo.com)
#' SPRU Science Policy Research Unit, University of Sussex
#' ===========================================================================================
#' S8: Network models
#' ===========================================================================================


#0.Remove objects, load igraph and ggplot2 ----------
rm(list=ls())
library(igraph)
library(ggplot2)



#1.Random graph model: Erdos-Renyi ----------
g <- erdos.renyi.game(3, 1, type = "gnm")                           #Erdos-Renyi random network: N=3, E=1
plot(g)                                                             #Display the network


g <- erdos.renyi.game(300, 3000, type = "gnm")                       #Erdos-Renyi random network: N=300, E=3000
plot(g)
V(g)$size  <- 5                                                     #Change the size of nodes
V(g)$color <- "lightblue"                                           #Change the color of nodes
plot(g, layout=layout_nicely, vertex.label=NA)                      #Display the network

g.deg <- degree(g)
g.deg.histogram <- as.data.frame(table(g.deg))
g.deg.histogram[,1] <- as.numeric(g.deg.histogram[,1])
ggplot(g.deg.histogram, aes(x = g.deg, y = Freq)) +
  geom_point() +
  scale_x_continuous("Degree", trans = "log10") +
  scale_y_continuous("Frequency", trans = "log10") +
  ggtitle("Degree Distribution (log-log)")


mean_distance(g)                                                    #APL between nodes
transitivity(g, type="average")                                     #Clustering coefficent


#2.Random graph model: Bernoulli ----------
g <- erdos.renyi.game(20, 0.1, type = "gnp")                          #Bernoulli random network: N=20, p=0.1
plot(g)

g <- erdos.renyi.game(300, 0.05, type = "gnp")                      #Bernoulli random network: N=300, p=0.05
plot(g)
edge_density(g)

V(g)$size  <- 5                                                     #Change the size of nodes
V(g)$color <- "lightblue"                                           #Change the color of nodes
plot(g, layout=layout_nicely, vertex.label = NA)                    #Display the network

g.deg <- degree(g)
g.deg.histogram <- as.data.frame(table(g.deg))
g.deg.histogram[,1] <- as.numeric(g.deg.histogram[,1])
ggplot(g.deg.histogram, aes(x = g.deg, y = Freq)) +
  geom_point() +
  scale_x_continuous("Degree", trans = "log10") +
  scale_y_continuous("Frequency", trans = "log10") +
  ggtitle("Degree Distribution (log-log)")


mean_distance(g)                                                    #APL between nodes
transitivity(g, type="average")                                     #Clustering coefficent



#3.Random graph model: Generalised (degree sequence) ----------
degs <- c(2, 1, 2, 1, 4, 2, 1, 2, 3)                                #Define the degree sequence
g <- degree.sequence.game(degs, method = "vl")                      #Generalised random network and degree sequence
plot(g)                                                             #Display the network



#4.Preferential attachment model ----------
g <- sample_pa(300, directed = F)                                   #Preferential attachment network: N=300
V(g)$size  <- 5                                                     #Change the size of nodes
V(g)$color <- "lightblue"                                           #Change the color of nodes
plot(g, vertex.label = NA)                                          #Display the network

g.deg <- degree(g)
g.deg.histogram <- as.data.frame(table(g.deg))
g.deg.histogram[,1] <- as.numeric(g.deg.histogram[,1])
ggplot(g.deg.histogram, aes(x = g.deg, y = Freq)) +
  geom_point() +
  #scale_x_continuous("Degree", trans = "log10") +
  #scale_y_continuous("Frequency", trans = "log10") +
  ggtitle("Degree Distribution (log-log)")

mean_distance(g)                                                    #APL between nodes
transitivity(g, type="average")                                     #Clustering coefficent



#5.Small-world network model ----------
g <- sample_smallworld(1, 100, 5, 0.1)                             #Small-world network: N=100, r=5, p=0.1
V(g)$size  <- 5                                                     #Change the size of nodes
V(g)$color <- "lightblue"                                           #Change the color of nodes
l_circle <- layout_in_circle(g)                                     #Layout cicle
plot(g, layout = l_circle, vertex.label = NA)                       #Display the network

mean_distance(g)                                                    #APL between nodes
transitivity(g, type="average")                                     #Clustering coefficent


#6.Testing for small-world effects ----------

#' In order to test for the presence of a small world property
#' in observed networks, we compare the observed apl and transitivity
#' (clustering coefficient) with a distribution of the same measures
#' generated by a high number of random graphs. In order to find 
#' the small world property in an observed network, we expect to 
#' have comparable apls in the observed and random networks, and 
#' higher clustering in the observed network. 

library(igraphdata)
data()
data(karate)
karate

mynetwork.apl <- mean_distance(karate)                               #APL between nodes
mynetwork.cl  <- transitivity(karate, type="average")                #Clustering coefficent

N <- vcount(karate)                                                  #Number of nodes in the network we created
E <- ecount(karate)                                                  #Number of edges in the network we created

sim <- 1000                                                          #How many simulations we want to run
apl <- numeric(sim)                                                  #APL
cl  <- numeric(sim)                                                  #Clustering coefficent

for(i in 1:sim) {                                                    #We run the simulation
    gr     <- erdos.renyi.game(N, E, type = "gnm")
    apl[i] <- mean_distance(gr)
    cl[i]  <- transitivity(gr, type = "average")
  }

summary(apl)
summary(cl)

randomnet.apl <- mean(apl)
randomnet.cl  <- mean(cl)

#Compare observed and random measures: some evidence of small-world effect:
gamma.apl <- mynetwork.apl/randomnet.apl
gamma.cl  <- mynetwork.cl/randomnet.cl

#'Index of small-world-ness (Humphries & Gurney (2008))
#'smallworldness>1 to have a small world effect
library(qgraph)
smallworldness(karate, B = 100, up = 0.995, lo = 0.005)
