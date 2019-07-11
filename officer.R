  library(officer)
  library(magrittr)
  library(png)
  my_png <- "Cat-PNG-Image.png"
  my_doc <- read_docx() 
  styles_info(my_doc)
  my_doc <- my_doc %>%
    body_add_img(src = "Cat-PNG-Image.png", width = 5, height = 2, style = "centered") %>% 
    body_add_par("Hello world!", style = "Normal") %>% 
    body_add_par("", style = "Normal") %>% # blank paragraph
    #body_add_table(iris, style = "table_template")
  print(my_doc, target = "first_example.docx")