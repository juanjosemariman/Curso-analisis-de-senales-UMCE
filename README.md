# Análisis de Señales Biológicas
 
Proyecto base generado automáticamente en R.
 
## Estructura del proyecto
 - `data/raw`: datos originales
 - `data/processed`: datos limpios o transformados
 - `R/`: funciones personalizadas
 - `scripts/`: pasos del análisis
 - `output/`: figuras y resultados
 - `reportes/`: informes reproducibles (R Markdown o Quarto)
 
## Reproducibilidad con renv
 Este proyecto usa `renv` para manejar versiones de paquetes.
 Para restaurar el entorno en otro computador:
 ```r
renv::restore()
```
