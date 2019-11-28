####R commands for conducting factor analysis and related statistics utilised in Ehret, Katharina, and Maite Taboada (2019/to appear). Are online news comments like face-to-face conversation? A multi-dimensional analysis of an emerging register. Register Studies.

##note: this script assumes that you run your R shell in the directory where allstatistics and data are located. Adjust your paths to the files if necessary.

##load libraries
library(psych)
library(ggplot2)
library(reshape2)
library(dplyr)

##prepare frequency matrix

#read matrix containing all normalised frequencies per feature as columns
data = read.csv("feature_frequencies_normalised.csv")

#set file names as rownames
rownames(data) = data$file_names

#sort data alphabetically by file names
sorted.data = data[order(data$file_names),]

#remove first column containing non-numerical data
fa.data = sorted.data[-1] 

#order features alphabetically
fa.data = fa.data[, order(names(fa.data))]


##test data for statistical suitability
#conduct Kaiser-Meyer-Oelkin test for sample adequacy
KMO(fa.data)

#conduct Bartlett's test of sphericity
fa.cor = cor(fa.data)
cortest.bartlett(fa.cor, n=660)


##determine number of factors

#calculate correlation matrix
fa.cor = cor(fa.data)

#calculate eigenvalues based on the correlation matrix
fa.eigen = eigen(fa.cor)

ev = fa.eigen$values

#create scree plot of eigenvalues equal or greater than 1
factor = c(1:16)
eigenvalue = ev[1:16]

df=data.frame(factor, eigenvalue)

p = ggplot(df, aes(reorder(factor, -eigenvalue), eigenvalue, group=1))
p <- p + geom_bar(stat="identity", fill= "darkcyan")
p <- p + geom_line(color = "red", linetype = "solid")+ geom_point(shape=19, color="red") + xlab("Factor") + ylab("Eigenvalue") +
theme_bw()

p <- p + geom_text(label = round(eigenvalue, 2), vjust=-0.4, hjust = 0)

ggsave("screeplot_eigenvalues.pdf")


##factor analysis 
#calculate model with six factors
fa6 = factanal(x = fa.data, factors = 6, rotation = "promax", method="mle")

#create data frame with loadings
loads = round(fa6$loadings, 3)
 
loadings = as.data.frame(unclass(loads))

#calculate and extract factor scores using the "regression" option
fa6 = factanal(x = fa.data, factors = 6, rotation = "promax", method="mle",
scores="regression")

factorScores = as.data.frame(fa6$scores)

factorScores$filename = rownames(factorScores)

#add register information to calculate mean factor scores
#load texts_per_register.csv
registers = read.csv("texts_per_register.csv")

factorScores$register = registers$register

factorScores$mode = registers$mode

#calculate mean factor scores for each register 
#take column means
byRegister = factorScores %>% group_by(register) %>% summarise_if(is.numeric, mean, na.rm =T)

#calculate standard deviation for register factor scores
sd_factorScores_register = factorScores %>% group_by(register) %>%
summarise_if(is.numeric, funs(mean = mean(., na.rm=T), sd = sd(., na.rm=T)))


##assess significance of factor scores as predictors for registers

#load factorScores.csv or calculate directly from factorScores
df = read.csv()

#run linear regression on each factor
modelF1 = lm(Factor1 ~ register, data = df)

modelF2 = lm(Factor2 ~ register, data = df)

modelF3 = lm(Factor3 ~ register, data = df)

modelF4 = lm(Factor4 ~ register, data = df)

modelF5 = lm(Factor5 ~ register, data = df)

modelF6 = lm(Factor6 ~ register, data = df)

#call model summary with
summary()


