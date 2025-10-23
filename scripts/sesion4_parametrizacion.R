# Sesión 4 - Parametrización en el tiempo y la frecuencia

library(seewave)
library(tuneR)
library(readr)

# Cargar datos
datos <- read_csv("datos/ejemplo.csv")
fs <- 1000
senal <- datos$canal1

# Convertir a Wave
wave_signal <- Wave(left = as.integer(32767 * senal / max(abs(senal))),
                    samp.rate = fs, bit = 16)

# Espectrograma
spectro(wave_signal, f = fs, wl = 256, ovlp = 75, main = "Espectrograma")

# FFT
n <- length(senal)
fft_vals <- abs(fft(senal))
freq <- seq(0, fs/2, length.out = n/2)

plot(freq, fft_vals[1:(n/2)], type = "l", col = "blue",
     xlab = "Frecuencia (Hz)", ylab = "Magnitud", main = "Espectro de frecuencia")
