#' ===========================================================================================
#' 9595N1: Network Analysis and Infographics
#' Dr. Daniele Rotolo (www.danielerotolo.com)
#' SPRU Science Policy Research Unit, University of Sussex
#' ===========================================================================================
#' S6: Descriptive network analysis C
#' ===========================================================================================


#0.Remove objects, install InfluenceR and sna packages, load igraph ----------
rm(list=ls())
install.packages("sna")                                             #We need a package called "sna"
install.packages("influenceR")                                      #We need a package called "influenceR"
library(igraph)



#1.Constraint  ----------
help("constraint")                                                  #Explore this function

g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)          #Create a network
plot(g)                                                             #Display the network

V(g)$constraint <- constraint(g)                                    #Constraint (as anode attribute)
g                                                                   #Constraint is now an attribute of the network

V(g)$size <- V(g)$constraint                                        #Constraint in terms of size of nodes
plot(g)                                                             #Display the network
V(g)$size <- V(g)$constraint*20                                     #Constraint in terms of size of nodes * 10
plot(g)                                                             #Display the network



#2.Effective network size  ----------
g <- graph.formula(1-2, 1-3, 2-3, 3-4, 2-5, 3-5, 5-6, 5-7)          #Create a network
plot(g)                                                             #Display the network

help("ens")                                                         #Explore this function

V(g)$effective_net <- influenceR::ens(g)                            #Effective network size (as anode attribute)
g                                                                   #Effective network size is now an attribute of the network

V(g)$size <- V(g)$effective_net                                     #Effective network size in terms of size of nodes
plot(g)                                                             #Display the network
V(g)$size <- V(g)$effective_net*10                                  #Effective network size in terms of size of nodes * 50
plot(g)                                                             #Display the network



#3.Brokerage measure  ----------
g <- graph.formula("F1"-"U2", "F1"-"F2", "F2"-"U2",                 #Create a network
                   "U3"-"U2", "U2"-"F3", "U4" - "F1")  
plot(g)

help("brokerage")                                                   #Explore this function

V(g)
V(g)$type <- c(1, 2, 1, 2, 1, 2)                                    #Attribute on the type of organisation (class membership)

V(g)$color <- ifelse(V(g)$type == 1,"pink", "lightblue")
plot(g)

G <- get.adjacency(g, sparse = F)                                   #Get the adjacency matrix

br <- sna::brokerage(G, V(g)$type)                                  #Calculate brokerage measures
summary(br)                                                         #Summarize brokerage measures



#' EXERCISE   --- --- --- --- --- --- --- --- --- --- --- ---
#' 1. Load the data of the inter-organisational network ("edge_list_interorg.csv")
#' 2. Display the network
#' 3. Display constraint in terms of node size
#' 4. Color red the node with the highest constraint
#' 5. Calculate the effective network size of each node
#' 6. Calculate the extent to which universities brokers with other types of organisations
#' --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---