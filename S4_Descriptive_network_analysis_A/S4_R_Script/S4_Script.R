#'===========================================================================================
#'9595N1: Network Analysis and Infographics
#'Dr. Daniele Rotolo (www.danielerotolo.com)
#'SPRU Science Policy Research Unit, University of Sussex
#'===========================================================================================
#'S4: Descriptive network analysis A
#'===========================================================================================


#0.Remove objects and load igraph ----------
rm(list=ls())
library(igraph)



#1.Diameter  ----------
help("diameter")                                                    #Explore this function

g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)          #Create a network
plot(g)                                                             #Display the network
d_g <- diameter(g, directed = FALSE, unconnected = FALSE)           #Diameter
get.diameter(g)                                                     #Nodes on the diameter



#2.APL  ----------
help("mean_distance")                                               #Explore this function

#Connected network
g1 <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)         #Create a connected network
plot(g1)                                                            #Display the network
apl_g1  <- mean_distance(g1, directed = FALSE, unconnected = FALSE) #APL
dist_g1 <- distances(g1)                                            #Get the distance matrix

#Unconnected network (apl is evalauted on the largest component)
g2 <- graph.formula(1-2, 1-3, 2-3, 3-4, 5-6, 5-7)                   #Create a unconnected network
plot(g2)                                                            #Display the network
apl_g2  <- mean_distance(g2, directed = FALSE, unconnected = TRUE)  #APL
dist_g2 <- distances(g2)                                            #Get the distance matrix



#3.Density  ----------
help("edge_density")                                                #Explore this function

g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)          #Create a network
plot(g)                                                             #Display the network
ed_g <- edge_density(g)                                             #Calculate density



#4.Components  ----------
help("components")                                                  #Explore this function

#Connected network
g1 <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)         #Create a connected network
plot(g1)                                                            #Display the network
comp_g1 <- components(g1)                                           #Calculate the number of components
comp_g1                                                             #Components

#Unconnected network
g2 <- graph.formula(1-2, 1-3, 2-3, 3-4, 5-6, 5-7)                   #Create a unconnected network
plot(g2)                                                            #Display the network
comp_g2 <- components(g2)                                           #Calculate the number of components
comp_g2                                                             #Components                                                  



#5.Cutpoints/Bridges  ----------
help("articulation_points")                                         #Explore this function

g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)          #Create a network
plot(g)                                                             #Display the network
cp_g <- articulation_points(g)                                      #Cutpoints

#'NOTE: There is no specific function in igraph to identify bridges,
#'but a you can get bridges with the below commands
#'num_comp <- length( decompose.graph(g) )
#'for (i in 1:length(E(g)))
#'      {
#'      g_sub <- delete.edges(g, i)
#'      E(g)$color[i] <- ifelse(length(decompose.graph(g_sub)) > num_comp, "red", "black")
#'      }
#'plot(g)



#6.Point/line connectivity  ----------
help("min_cut")                                                    #Explore this function

#Connected network
g1 <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)        #Create a connected network
plot(g1)                                                           #Display the network
pointc_g1 <- min_cut(g1)                                           #Point connectivity

#Unconnected network
g2 <- graph.formula(1-2, 1-3, 2-3, 3-4, 5-6, 5-7)                  #Create a unconnected network
plot(g2)                                                           #Display the network
pointc_g2 <- min_cut(g2)                                           #Point connectivity

#'NOTE: There is no function in igraph to assess line connectivity



#7.Cliques ----------
help("cliques")                                                    #Explore this function
help("count_max_cliques")                                          #Explore this function

g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)         #Create a network
plot(g)                                                            #Display the network
cliques_g <- cliques(g, min = 3)                                   #List of cliques
numcliques_g <- count_max_cliques(g, min = 3)                      #Number of cliques



#8.Inclusiveness ----------
g <- graph.formula(1-2, 1-3, 2-3, 3-4, 6, 7)                       #Create a unconnected network
plot(g)                                                            #Display the network
numisolates_g <- sum(degree(g)==0)                                 #Number of isolates
isolates_g <- V(g)[degree(g)==0]                                   #List of isolates
inclusiveness_g <- (vcount(g)-numisolates_g)/vcount(g)             #Calculate inclusiveness



#9.Reachable pairs ----------
g <- graph.formula(1, 2-3, 4, 2-5, 3-5, 5-6, 7)                    #Create a unconnected network
plot(g)                                                            #Display the network
dist_g <- distances(g)                                             #Get the distance matrix
observed_pairs_g <- (sum(!is.infinite(distances(g)))-vcount(g))/2  #Observed reachable pairs
potentail_pairs_g <- vcount(g)*(vcount(g)-1)/2                     #Potential reachable pairs
reach_g <- observed_pairs_g/potentail_pairs_g                      #Proportion of reachable pairs



#10.Transitivity ----------
help("transitivity")                                               #Explore this function

g <- graph.formula(1, 2-3, 4, 2-5, 3-5, 5-6, 7)                    #Create a Unconnected network
transitivity_g <- transitivity(g, type = "globalundirected")       #Calculate transitivity



#' EXERCISE   --- --- --- --- --- --- --- --- --- --- --- ---
#' 1. Load the network data from "edge_list_interorg.csv"
#' 2. Display the network
#' 3. Assess all the 10 network-level measures introduced above
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---