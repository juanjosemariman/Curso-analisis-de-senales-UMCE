##############################################################
# Repaso inicial de programación en R
# Autor: Juan José Mariman
##############################################################
# 0. Importación de librerias
install.packages("dplyr")
library(dplyr)
##############################################################
# 1. Importación y exportación de datos
##############################################################

# Definiendo el path (ruta) del archivo CSV
ruta_archivo <- "datos/acc_brazo.csv"  # Cambiar por la ruta real
# Importar datos
df <- read.csv(ruta_archivo, header = TRUE, sep = ",")# versión 1,
dim(df)
df <- read.csv(ruta_archivo, header = TRUE, sep = ";")# versión 2,
dim(df)

# Importar mediante ventana interactiva (seleccionar manualmente el archivo)
df2 <- read.csv(file.choose(), header = TRUE)

# Exportar datos a archivo csv
write.csv(df, "datos/mi_archivo_exportado.csv", row.names = FALSE)


##############################################################
# 2. Revisión inicial del data.frame
##############################################################

head(df)        # Primeras 6 filas
tail(df)        # Últimas 6 filas
dim(df)         # Dimensiones (filas, columnas)
names(df)       # Nombre de columnas
str(df)         # Estructura del objeto
summary(df)     # Resumen estadístico

# modifico el nombre de las columnas para facilitar el manejo del dataframe
colnames(df) <- c("tiempo", "eje.X", "eje.Y", "eje.Z") 

##############################################################
# 3. Tipos de datos en R e inspección dentro del DF
##############################################################

#tipo de datos
class(3)
class(TRUE)
class(FALSE)
class("Hola UMCE")
class(factor("soy factor"))
class(factor(3))
class(NA)
class(NULL)

#tipo de estructura o variable
class(df)       # Clase del objeto (data.frame)
sapply(df, class)  # Tipo de datos por columna
glimpse(df)        # Requiere dplyr: dplyr::glimpse(df)


##############################################################
# 4. Técnicas de indexación del data.frame
##############################################################

df[1, ]         # Primera fila
df[, 1]         # Primera columna
df[1, 2]        # Elemento fila 1 columna 2
df$variable     # Indexar por nombre de columna (reemplazar "variable")

# Filtrar filas
subset(df, df$variable > 10)


##############################################################
# 5. Funciones básicas en R para descripción de datos
##############################################################

mean(df$variable, na.rm = TRUE)
sd(df$variable, na.rm = TRUE)
min(df$variable)
max(df$variable)
summary(df$variable)
table(df$otra_variable)     # Frecuencias
cor(df$var1, df$var2)       # Correlación

# Creación de una tabla cruzada
table(df$var1, df$var2)
##############################################################
# 6. Operadores en R
##############################################################

# De asignación: <-  =
var1 <- 8
var2 = 9

# Aritméticos: + - * / ^ %%
5 + 3
10 / 2
5^2 #exponencial
10 %% 3   # Resto

# Relacionales: > < == >= <= !=
3 > 5
3 < 5
4 == 4
4 != 5

# Lógicos: & | !
TRUE & TRUE
(5 > 3) & (2 < 3)

TRUE & FALSE
(5 > 3) & (5 < 3)

TRUE | FALSE
(5 > 3) | (5 < 3)

FALSE | FALSE
(1 > 3) | (5 < 3)

!TRUE
!(5 > 3)

##############################################################
# 7. Estructuras de datos: vectores, data.frame y listas
##############################################################

# Vector
v <- c(1, 2, 3, 4)
length(v)
class(v)

# Data frame
df_ejemplo <- data.frame(ID = 1:4, Sexo = c("M", "F", "M", "F"))
df_ejemplo$ID
df_ejemplo$ID[2]
df_ejemplo[,1]
df_ejemplo[2,1]
# Lista
lista <- list(numeros = v, datos = df_ejemplo)
lista$datos  # Acceso a elemento
lista$numeros
lista[,1]
lista[[1]]
lista[[1]][2]

##############################################################
# 8. Generación de funciones propias
##############################################################

mi_funcion <- function(x) {
  return(x * 2)
}

mi_funcion(10)


##############################################################
# 9. Estructuras de control
##############################################################

# IF - ELSE
a <- 5
if (a > 3) {
  print("a es mayor que 3")
} else {
  print("a es menor o igual a 3")
}

# FOR
for (i in 1:5) {
  print(paste("Iteración:", i))
}

# WHILE
contador <- 1
while (contador <= 10) {
  print(contador)
  contador <- contador + 1
}

while (contador <= Inf) {
  print(contador)
  contador <- contador + 1
}

# BREAK y NEXT
for (i in 1:10) {
  if (i == 5) break  # sale del ciclo
  print(i)
}

for (i in 1:10) {
  if (i == 5) next  # salta esta iteración
  print(i)
}

###############################################################################
#Ahora aplicaremos lo revisado previamente para explorar el dataframe acc_brazo

#inspeccion inicial
head(df)   

plot(df$tiempo, df$eje.X, type = "l",col = "blue")
plot(df$tiempo, df$eje.Y, type = "l",col = "red")
plot(df$tiempo, df$eje.Z, type = "l",col = "green")


# Elige un eje y explora la primera sección de "espigas"


# A continuación, genera el plot para la primera espiga


# Para las primeras 5 espigas, calcula:
# su amplitud
# su duración, considera establecer un valor umbral para que la amplitud sea considerada como espiga y no registro basal
# tips, explora el intervalo de las primeras espigas y visualmente define el inicio y final de cada una, luego aplica un for para calcular cada métrica









