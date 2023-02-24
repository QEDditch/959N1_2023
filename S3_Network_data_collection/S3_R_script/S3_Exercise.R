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


#' SOLUTION  --- --- --- --- --- --- --- --- --- --- --- ---
rm(list=ls())
library(igraph)


#' 1. Recreate, in graph, the inter-organisatonal network 
#' examined in the first seminar;
g <- graph.formula(F1-NG1, F1-NG3, F1-NG4, F1-U1, F1-U2, F1-U3,
                   F2-U3, 
                   F3-G2, F3-O2, F3-U3, 
                   F4-NG2, F4-O2, F4-U9, 
                   G1-U7,
                   G2-U7, 
                   NG1-NG3, NG1-U2,
                   NG2-O2, NG2-U8, NG2-U9, 
                   NG3-NG4, 
                   NG4-U1,
                   O1-U7, 
                   U3-U4, U3-U7,
                   U4-U5, U4-U6, 
                   U5-U6)


#' 2. Display this network;
plot(g)


#' 3. Save the network as a PDF file;
setwd("<--DEFINE YOUR WORKING DIRECTORY-->")
pdf("my_network.pdf", width = 6, height = 6)
plot(g)
dev.off()


#' 4. Colour "red" all nodes representing firms and 
#' "green" all the other nodes;
V(g)$color <- "green"
V(g)[V(g)$name == "F1"]$color <- "red"
V(g)[V(g)$name == "F2"]$color <- "red"
V(g)[V(g)$name == "F3"]$color <- "red"
V(g)[V(g)$name == "F4"]$color <- "red"


#' 5. Display the network;
plot(g)                                     #Display the network


#' 6. Save the network as a PDF file;
setwd("<--DEFINE YOUR WORKING DIRECTORY-->")
pdf("my_network_with_colors.pdf", width = 6, height = 6)
plot(g)
dev.off()


#' 7. Save the network as a GML file.
write_graph(g, "my_network.gml", format = "GML")