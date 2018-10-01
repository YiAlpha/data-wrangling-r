
# 1. Remove all columns you do not need for the analysis 
cdi_rm <- cdi%>%dplyr::select(YearStart,
                              YearEnd,
                              LocationAbbr,
                              LocationDesc,
                              Question,
                              DataValue,
                              DataValueType,
                              Stratification1)%>%
        dplyr::filter(Question %in% c('Binge drinking prevalence among adults aged >= 18 years', 'Poverty') 
                      & DataValueType == 'Crude Prevalence')%>%dplyr::select(-DataValueType)


cdi_rm <- cdi_rm%>%dplyr::filter(Stratification1 %in% c('Overall', 'Male', 'Female' ))
                              
head(cdi_rm[, 5:7])

cdi_tidy <- cdi_rm%>% unite(category, Question, Stratification1) %>%
        spread(key = category, value = DataValue)

head(cdi_tidy)
cdi_tidy <- cdi_tidy%>%dplyr::select(-YearStart, -Poverty_Female, -Poverty_Male)%>%
        dplyr::rename(state = LocationDesc,
                      stateabb = LocationAbbr,
                      year = YearEnd,
        binge_all = `Binge drinking prevalence among adults aged >= 18 years_Overall`,
        binge_male = `Binge drinking prevalence among adults aged >= 18 years_Male`,
        binge_famale = `Binge drinking prevalence among adults aged >= 18 years_Female`,
        poverty = Poverty_Overall)
 
table(is.na(cdi_tidy$binge_famale)) 

write.csv(cdi_tidy, "binge_clean.csv")


