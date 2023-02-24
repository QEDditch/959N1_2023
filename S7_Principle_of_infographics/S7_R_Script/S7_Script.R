#'===========================================================================================
#'9595N1: Network Analysis and Infographics
#'Dr. Daniele Rotolo (www.danielerotolo.com)
#'SPRU Science Policy Research Unit, University of Sussex
#'===========================================================================================
#'S7: Principles of infogrpahics
#'===========================================================================================


#1.Remove objects and load igraph ----------
rm(list=ls())
library(igraph)
library(readr)


#2.Load the data of the inter-organisational network ("edge_list_interorg.csv") ----------
setwd("<--DEFINE YOUR WORKING DIRECTORY-->")
df <- read_csv("edge_list_interorg.csv")                           #Read network data as edge list
g  <- graph_from_data_frame(df, directed = FALSE)                  #Transform data into a network
plot(g)                                                            #Display the network


#3.Let's try different layouts ----------
#Remember to explore the help guide of each function 
#for options that can improve your visualisation
l_random <- layout.random(g)                                        #Random layout
plot(g, layout = l_random)                                          #Display the network

l_circle <- layout.circle(g)                                        #Circle layout
plot(g, layout = l_circle)                                          #Display the network

l_grid <- layout_on_grid(g, width = 3)                              #Grid layout
plot(g, layout = l_grid)                                            #Display the network

l_kk <- layout_with_kk(g)                                           #Kamada-Kawai layout
plot(g, layout = l_kk)                                              #Display the network

l_fr <- layout_with_fr(g)                                           #Fruchterman Reingold layout
plot(g, layout = l_fr)                                              #Display the network

l_nicely <- layout_nicely(g)                                        #igraph finds the best layout
plot(g, layout = l_nicely)                                          #Display the network

l_opt <- layout_with_graphopt(g, niter = 500, charge = 0.0001, mass = 25)     #Customised force-directed algorithm (useful for very large graphs)
plot(g, layout = l_opt)                                                       #Display the network


#4.Export your visualisation ----------
#You can export figures also as png, jpeg, tiff
#see the help guide for "png"
pdf('network_1.pdf', width = 6, height = 6)
par(mfrow=c(1, 1), mar=c(0,0,0,0))
plot(g, layout = l_nicely)  
dev.off()

pdf('network_2.pdf', width = 18, height = 6)
par(mfrow=c(1, 3), mar=c(0,0,0,0))
plot(g, layout = l_circle)  
plot(g, layout = l_grid) 
plot(g, layout = l_nicely)  
dev.off()


#5. 3d and interactive visualisations: two (of a billion) possible options
library(threejs)
l_fr3 <- layout_with_fr(g, dim = 3)                       #Fruchterman Reingold 3d layout
graphjs(g, layout = l_fr3)                                #Needs to be exported as webpage and opened in an HTML reader (browser)


library(networkD3)    
simpleNetwork(df, height="100px", width="100px")          #Nodes can be repositioned from the viewer
