# Sesión 2 - Preprocesamiento de señales

library(signal)
library(ggplot2)
library(readr)

# Cargar señal desde carpeta 'datos'
datos <- read_csv("datos/ejemplo.csv")
fs <- 1000  # frecuencia de muestreo
t <- datos$tiempo
senal <- datos$canal1

# Filtro pasa banda entre 5-50 Hz
bf <- butter(4, c(5, 50)/(fs/2), type = "pass")
senal_filtrada <- filtfilt(bf, senal)

# Graficar señal original y filtrada
df <- data.frame(t = t, original = senal, filtrada = senal_filtrada)

ggplot(df, aes(x = t)) +
  geom_line(aes(y = original), alpha = 0.4, color = "red") +
  geom_line(aes(y = filtrada), color = "blue") +
  labs(title = "Filtro pasa banda", x = "Tiempo (s)", y = "Amplitud")
