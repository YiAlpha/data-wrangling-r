#' Draw a Christmas Tree
#'
#' @param bg color of canvas
#' @param mcol  color of title "Merry Christmas"
#' @param tcol color of "for you"
#' @return a christmas tree
#' @examples
#' christ_tree(bg = 'grey', mcol = 'black', tcol = 'blue')
#'
#' @export
#'

# source code:
# http://www.r-bloggers.com/merry-christmas-5/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+RBloggers+%28R+bloggers%29


christ_tree <- function(bg = '#FDF5DC',
                      mcol = 'gold',
                      tcol = "#256F00"){
        # Each row is a 2x2 linear transformation
        # Christmas tree
        L <-  matrix(
                c(0.03,  0,     0  ,  0.1,
                  0.85,  0.00,  0.00, 0.85,
                  0.8,   0.00,  0.00, 0.8,
                  0.2,  -0.08,  0.15, 0.22,
                  -0.2,   0.08,  0.15, 0.22,
                  0.25, -0.1,   0.12, 0.25,
                  -0.2,   0.1,   0.12, 0.2),
                nrow=4)
        # ... and each row is a translation vector
        B <- matrix(
                c(0, 0,
                  0, 1.5,
                  0, 1.5,
                  0, 0.85,
                  0, 0.85,
                  0, 0.3,
                  0, 0.4),
                nrow=2)

        prob = c(0.02, 0.6,.08, 0.07, 0.07, 0.07, 0.07)

        # Iterate the discrete stochastic map
        N = 1e5 #5  #   number of iterations
        x = matrix(NA,nrow=2,ncol=N)
        x[,1] = c(0,2)   # initial point
        k <- sample(1:7,N,prob,replace=TRUE) # values 1-7

        for (i in 2:N)
                x[,i] = crossprod(matrix(L[,k[i]],nrow=2),x[,i-1]) + B[,k[i]] # iterate

        # Plot the iteration history
        par(bg= bg,mar=rep(0,4))
        plot(x=x[1,],y=x[2,],
        col=grep('green',colors(),value=TRUE),
        axes=FALSE,
        cex=.1,
        xlab='',
        ylab='' )#,pch='.')
        bals <- sample(N,20)

        points(x=x[1,bals],y=x[2,bals]-.1,
                       col=c('#E13D3D','#FFB400','#FF7400','#FF005A'),
                       cex=1,
                       pch=19)


        text(x=-.7,y=8.5,
             labels='Merry',
             adj=c(.5,.5),
             srt=45,
             vfont=c('script','plain'),
             cex=3,
             col= mcol
        )
        text(x=0.7,y=8,
             labels='Christmas',
             adj=c(.5,.5),
             srt=-45,
             vfont=c('script','plain'),
             cex=3,
             col= mcol
        )
        text(x=0.6,y=0,
             cex=0.8,
             vfont=c('script','plain'),
             labels="For You",
             col=tcol
        )
}

