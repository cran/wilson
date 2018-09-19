library(shiny)
library(shinydashboard)
source("../R/and.R")
source("../R/orNumeric.R")
source("../R/orTextual.R")
source("../R/featureSelector.R")
source("../R/function.R")
source("../R/global.R")
source("../R/clarion.R")
source("../R/sampleSelector.R")

source("../R/parser.R")

set.seed(1103)

# test data
data <- data.table::as.data.table(mtcars, keep.rowname = "id")
# create metadata
metadata <- data.table::data.table(names(data), level = c("feature", rep("sample", 7), rep("condition", 4)))
names(metadata)[1] <- "key"
clarion <- Clarion$new(data = data, metadata = metadata)

layer_data <- data.table::data.table(id = names(mtcars)[1:7],
                                     group = c(rep("engine", 4), rep("chassis", 2), "other"),
                                     importance = 1:7,
                                     sample_1 = runif(7, 0, 100),
                                     sample_2 = runif(7, 0, 100))
layer_metadata <- data.table::data.table(names(layer_data), level = c(rep("feature", 3), rep("sample", 2)))
names(layer_metadata)[1] <- "key"
layer <- Clarion$new(data = layer_data, metadata = layer_metadata)

# combine clarion objects
clarion$add_layer("layer name", layer)

# clarion <- parser("../../clarion/New folder/wu_fData_wu_CPM.clarion")

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(
                      verbatimTextOutput("filter")
                    ), dashboardBody(fluidPage(
                      sampleSelectorUI(id = "id")
                    )))


server <- function(input, output) {

  mod <- callModule(sampleSelector, "id", clarion = clarion)

  output$filter <- renderText({
    paste(mod()$filter, collapse = "\n")
  })

  observe({
    print(mod()$object$header)
    print(mod()$object$metadata)
    print(mod()$object$data)
  })

}

# Run the application
shinyApp(ui = ui, server = server)