## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(cgssr)
data(cgss2003)
data(codebook2003_en)
ques_search_en("trust",codebook2003_en)

## ------------------------------------------------------------------------
codebook2003_en$label_en[codebook2003_en$index=='truststr']

## ------------------------------------------------------------------------
table(cgss2003$truststr)

## ---- fig.show='hold'----------------------------------------------------
library(ggplot2)
ggplot(data = cgss2003, aes(truststr)) + 
                    geom_bar() + 
                    xlab("")+
                    ylab("")+
                    ggtitle("Degree of trust in strangers")+
                    theme_classic(base_family = 'Palatino')+
                    theme(plot.title = element_text(hjust = 0.5))

