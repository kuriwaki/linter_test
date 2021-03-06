library(datasets)
library(readr)
library(data.table)
library(ggplot2)

df <- anscombe
df$id <- 1:nrow(df)
df <- as.data.frame(df)

long <-  melt(df, id.vars = "id",
              measure.vars = patterns("x", "y"),
              value.name = c("x", "y"),
              variable.name = "dataset")

pp.1 <- ggplot(long, aes(x = x, y = y)) +
  geom_point() +
  facet_wrap(~dataset, ncol = 2, labeller = label_both)
ggsave("anscombe_scatter_ggplot.pdf", pp.1, width = 5, heigh = 3)
