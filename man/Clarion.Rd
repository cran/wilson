% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clarion.R
\name{Clarion}
\alias{Clarion}
\title{Clarion R6-class definition}
\description{
Use this to create a clarion object.
This object is used by all top-level wilson modules.
}
\section{Constructor}{
 Clarion$new(header = NULL, metadata, data, validate = TRUE)
}

\section{Constructor Arguments}{

\tabular{lll}{
  \strong{Variable} \tab \strong{Return} \cr
  \code{header} \tab A named list. Defaults to NULL. \cr
  \code{metadata} \tab Clarion metadata in form of a data.table. \cr
  \code{data} \tab Data.table according to metadata. \cr
  \code{validate} \tab Logical value to validate on initialization. Defaults to TRUE. \cr
}
}

\examples{
\dontrun{
# initializing a new object
object <- Clarion$new(header, metadata, data, validate = TRUE)

# create a deep copy
object_copy <- object$clone(deep = TRUE)
}

}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{header}}{List of global information regarding the whole experiment.}

\item{\code{metadata}}{Data.table with additional information for each column.}

\item{\code{data}}{Data.table containing experiment result data.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-get_id}{\code{Clarion$get_id()}}
\item \href{#method-get_name}{\code{Clarion$get_name()}}
\item \href{#method-get_delimiter}{\code{Clarion$get_delimiter()}}
\item \href{#method-is_delimited}{\code{Clarion$is_delimited()}}
\item \href{#method-get_factors}{\code{Clarion$get_factors()}}
\item \href{#method-get_level}{\code{Clarion$get_level()}}
\item \href{#method-get_label}{\code{Clarion$get_label()}}
\item \href{#method-validate}{\code{Clarion$validate()}}
\item \href{#method-new}{\code{Clarion$new()}}
\item \href{#method-write}{\code{Clarion$write()}}
\item \href{#method-clone}{\code{Clarion$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-get_id"></a>}}
\if{latex}{\out{\hypertarget{method-get_id}{}}}
\subsection{Method \code{get_id()}}{
Returns name of unique identifier column. Assumes first feature to be unique if not specified.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$get_id()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
Name of the id column.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-get_name"></a>}}
\if{latex}{\out{\hypertarget{method-get_name}{}}}
\subsection{Method \code{get_name()}}{
Returns name of name column. If not specified return unique Id.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$get_name()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
Name of the name column.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-get_delimiter"></a>}}
\if{latex}{\out{\hypertarget{method-get_delimiter}{}}}
\subsection{Method \code{get_delimiter()}}{
Return delimiter used within multi-value fields (no delimiter = NULL).
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$get_delimiter()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-is_delimited"></a>}}
\if{latex}{\out{\hypertarget{method-is_delimited}{}}}
\subsection{Method \code{is_delimited()}}{
Logical whether the given column name is delimited.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$is_delimited(x)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{x}}{Name of the column.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
boolean
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-get_factors"></a>}}
\if{latex}{\out{\hypertarget{method-get_factors}{}}}
\subsection{Method \code{get_factors()}}{
Get factors to all columns.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$get_factors()}\if{html}{\out{</div>}}
}

\subsection{Details}{
Named factors (e.g. factor1="name") will be cropped to their name.
}

\subsection{Returns}{
Returns a data.table columns: key and factor(s) if any.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-get_level"></a>}}
\if{latex}{\out{\hypertarget{method-get_level}{}}}
\subsection{Method \code{get_level()}}{
Get level(s) to given column name(s).
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$get_level(column)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{column}}{One or more column name(s).}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Provide a vector of levels to the given columnnames in column. Returns NA for missing columns and character(0) if column = NULL.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-get_label"></a>}}
\if{latex}{\out{\hypertarget{method-get_label}{}}}
\subsection{Method \code{get_label()}}{
Get label(s) to given column name(s).
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$get_label(column = NULL, sub_label = TRUE, sep = " ")}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{column}}{One or more column name(s).}

\item{\code{sub_label}}{Whether the sub_label should be included.}

\item{\code{sep}}{Separator between label and sub_label.}
}
\if{html}{\out{</div>}}
}
\subsection{Details}{
If a column does not have a label the key is returned.
}

\subsection{Returns}{
Provides a vector of labels (+ sub_label) to the given columnnames in column. Returns NA for missing columns and all labels if column = NULL.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-validate"></a>}}
\if{latex}{\out{\hypertarget{method-validate}{}}}
\subsection{Method \code{validate()}}{
Check the object for inconsistencies.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$validate(solve = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{solve}}{For solve = TRUE try to resolve some warnings.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Initialize a new clarion object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$new(header = NULL, metadata, data, validate = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{header}}{A named list. Defaults to NULL.}

\item{\code{metadata}}{Clarion metadata in form of a data.table.}

\item{\code{data}}{Data.table according to metadata.}

\item{\code{validate}}{Logical value to validate on initialization. Defaults to TRUE.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Clarion object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-write"></a>}}
\if{latex}{\out{\hypertarget{method-write}{}}}
\subsection{Method \code{write()}}{
Save the object as a clarion file.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$write(file)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{file}}{Filename for the file to be written.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Clarion$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
