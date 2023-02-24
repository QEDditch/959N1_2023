#'===========================================================================================
#'9595N1: Network Analysis and Infographics
#'Dr. Daniele Rotolo (www.danielerotolo.com)
#'SPRU Science Policy Research Unit, University of Sussex
#'===========================================================================================
#'S3: Network data collection -- Network data in igraph
#'===========================================================================================


#1.Remove objects and loading packages ---------- 
rm(list=ls())
library(igraph)



#2.Create an UNDIRECTED network, explore, and plot it  ----------
g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)  #List of edges
g                                                           #Explore the network
V(g)                                                        #Nodes
E(g)                                                        #Edges
get.adjacency(g)                                            #Adjacency matrix
plot(g)                                                     #Display the network



#3.Create a DIRECTED network, explore, and plot it  ----------
g <- graph.formula(1-+2, 1+-3, 2++3, 3-+4, 2-+5, 3+-5, 5++6, 5++7)  #List of arcs
g                                                                   #Explore the network
V(g)                                                                #Nodes
E(g)                                                                #Edges
get.adjacency(g)                                                    #Adjacency matrix
plot(g)                                                             #Display the network



#4.Create a DIRECTED network, explore, and plot it (using names)  ----------
g <- graph.formula("Sam"-+"Nick", "Sam"+-"Sara", "Sara"+-"Nick",
                   "Mary"++"Nick", "Nick"+-"Tom")                   #List of arcs
g                                                                   #Explore the network
V(g)                                                                #Nodes
E(g)                                                                #Edges
get.adjacency(g)                                                    #Adjacency matrix
plot(g)                                                             #Display the network



#5.Add nodes and edges  ----------
g1 <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)  #Create a network as a list of edges
g2 <- g1 + vertices(c(8,9)) + edges(c(8,9), c(1,8))          #Add nodes and edges
plot(g2)                                                     #Display the network



#6.Select subgraphs  ----------
g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)  #Create a network as a list of edges
plot(g)                                                     #Display the network
g_sub <- induced_subgraph(g, c(1,2,3,5))                    #Subgraph on the basis of nodes
plot(g_sub)                                                 #Display the network



#7.Change noodes and edges' color and size/width  ----------
g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)  #Create a network as a list of edges
plot(g)                                                     #Display the network

V(g)$color <- "lightblue"                                   #Assign a color to nodes -- see http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
V(g)$size <- 25                                             #Change node size
plot(g)                                                     #Display the network

E(g)$color <- "red"                                         #Assign a color to edges
E(g)$width <- 4                                             #Change edge width
plot(g)                                                     #Display the network

V(g)[5]$color <- "white"                                    #Color a specific node
E(g)[5 %--% 7]$color <- "green"                             #Color a specific edge
plot(g)                                                     #Display the network



#8.Assign attibutes to nodes and plot the network with these attributes  ----------
g <- graph.formula("Sam"-"Nick", "Sam"-"Sara", "Sara"-"Nick",
                   "Mary"-"Nick", "Nick"-"Tom")                   #List of arcs
g                                                                 #Explore the network
V(g)                                                              #Nodes

V(g)$gender <- c("Male", "Male", "Female", "Female", "Male")      #Assign a vector with gender information (attributes)

V(g)[V(g)$gender == "Male"]$color    <- "lightblue"               #Use the attribute (gender) to color nodes
V(g)[V(g)$gender == "Female"]$color  <- "pink" 
plot(g)

E(g)$width <- c(1, 5, 3, 5, 6)                                    #Assign a vector of different edge width (strength)
plot(g)                                                           #Display the network

E(g)$color <- ifelse(E(g)$width < 5, "red", "blue")               #Color edges on the basis of their width (strength)    
plot(g)                                                           #Display the network



#9.Save and load a network  ----------
setwd("<--DEFINE YOUR WORKING DIRECTORY-->")

write_graph(g, "network_with_names.gml", format = "gml")          #Save network data in GML

my_g <- read_graph("network_with_names.gml", format = "gml")      #Read network data in GML
plot(my_g)                                                        #Display the network



#10.Read the network from an edgelist  ----------
library(readr)
df <- read_csv("example_edge_list.csv")
g  <- graph_from_data_frame(df, directed = F)
plot(g)



#11.From dataframe to graph  ----------
library(tidyverse)                                                      #A library for data wrangling
PR <- read_csv("proj_org.csv") %>% separate_rows(Partners, sep = ";")   #Read dataframe and convert it to long format
PO <- as.matrix(table(PR$Project, PR$Partners))                         #Obtain project-organisation matrix from dataframe
OO <- t(PO)%*%PO                                                        #Adjacency matrix (organisation-organisation)
PP <- PO%*%t(PO)                                                        #Adjacency matrix (project-project)



#12.Organisation network  ----------
diag(OO) <- 0                                                           #Set diagonal to 0 (no self-loops)
OO_g <- graph_from_adjacency_matrix(OO, mode = "undirected")            #Obtain graph from adjacency matrix
plot(OO_g)                                                              #Plot network



#13.Project network  ----------
diag(PP) <- 0                                                           #Set diagonal to 0 (no self-loops)
PP_g <- graph_from_adjacency_matrix(PP, mode = "undirected")            #Obtain graph from adjacency matrix
plot(PP_g)                                                              #Plot network



#14.Back from adjacency matrix to dataset and edgelist   ----------
OO_df <- igraph::as_data_frame(OO_g, what = "both")                     
OO_df$vertices                                                          #Network as list of nodes with attributes
OO_df$edges                                                             #Network as list of edges 



#' EXERCISE   --- --- --- --- --- --- --- --- --- --- --- ---
#' 1. Recreate, in graph, the inter-organisatonal network 
#' examined in the first seminar;
#' 2. Display this network;
#' 3. Save the network as a PDF file;
#' 4. Colour "red" all nodes representing firms and 
#' "green" all the other nodes;
#' 5. Display the network;
#' 6. Save the network as a PDF file;
#' 7. Save the network as a GML file.
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---