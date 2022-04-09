library(showtext) # Using Fonts More Easily in R Graphs
library(grid)
library(RColorBrewer)

font_add_google("Poppins", "myfont")
showtext_auto()
palette <- brewer.pal(3, "Set1")

radius <- 0.38
strokecol <- "grey50"
linewidth <- 4
fs <- 11

draw_diagram <- function(){
  grid.newpage()
  grid.circle(0.45, 0.5, radius, gp = 
                gpar(col = strokecol,
                     fill = palette[1],
                     alpha = 0.2,
                     lwd = linewidth))
  
  grid.circle(0.55, 0.5, radius, gp =
                gpar(col = strokecol,
                     fill = palette[2],
                     alpha = 0.2,
                     lwd = linewidth))
  
  grid.lines(x = unit(c(0.7731099-0.105, 0.2268901+0.1), "npc"),
             y = unit(c(0.7, 0.7), "npc"))
  
  
  grid.text("Not reachable", 0.5, 0.76, 
            gp = gpar(fontfamily = "myfont",
                      fontsize = fs * 1.1,
                      fontface = "bold"))
  
  grid.text("Sampled population", 0.5, 0.45, 
            gp = gpar(fontfamily = "myfont",
                      fontsize = fs * 1.2,
                      fontface = "bold"))
  
  grid.text("Not eligible\nfor survey", 0.25, 0.6, rot = 45,
            gp = gpar(fontfamily = "myfont",
                      fontsize = fs * 0.8))
  
  grid.text("Not in \nsampling frame", 0.76, 0.6, rot = -45,
            gp = gpar(fontfamily = "myfont",
                      fontsize = fs * 0.8))
  
  grid.text("Sampling frame\npopulation", 0.15, 0.78, rot = 45, gp =
              gpar(fontfamily = "myfont",
                   fontsize = fs * 1.6,
                   col = palette[1],
                   fontface = "bold"))
  
  grid.text("Target\npopulation", 0.85, 0.78, rot = -45, gp =
              gpar(fontfamily = "myfont",
                   fontsize = fs * 1.6,
                   col = palette[2],
                   fontface = "bold"))
  
  
}

draw_diagram()