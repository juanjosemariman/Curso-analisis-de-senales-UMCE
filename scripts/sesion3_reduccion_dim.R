# Sesión 3 - Reducción de dimensionalidad y agrupamiento

library(factoextra)
library(cluster)
library(Rtsne)
library(readr)
library(dplyr)

# Cargar datos
datos <- read_csv("datos/ejemplo.csv")
fs <- 1000
senal <- datos$canal1

# Función para extraer características por ventanas
extraer_features <- function(signal, fs, dur_ventana = 0.2) {
  muestras <- round(fs * dur_ventana)
  n_ventanas <- floor(length(signal) / muestras)
  features <- data.frame()

  for (i in 1:n_ventanas) {
    w <- signal[((i - 1) * muestras + 1):(i * muestras)]
    features <- rbind(features, data.frame(
      media = mean(w),
      sd = sd(w),
      rms = sqrt(mean(w^2)),
      zcr = sum(diff(sign(w)) != 0) / length(w)
    ))
  }
  return(features)
}

features <- extraer_features(senal, fs)

# PCA
pca_res <- prcomp(features, scale. = TRUE)
fviz_pca_ind(pca_res)

# Clustering
km <- kmeans(scale(features), centers = 2)
fviz_cluster(km, data = scale(features))
