#' Transform General Social Survey Source Data to rda format.
#'
#' @description With the source file name of General Social Survey,
#' it read the stata format source data, save it to .rda format.
#' And it extract the question and the answer labels, store those
#' metadata to codebook in a .rda format, for convenient reference
#' when using the General Social Survey data. \code{\link{trans_codebook}}
#' would translate the codebook and organize the metadata into both
#' English and Chinese Version.
#'
#' @source \href{http://cnsda.ruc.edu.cn}{Chinese National Survey Data Archive}
#' @source \href{http://cgss.ruc.edu.cn}{Chinese General Social Survey Project}
#'
#' @param var.name  File name of the source data to be read
#' @param code.name File name of the codebook data to be written
#'
#' @return .rda formate of source daata and codebook, save into data folder.
#'
#'

dta2r<-function(var.name, code.name){
        require(haven)
        require(tidyverse)

        # Read dta--------------------------------------------
        assign(var.name, haven::read_stata(paste0("./raw_data/",var.name,".dta")))

        # create chinese codebook ----------------------------
        question <- map(get(var.name), ~ attr(., "label"))
        meaning<- map(get(var.name), ~ attr(., "labels"))%>%tibble()
        colnames(meaning)<-"answer_labels"

        assign(code.name, tibble(index = colnames(get(var.name)),
                                 question = map(get(var.name), ~ attr(., "label")))%>%
                       bind_cols(meaning))

        # save into r data  ----------------------------------
        save(list = c(var.name), file=paste0("./data/", sprintf("%s.rda", var.name)))
        save(list = c(code.name), file=paste0("./data/",sprintf("%s.rda", code.name)))
}


# dtas <- paste0("cgss",rep("20", 11),
#                c('03', '05', '06', '06b', '08', '08b',10, 11, 12,13,15))
#
# codes <- paste0("codebook",rep("20", 11),
#                c('03', '05', '06', '06b', '08', '08b',10, 11, 12,13,15))
#
# purrr::map2(dtas, codes, dta2r)




