
slices <- c(5, 2, 5)
lbls   <- c("SD", "STP", "SIM")
lbls   <- paste(lbls, "\n", "(", round(slices/29*100, 0), "%)", sep="")
colors <- c("#a6dba0", "#abd9e9", "grey", "white")

pdf('pie.pdf', width = 3, height = 3)
par(mar=c(0,0,0,0))
pie(slices, labels = lbls, radius = 0.8, cex = 0.7, col = colors )
dev.off()
