
#remove package description info from the item, using a reduced dataset
sdf_g5 <- sdf_g %>%
  group_by(ITEM) %>%
  summarize(ph = sum(UNIT_SALES))


sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('  ',' ',ITEM, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('JUG','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('1','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('8','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('CONTOUR','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('WRAP','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('LIQUID','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('2','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('9','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('CONTAINER','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('SMALL','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('3','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('PER','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('TRAY','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub(' X','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('4','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('CALORIES','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('IN','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('CUP','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('5','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('LOW','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('.','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('6','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('PER','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('0','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('7','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('PPR','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub(' CL ','',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% mutate(ITEM2 = trimws(gsub('RED RED','RED',ITEM2, fixed=TRUE)))
sdf_g5 <- sdf_g5 %>% subset(select = -c(UNIT_SALES))

# merge item description back
sdf_g <- sdf_g %>%
  left_join(sdf_g5, by = "ITEM")

sdf_g <- sdf_g %>% subset(select = -c(ITEM))
t1 <- colnames(sdf_g)
t1[length(t1)] <- "ITEM"
colnames(sdf_g) <- t1
rm(sdf_g5)


# group by new unique item descriptions
sdf_gJ <- sdf_g %>%
  group_by(ITEM) %>%
  summarize(B=first(BRAND))

d <- read.csv('wordList.csv')
d <- d$d
nC <- ncol(sdf_gJ)

# sort d by descending length of word
x <- nchar(d)
d <- d[order(-x)]

ITEMbackup <- sdf_gJ$ITEM
t1 <- colnames(sdf_gJ)
for (ii in 1:length(d)) {
  sdf_gJ[,nC+ii] <- 0
  sdf_gJ[grep(d[[ii]], sdf_gJ$ITEM),nC+ii] <- 1
  sdf_gJ$ITEM <- gsub(d[[ii]],"",sdf_gJ$ITEM) # remove word from ITEM
  t1 <- c(t1,d[[ii]])
}
sdf_gJ$ITEM <- ITEMbackup

colnames(sdf_gJ) <- t1

sdf_gJ <- sdf_gJ %>%
  mutate(COFFEE = ifelse(COFFEE+COFFEA>=1,1,0),
         ENERGY = ifelse(ENERGY+ENRGY>=1,1,0),
         KULA = ifelse(KULA+KOLA>=1,1,0),
         TROPPY = ifelse(TROPPY+TROPICAL>=1,1,0),
         RED = ifelse(RED+ROJO>=1,1,0),
         SANGRIA = ifelse(SANGRIA+SANGRITA>=1,1,0)) %>%
  subset(select = -c(COFFEA,ENRGY,KOLA,TROPICAL,ROJO,SANGRITA))

# remove outdated variables, and those without enough occurrences
a<-colSums(sdf_gJ[,3:ncol(sdf_gJ)])
threshPerc = 0.5 # this is 0.05% min frequency required
sdf_gJ <- subset(sdf_gJ, select=setdiff(names(sdf_gJ),
                                        names(a[a<threshPerc/100*nrow(sdf_gJ)])))

numeric_cols <- sapply(sdf_gJ, is.numeric)
sdf_gJ[numeric_cols] <- lapply(sdf_gJ[numeric_cols], as.factor)
sdf_gJ <- sdf_gJ %>% 
  subset(select = -c(B))

a<-as.factor(rowSums(sdf_gJ[,3:34]))

sdf_gJ$flavors <- ""
for (ii in 1:nrow(sdf_gJ)) {
  y <- names(sdf_gJ[ii,3:34])[which(sdf_gJ[ii,3:34] == 1, arr.ind=T)[, "col"]]
  z <- y[1]
  if (length(y)>1) {
    for (jj in 2:length(y)) {
      z <- paste(z, y[jj], sep = ",")
    }
  }
  if (length(y)>=1){
    sdf_gJ$flavors[ii] <- z
  }
}

sdf_g <- sdf_g %>%
  left_join(sdf_gJ[,c('ITEM','flavors')], by = "ITEM")
rm(sdf_gJ)


#The ITEM variable is a combination of the brand, package, and other descriptors. The code 
#above removes the terms associated with the package, and then determines the unique set of 
#ITEM descriptions that exist. From this, it creates a new column in the dataset per unique
#term (reduced manually from ~600 to ~130), with a 1 or 0 in each row depending on if that 
#term is found in ITEM. After this, similar terms are merged (e.g. ENRGY and ENERGY), and any 
#term (column) with a dataset frequency less than 0.5% is removed. This data was later merged
#with the original dataset to create the original dataset (24M rows) with all of the info 
#derived from the ITEM variable. Two approaches were taken from this point - first: the 
#encodings of each term was used as a factor variable in predictive models. This was not very 
#effective (many non-statistically significant) predictors in the term encodings, and added 
#significantly to the model development and execution overhead (adding ~90 columns of data). 
#The second approach used was to convert the encodings into a single variable 'flavors' where 
#the variable contains all of the terms that were found in the ITEM variable. The number of 
#flavors found ranged from zero to four. This variable was used in the final models developed 
#as a predictor or to filter the dataset before training a model.

