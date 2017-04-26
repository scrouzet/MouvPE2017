library(pdftools)
library(stringr)
source("myfunctions.R")

# PARAMETRES
region    = "Midi-Pyrenees France"  # to be added to the address
startpage = 3                        # exlusion des 1eres pages car pas compris
filename  = "liste_postes-31.pdf"
list_interet = c("ENS.CL.MA","ENS.CL.ELE","T.R.S.") # type de poste a extraire

# Extract all the content of the pdf as txt
txt <- pdf_text(filename)

# initialize ecole as a list (to be later converted to a data.frame)
ecole = list(commune=c(), id=c(), nom=c(), adresse=c(), ien=c(), niveau=c(), descriptif=c(), page=c(), 
             ENS.CL.MA_nbV = c(),  ENS.CL.ELE_nbV = c(),  T.R.S._nbV = c(),
             ENS.CL.MA_nbSV = c(), ENS.CL.ELE_nbSV = c(), T.R.S._nbSV = c())

# loop over pages
ec=1
for ( npage in c(startpage:length(txt)) ) {
  mypage = strsplit(txt[npage], split="\n")
  mypage = mypage[[1]]
  
  # Extract the cell locations in this page
  mysplit = "I-----------------------------------I"
  list_ligne = c()
  for ( ligne in c(1:length(mypage)) ) {
    cellbegin = gregexpr(mysplit,mypage[ligne])
    if ( cellbegin[[1]][1] > 0 ) {
      list_ligne = c(list_ligne,ligne) 
    }
  }
  list_ligne = list_ligne+1
  
  # Extract the content of each cell and put it in a data.frame
  for ( cell in c(1:length(list_ligne)) ) {
    
    school_id = cleanMyString(mypage[list_ligne[cell]+1])
    valid_school_id = str_sub(school_id,1,1)=="*";
    
    # if the cell appears valid
    if (!is.na(valid_school_id) & length(valid_school_id)>0 & valid_school_id==T) {
      ecole$commune[ec] = cleanMyString(mypage[list_ligne[cell]])
      ecole$id[ec]      = school_id
      ecole$nom[ec]     = cleanMyString(mypage[list_ligne[cell]+2]) # E.M.PU mater et E.E.PU elementaire + nom ecole
      ecole$adresse[ec] = paste(cleanMyString(mypage[list_ligne[cell]+3]), ecole$commune[ec], region) # adresse
      ecole$ien[ec]     = cleanMyString(mypage[list_ligne[cell]+4]) # surement la circonscription
      
      ecole$niveau[ec] = str_trim( str_sub(ecole$nom[ec],1,6) )
      
      numid = 0
      li = list_ligne[cell]+5
      mydescriptif = ""
      while (!is.na(numid)) {
        myline = mypage[li]
        numid = as.numeric(str_sub(myline,8,11))
        if (is.na(numid)){
          break
        } else
          mydescriptif = paste(mydescriptif,cleanMyString(myline),sep=";") # store le paquet de texte au cas ou
        
        jobstr = str_trim(str_sub(myline,12,21))
        if (!is.na(match(jobstr,list_interet))) {
          # Extract number of positions available or supposedly available
          ecole[[paste0(jobstr,"_nbV")]][ec]  = as.numeric( str_sub(myline,49,53) ) # nb.V
          ecole[[paste0(jobstr,"_nbSV")]][ec] = as.numeric( str_sub(myline,57,61) ) # nb.SV
        }
        
        li=li+1
      }
      ecole$descriptif[ec] = mydescriptif
      ecole$page[ec] = npage
      ec=ec+1
    }
  }
}

# Convert to a proper data.frame
data.ecole <- data.frame( do.call("cbind", ecole) )
data.ecole$id <- as.character(data.ecole$id)
data.ecole$nom <- as.character(data.ecole$nom)
data.ecole$adresse <- as.character(data.ecole$adresse)

# Save to csv
write.table(data.ecole,file="dataecole.csv", quote = F, sep = ",", row.names = F)