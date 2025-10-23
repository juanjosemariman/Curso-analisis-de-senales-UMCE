# Sesión 5 - Visualización de señales

library(ggplot2)
library(plotly)
library(readr)

# Cargar datos
datos <- read_csv("datos/ejemplo.csv")
fs <- 1000
t <- datos$tiempo
senal <- datos$canal1

# Visualización básica
df <- data.frame(t = t, señal = senal)

p <- ggplot(df, aes(x = t, y = señal)) +
  geom_line(color = "steelblue") +
  labs(title = "Visualización de la señal", x = "Tiempo (s)", y = "Amplitud")

ggplotly(p)
