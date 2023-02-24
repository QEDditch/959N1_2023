#' EXERCISE   --- --- --- --- --- --- --- --- --- --- --- ---
#' 1. Load the network data from "edge_list_interorg.csv"
#' 2. Display the network
#' 3. Assess all the 10 network-level measures introduced above
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---


#' SOLUTION  --- --- --- --- --- --- --- --- --- --- --- ---
rm(list=ls())
library(igraph)
setwd("<--DEFINE YOUR WORKING DIRECTORY-->")

#' 1. Load the network data from "edge_list_interorg.csv"
df <-  read.csv("edge_list_interorg.csv", header = T)               #Read network data as edge list
g  <- graph_from_data_frame(df, directed = FALSE)                   #Transform data into a network

#' 2. Display the network
plot(g)                                                             #Display the network

#' 3. Assess all the 10 network-level measures introduced above
d_g <- diameter(g)                                                  #Diameter

apl_g <- mean_distance(g, directed = FALSE, unconnected = FALSE)    #APL

ed_g <- edge_density(g)                                             #Density

comp_g <- components(g)                                             #Components

cp_g <- articulation_points(g)                                      #Cupoints

pointc_g <-min_cut(g)                                               #Point connectivity

cliques_g <- cliques(g, min = 3)                                    #List of cliques
numcliques_g  <- count_max_cliques(g, min = 3)                      #Number of cliques

numisolates_g   <- sum(degree(g)==0)                                #Number of isolates
list_isolates_g <- V(g)[degree(g)==0]                               #List of isolates
inclusiveness_g <- (vcount(g)-numisolates_g)/vcount(g)              #Inclusiveness

observed_pairs_g  <- (sum(!is.infinite(distances(g)))-vcount(g))/2  #Observed reachable pairs
potentail_pairs_g <- vcount(g)*(vcount(g)-1)/2                      #Potential reachable pairs
reach_g <- observed_pairs_g/potentail_pairs_g                       #Proportion of reachable pairs

transitivity_g <- transitivity(g, type = "globalundirected")        #Transitivity