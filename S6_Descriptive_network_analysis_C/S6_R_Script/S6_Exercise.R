#' EXERCISE   --- --- --- --- --- --- --- --- --- --- --- ---
#' 1. Load the data of the inter-organisational network ("edge_list_interorg.csv")
#' 2. Display the network
#' 3. Display constraint in terms of node size
#' 4. Color red the node with the highest constraint
#' 5. Calculate the effective network size of each node
#' 6. Calculate the extent to which universities brokers with other types of organisations
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

#' SOLUTION  --- --- --- --- --- --- --- --- --- --- --- ---
rm(list=ls())
library(igraph)
setwd("<--DEFINE YOUR WORKING DIRECTORY-->")


#' 1. Load the data of the inter-organisational network ("edge_list_interorg.csv")
df <- read.csv("edge_list_interorg.csv", header = T)               #Read network data as edge list
g  <- graph_from_data_frame(df, directed = FALSE)                  #Transform data into a network

#' 2. Display the network
plot(g)                                                            #Display the network

#' 3. Display constraint in terms of node size
V(g)$constraint <- constraint(g)                                    #Constraint (as anode attribute)
V(g)$size <- V(g)$constraint*10                                     #Constraint in terms of size of nodes * 10
plot(g)                                                             #Display the network

#' 4. Color red the node with the highest constraint
V(g)$color <- ifelse(V(g)$constraint == max(V(g)$constraint),      #Color red nodes with the max value of constraint 
                     "red", "lightblue")
plot(g)                                                            #Display the network 

#' 5. Calculate the effective network size of each node
V(g)$effective_net <- influenceR::ens(g)                            #Effective network size (as anode attribute)                                                          

#' 6. Calculate the extent to which universities brokers with other types of organisations
V(g)
V(g)$type <- ifelse(grepl("U", V(g)$name), 1, 0)                    #We assign 1 to all universities and 0 other organisation types 
                                                                    #I suggest to spend some time to learn regular expressions in R

G <- get.adjacency(g, sparse = F)                                   #Get the adjacency matrix

br <- sna::brokerage(G, V(g)$type)                                  #Calculate brokerage measures
summary(br)                                                         #Summarize brokerage measures


