library(tidyverse)
# 1. Remove all columns you do not need for the analysis 
cdi_rm <- cdi%>%dplyr::select(YearStart,
                              YearEnd,
                              LocationAbbr,
                              LocationDesc,
                              Question,
                              DataValue,
                              DataValueType,
                              Stratification1)%>%
        dplyr::filter(grepl('Binge drinking prevalence among adults aged >= 18 years', Question) & 
                              grepl('Crude Prevalence',DataValueType))

# 2. We are interested in two sets of variables. Select the following variables and remove all others:
table(as.factor(cdi_rm$Question))

cdi_rm <- cdi_rm%>%dplyr::filter(!grepl('among youth|Poverty among women', Question))

table(as.factor(cdi_rm$Stratification1))

head(cdi_rm)

table(cdi_rm$YearEnd - cdi_rm$YearStart)

cdi_rm <- cdi_rm%>%dplyr::select(-YearStart)%>%dplyr::rename(year = YearEnd)

head(cdi_rm)
# 3. Convert the dataset to a tidy data set using the commands from the tidyr package.
cdi_rm <- tidyr::spread(cdi_rm, key = Question, value = DataValue)

head(cdi_rm)
cdi_rm[c(3587, 4023),]
names(cdi)

summary(cdi_rm$DataValue)



cdi_rm <- cdi_rm%>%dplyr::rename(state = LocationDesc,
                                 stateabb = LocationAbbr,
                                 binge_all = `Binge drinking prevalence among adults aged >= 18 years`,
                                 binge_famale = `Binge drinking prevalence among women aged 18-44 years`)



