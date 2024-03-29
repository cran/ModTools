\name{VarImp}

\alias{GarsonWeights}
\alias{VarImp}
\alias{VarImp.default}
\alias{VarImp.FitMod}

\alias{plot.VarImp}
\alias{print.VarImp}

\title{Variable Importance for Regression and Classification Models}

\description{
Variable importance is an expression of the desire to know how important a variable is within a group of predictors for a particular model. But in general it is not a well defined concept, say there is no theoretically defined variable importance metric. Nevertheless, there are some approaches that have been established in practice for some regression and classification algorithms.
The present function provides an interface for calculating variable importance for some of the models produced by \code{FitMod}, comprising linear models, classification trees, random forests, C5 trees and neural networks. The intention here is to provide reasonably homogeneous output and plot routines.
}

\usage{
VarImp(x, scale = FALSE, sort = TRUE, ...)

\method{VarImp}{FitMod}(x, scale = FALSE, sort = TRUE, type=NULL, ...)
\method{VarImp}{default}(x, scale = FALSE, sort = TRUE, ...)


\method{plot}{VarImp}(x, sort = TRUE, maxrows = NULL,
           main = "Variable importance", ...)

\method{print}{VarImp}(x, digits = 3, ...)

}

\arguments{
  \item{x}{the fitted model}
  \item{scale}{logical, should the importance values be scaled to 0 and 100?}
  \item{\dots}{parameters to pass to the specific \code{VarImp} methods}
   \item{sort}{the name of the column, the importance table should be ordered after}
   \item{maxrows}{the maximum number of rows to be reported}
   \item{main}{the main title for the plot }
   \item{type}{some models have more than one type available to produce a variable importance. Linear models accept one of \code{"lmg"}, \code{"pmvd"}, \code{"first"}, \code{"last"}, \code{"betasq"}, \code{"pratt"}.}
   \item{digits}{ the number of digits for printing the "VarImp" table }
}

\value{
   A data frame with class \code{c("VarImp.train", "data.frame")} for
   \code{VarImp.train} or a matrix for other models.
 }

\details{
 \bold{Linear Models}:  \verb{   } For linear models there's a fine package \pkg{relaimpo} available on CRAN containing several interesting approaches for quantifying the variable importance. See the original documentation.

 \bold{rpart}, \bold{Random Forest}:  \verb{   } \code{VarImp.rpart} and \code{VarImp.randomForest} are wrappers around the importance functions from the \pkg{rpart} or \pkg{randomForest} packages, respectively.

  \bold{C5.0}:  \verb{   } C5.0 measures predictor importance by determining the
percentage of training set samples that fall into all the terminal
nodes after the split. For example, the predictor in the first split
automatically has an importance measurement of 100 percent since all
samples are affected by this split. Other predictors may be used
frequently in splits, but if the terminal nodes cover only a handful
of training set samples, the importance scores may be close to
zero. The same strategy is applied to rule-based models and boosted
versions of the model. The underlying function can also return the
number of times each predictor was involved in a split by using the
option \code{metric="usage"}.

\bold{Neural Networks}:  \verb{   } The method used here is "Garson weights".

\bold{SVM, GLM, Multinom}:  \verb{   } There are no implementations for these models so far.
}

\author{Andri Signorell <andri@signorell.net>}


\references{Quinlan, J. (1992). Learning with continuous classes. Proceedings of
the 5th Australian Joint Conference On Artificial Intelligence,
343-348.}

\keyword{ models }


