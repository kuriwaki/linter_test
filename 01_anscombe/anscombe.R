library(datasets)
library(readr)
library(data.table)

df=anscombe
df$id <- 1:nrow(df)

long <-  melt(as.data.table(df), id.vars = "id", 
              measure.vars = patterns("x", "y"),
              value.name = c("x", "y"),
              variable.name = "dataset")

library(ggplot2)
ggplot(long, aes(x = x, y = y)) + 
  geom_point() +
  facet_wrap(~dataset, ncol = 2, labeller = label_both)
ggsave("anscombe_scatter_ggplot.pdf", width = 5, heigh = 3)
