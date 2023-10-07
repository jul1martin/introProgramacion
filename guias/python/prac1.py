import math

# Ejercicio 1

def imprimirVerso () -> str:
     return print("Mentira votala \n  haciendo willy daioafioasifoasidoasio \n peron")

def raizDe2 () -> float:
     raiz: float = math.sqrt(2)
     raizRedondeada: float = round(raiz, 4)

     return print(raizRedondeada)

# Ejercicio 2

nombre: str = "Sofi"

def imprimirSaludo (nombre: str):
     return print("Hola " + nombre)

def raizCuadrada(num: int):
     raiz: float = math.sqrt(num)
     raizRedondeada: float = round(raiz, 4)

     return print(raizRedondeada)

farenheit: float = 100

def farenheitCelsius (temp: float):
     return print(((temp - 32) * 5) / 9)
