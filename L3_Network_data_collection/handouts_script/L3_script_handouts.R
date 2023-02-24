#=================================================================================
# 9595N1: Network Analysis and Infographics
# Dr. Daniele Rotolo (www.danielerotolo.com)
# SPRU Science Policy Research Unit, University of Sussex
#=================================================================================
# L3 - Data collection
#=================================================================================


#1.Remove objects  ---------- 
rm(list=ls())


#2.Variable analysis: Data examples  ---------- 
data()
Orange
plot(Orange$age, 
     Orange$circumference)


#2.Network analysis: Network data examples  ---------- 
library(igraphdata)
library(igraph)
data(UKfaculty)
UKfaculty
get.adjacency(UKfaculty)
ll <- layout_with_kk(UKfaculty)
plot(UKfaculty,
     layout = ll,
     vertex.size = 10,
     edge.arrow.size = 0.1)


#3.Two mode network: Example  ---------- 
library(tidyverse)
library(readr)
setwd("YOUR WORKING DIRECTORY")
PR <- read_csv("proj_org.csv") %>%
  separate_rows(Partners, 
                sep = ";")
PO <- table(PR$Project, 
            PR$Partners)
OO <- t(PO)%*%PO
PP <- PO%*%t(PO)

