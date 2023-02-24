#' EXERCISE   --- --- --- --- --- --- --- --- --- --- --- ---
#' 1. Load the data of the inter-organisational network ("edge_list_interorg.csv")
#' 2. Display the network
#' 3. Display degree in terms of node size
#' 4. Color red the node with the highest closeness
#' 5. Color yellow the node with the highest betweenness
#' 6. Export centrality measures as a csv
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---


#' SOLUTION  --- --- --- --- --- --- --- --- --- --- --- ---
rm(list=ls())
library(igraph)
library(readr)
setwd("<--DEFINE YOUR WORKING DIRECTORY-->")



#' 1. Load the data of the inter-organisational network ("edge_list_interorg.csv")
df <- read.csv("edge_list_interorg.csv", header = T)               #Read network data as edge list
g  <- graph_from_data_frame(df, directed = FALSE)                  #Transform data into a network

#' 2. Display the network
plot(g)                                                            #Display the network

#' 3. Display degree in terms of node size
V(g)$degree <- degree(g, normalized = FALSE)                       #Degree  (as anode attribute)
V(g)$size <- V(g)$degree                                           #Degree centrality in terms of size of nodes
plot(g)                                                            #Display the network
#Node size too small?
V(g)$size <- V(g)$degree*2                                         #Degree in terms of size of nodes * 2
plot(g)                                 

#' 4. Color red the node with the highest closeness
V(g)$closeness <- closeness(g, normalized = FALSE)                 #Closeness (as anode attribute)
V(g)$color <- ifelse(V(g)$closeness == max(V(g)$closeness),        #Color red nodes with the max value of closeness 
                     "red", "lightblue")
plot(g)                                                            #Display the network 

#' 5. Color yellow the node with the highest betweenness
V(g)$betweenness <- betweenness(g, normalized = FALSE)             #Betweenness (as anode attribute)
V(g)$color <- ifelse(V(g)$betweenness == max(V(g)$betweenness),    #Color yellow nodes with the max value of betweenness 
                     "yellow", "lightblue")
plot(g)                                                            #Display the network                                                           


#' 6. Export centrality measures as a csv
centrality_measures <- as.data.frame(get.vertex.attribute(g))
write_csv(centrality_measures, "centrality_measures.csv")

