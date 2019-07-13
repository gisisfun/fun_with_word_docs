#word doc bits
library(officer)
library(magrittr)
#api bits
library(httr)
library(jsonlite)

full_api_url <- 'https://api.openweathermap.org/data/2.5/weather?q=Canberra,AUS&mode=json&units=metric&APPID=baa'

getdata <- GET(url=full_api_url)

tempdata <- fromJSON(content(getdata,type="text"))  
  
my_png <- "Cat-PNG-Image.png"
my_doc <- read_docx('template.docx') 
#styles_info(my_doc)
Para_text <- paste0("hello World! min temp for ",tempdata$name," is ",tempdata$main$temp_min," and max ",tempdata$main$temp_max)
my_doc <- my_doc %>%
  body_add_img(src = "Cat-PNG-Image.png", width = 5, height = 2, style = "centered") %>% 
  body_add_par(Para_text, style = "Normal") %>% 
  body_add_par("", style = "Normal") %>% # blank paragraph %>%
  #body_add_table(iris, style = "table_template")
  body_end_section_portrait() %>%
  body_end_section_landscape()
print(my_doc, target = "first_example.docx")
