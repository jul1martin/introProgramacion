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

estrofa: str = "Mentira votala \n  haciendo willy daioafioasifoasidoasio \n peron"

def imprimirDosVeces(texto: str) -> str:
     return texto * 2


def esMultiploDe (n: int, m: int) -> bool:
     return n % m == 0

def esPar(num: int) -> bool:
     return esMultiploDe(num, 2)

def cantidadDePizzas(comensales: int, minCant: int) -> int:
     cantPorciones: int = comensales * minCant

     return math.ceil(cantPorciones / 8)

# Ejercicio 3

def algunoEs0(n1: int, n2: int) -> bool:
     return n1 == 0 or n2 == 0

def ambosSon0(n1: int, n2: int) -> bool:
     return n1 == 0 and n2 == 0

def esNombreLargo(nombre: str) -> bool:
     return len(nombre) >= 3 and len(nombre) <= 8

def esBisiesto(anio: int) -> bool:
     return (anio % 400 == 0) or (anio % 4 == 0 and anio % 100 != 0)

print(esBisiesto(2100))
# print(esNombreLargo(1))