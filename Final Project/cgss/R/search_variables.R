#' Search variables in the Chinese Codebook
#' with keywords in the question.
#'
#' @description Function to find variables with Chinese keyworks
#' in question among the Chinese General Social Survey.
#'
#' @param keyword Character string of keyword to match the question.
#' @param codebook the codebook
#'
#' @return a tibble including\code{index} the index of matched question,
#' \code{question}, the complete question.
#' @examples
#' data(codebook2003)
#' ques_search_cn("信任", codebook2003_cn)
#'
#' @export
#'

ques_search_cn<-function(keyword, codebook){
        codebook[stringr::str_detect(codebook$question, keyword),1:2]
}

#' Search variables in the English Codebook
#' with keywords in the question.
#'
#' @description Function to find variables with English keyworks
#' in question among the Chinese General Social Survey.
#'
#' @param keyword Character string of keyword to match the question.
#' @param codebook the codebook
#'
#' @return a tibble including\code{index} the index of matched question,
#' \code{question}, the complete question.
#' @examples
#' data(codebook2003_en)
#' ques_search_en("trust", codebook2003_en)
#'
#' @export
#'

ques_search_en<-function(keyword, codebook){
        codebook[stringr::str_detect(codebook$question_en, keyword),1:2]
}



