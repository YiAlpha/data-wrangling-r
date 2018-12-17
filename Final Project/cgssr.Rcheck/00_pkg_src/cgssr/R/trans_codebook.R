#' Use Google Translation API to translate all the
#' question and answer label into English.
#' Build Chinese General Social Survey codebook in both
#' English and Chinese version.
#'
#' @description Translate the codebook data based on \code{\link{trans_data}}
#' in the data folder, into English, via Googld Translation API.
#' Save formatted codebook to data folder.
#'
#' @source \href{https://cloud.google.com/translate/docs/}{Google Translation API}
#'
#' @param cbn  File name of the codebook data in the folder
#'
#' @return English and Chinese version of codebook contaning all the question
#' and answer labels in the survey. Save into data folder.
#'
#'

# require(tidyverse)
# require(googleLanguageR)

### Translate ===========================

codebook_trans<-function(cbn){
        require(tidyverse)
        require(googleLanguageR)

        # Translate codebook question and answer labels to English-------------
        cb <- get(cbn)%>%
                mutate(question = as.character(question))%>%
                mutate(question_en= map_chr(question, ~gl_translate(., target = "en")$translatedText))%>%
                mutate(label_ch = as.character(answer_labels))%>%
                mutate(label_en = map_chr(label_ch, ~gl_translate(., target = "en")$translatedText))%>%
                select(-answer_labels)
        # Return English codebook-------------
        assign(paste0(cbn, "_en"),
               cb%>%select(index, ends_with('_en')), envir=.GlobalEnv)
        # Return Chinese codebook-------------
        assign(paste0(cbn, "_cn"),
               cb%>%select(index, question, label_ch), envir=.GlobalEnv)

}

#' Save English and Chinese Codebook
#'
#' @description Save cleaned codebook to data folder
#'
#' @param cbn  File name of the codebook data in the folder
#'
#' @return save to data folder
#'
#'
### Save English and Chinese Codebook =====================
save_trans_code<-function(cbn){
        save(list = c(paste0(cbn, "_en")),
             file=paste0("./data/", sprintf("%s.rda", paste0(cbn, "_en"))))
        save(list = c(paste0(cbn, "_cn")),
             file=paste0("./data/", sprintf("%s.rda", paste0(cbn, "_cn"))))

}


###  Translate all the codebook ---------------------
# cb_list = paste0('./data/',codes, '.rda')
# for(i in 1:length(cb_list)) load(cb_list[[i]])
#
# codes <- paste0("codebook",rep("20", 11),
#                 c('03', '05', '06', '06b', '08', '08b',10, 11, 12,13,15))
#
# purrr::map(codes, codebook_trans)
# purrr::map(codes, save_trans_code)
