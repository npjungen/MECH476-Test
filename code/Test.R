library(DT)
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(hrbrthemes)
library(shiny)
library(shinythemes)


data("mtcars")
head(mtcars)


mtcars2 <- within(mtcars, {
  vs <- factor(vs, labels = c("V-shaped", "Straight"))
  am <- factor(am, labels = c("Automatic", "Manual"))
  cyl  <- factor(cyl)
  gear <- factor(gear)
})


theme_set(theme_ft_rc())


p1 <- ggplot(mtcars2) +
  geom_point(aes(x = wt, y = mpg, colour = gear)) +
  labs(
    title = "Fuel economy declines as weight increases",
    subtitle = "(1973-74)",
    caption = "Data from the 1974 Motor Trend US magazine.",
    tag = "Figure 1",
    x = "Weight (1000 lbs)",
    y = "Fuel economy (mpg)",
    colour = "Gears"
  )
p2 <- p1 + facet_grid(vs ~ am)


p1
p2


shinytheme("cyborg")
datatable(mtcars2)
