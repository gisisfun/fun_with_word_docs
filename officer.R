library(officer)
library(magrittr)

my_png <- "Cat-PNG-Image.png"
my_doc <- read_docx('template.docx') 
#styles_info(my_doc)

employee <- c('John Doe','Peter Gynn','Jolie Hope')
salary <- c(21000, 23400, 26800)
startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14'))

cool_data <- data.frame( employee, salary, startdate)

# the formatting you want to use goes here -- check your fonts()
bold_face <- fp_text(font.family='Calibri', font.size=30, bold = TRUE)
#format_page_title <- fp_text(font.family='Goudy Stout', font.size=24)



bold_redface <- update(bold_face, color = "red",italic = TRUE, bold = FALSE)
fpar_ <- fpar(ftext("Helloooo ", prop = bold_face),
              ftext("World", prop = bold_redface ),
              ftext(", how are you?", prop = bold_face ) )

#img.file <- file.path( R.home("doc"), "html", "Cat-PNG-Image.png" )
my_doc <- my_doc %>%
  body_add_img(src = "Cat-PNG-Image.png", width = 5, height = 2, style = "centered") %>% 
  #body_add_fpar("Hello world!", style = "Normal") %>% 
  body_add_fpar(fpar_) %>%
  body_add_par("", style = "Normal") %>% # blank paragraph
  body_add_par("An interesting table", style = "Normal") %>% # blank paragraph
  body_add_table(cool_data, style = "table_template") 

print(my_doc, target = "first_example.docx")