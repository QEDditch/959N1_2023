#' ===========================================================================================
#' 9595N1: Network Analysis and Infographics
#' Dr. Daniele Rotolo (www.danielerotolo.com)
#' SPRU Science Policy Research Unit, University of Sussex
#' ===========================================================================================
#' S5: Descriptive network analysis B
#' ===========================================================================================


#0.Remove objects and load igraph ----------
rm(list=ls())
library(igraph)
library(readr)


#1.Degree  ----------
help("degree")                                                      #Explore this function

g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)          #Create a network
plot(g)                                                             #Display the network

V(g)$degree <- degree(g, normalized = FALSE)                        #Degree (as anode attribute)
g                                                                   #Degree is now an attribute of the network
V(g)$degree                                                         #Display the degree

V(g)$degree_n <- degree(g, normalized = TRUE)                       #Normalised degree (as anode attribute)
g                                                                   #Normalised degree is now an attribute of the network
V(g)$degree_n                                                       #Display the normalised degree

V(g)$size <- V(g)$degree                                            #Degree in terms of size of nodes
plot(g)                                                             #Display the network
V(g)$size <- V(g)$degree*10                                         #Degree in terms of size of nodes * 10
plot(g)                                                             #Display the network



#2.Closeness  ----------
help("closeness")                                                      #Explore this function

g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)          #Create a network
plot(g)                                                             #Display the network

V(g)$closeness <- closeness(g, normalized = FALSE)                  #Closeness (as anode attribute)
g                                                                   #Closeness is now an attribute of the network
V(g)$closeness                                                      #Display the closeness

V(g)$closeness_n <- closeness(g, normalized = TRUE)                 #Normalised closeness (as anode attribute)
g                                                                   #Normalised closeness is now an attribute of the network
V(g)$closeness_n                                                    #Display the normalised closeness

V(g)$size <- V(g)$closeness                                         #Closeness in terms of size of nodes
plot(g)                                                             #Display the network
V(g)$size <- V(g)$closeness*100                                     #Closeness in terms of size of nodes * 100
plot(g)                                                             #Display the network



#3.Betweenness  ----------
help("betweenness")                                                 #Explore this function

g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)          #Create a network
plot(g)                                                             #Display the network

V(g)$betweenness <- betweenness(g, directed=FALSE, normalized = FALSE)              #Betweenness (as anode attribute)
g                                                                   #Betweenness is now an attribute of the network
V(g)$betweenness                                                    #Display the betweenness

V(g)$betweenness_n <- betweenness(g, normalized = TRUE)             #Normalised betweenness (as anode attribute)
g                                                                   #Normalised betweenness is now an attribute of the network
V(g)$betweenness_n                                                  #Display the normalised betweenness

V(g)$size <- V(g)$betweenness                                       #Betweenness in terms of size of nodes
plot(g)                                                             #Display the network
V(g)$size <- V(g)$betweenness*2                                     #Betweenness in terms of size of nodes * 2
plot(g)                                                             #Display the network



#4.Degree, Closeness, Betweenness and visualisation ----------
g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)          #Create a network
plot(g)                                                             #Display the network

V(g)$degree      <- degree(g, normalized = FALSE)                   #Degree (as anode attribute)
V(g)$closeness   <- closeness(g, normalized = FALSE)                #Closeness (as anode attribute)
V(g)$betweenness <- betweenness(g, normalized = FALSE)              #Betweenness (as anode attribute)
g                                                                   #Centrality measures are now attributes of the network

V(g)$size <- V(g)$degree*10                                         #Degree in terms of size of nodes * 10
plot(g)                                                             #Display the network                                                           #Display the network

V(g)$color <- ifelse(V(g)$closeness == max(V(g)$closeness),         #Color yellow nodes with the max value of closeness 
                     "yellow", "lightblue")
plot(g)                                                             #Display the network                                                           #Display the network

V(g)$color <- ifelse(V(g)$betweenness == max(V(g)$betweenness),     #Color yellow nodes with the max value of betweenness 
                     "yellow", "lightblue")
plot(g)                                                             #Display the network                                                           #Display the network

V(g)$color <- ifelse(V(g)$betweenness == max(V(g)$betweenness),"yellow", ifelse(V(g)$betweenness == min(V(g)$betweenness),"pink","lightblue"))
plot(g)


#5.Degree, Closeness, Betweenness (export) ----------
centrality_measures <- as.data.frame(vertex_attr(g))
write_csv(centrality_measures, "centrality_measures.csv")



#6.Centralization ----------
centr_degree(g, mode = "total", loops = F)                         #Degree centralisation  
centr_clo(g, mode = "total")                                       #Closeness centralisation
centr_betw(g, directed = F)                                        #Betweenness centralisation



#7.Weighted centralities ----------
g <- read_graph("lesmiserables.gml", format = "gml")               #Let's load a weighted network
plot(g)                                                            #Display the network  
g                                                                  #Explore the network data
E(g)$weight <- E(g)$value                                          #The weight of the edges is stored as "value" attribute so we need to work on this

V(g)$degree_w <- strength(g, mode = "all", loops = F)
V(g)$degree_w

V(g)$closeness_w <- closeness(g, normalized = F)
V(g)$closeness_w

V(g)$betweenness_w <- betweenness(g, normalized = F)
V(g)$betweenness_w


#'If you need to calculate the unweighted 
#'closeness and betweenness centrality measures
#'you need to delete the weight attribute
g1 <- delete_edge_attr(g, "weight")
betweenness(g1, normalized = F)
closeness(g1, normalized = F)



#' EXERCISE   --- --- --- --- --- --- --- --- --- --- --- ---
#' 1. Load the data of the inter-organisational network ("edge_list_interorg.csv")
#' 2. Display the network
#' 3. Display degree in terms of node size
#' 4. Color red the node with the highest closeness
#' 5. Color yellow the node with the highest betweenness
#' 6. Export centrality measures as a csv
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---