import math

def sumaTotal (nums: [int]) -> int:
    total: int = 0
    index: int = 0
    lenght: int = len(nums)

    while(index < lenght): 
        total += nums[index]

        index += 1

    return total

def pertenece1 (val: int,list: [int]) -> bool:
    index: int = 0
    lenght: int = len(list)
    pertenece: bool = False

    while(index < lenght):
        listVal = list[index]

        index += 1

        if(listVal == val): 
            pertenece = True

            break

    
    return pertenece

def pertenece2 (val: int,list: [int]) -> bool:
    pertenece: bool = False

    for listVal in list:
        if(listVal == val): 
            pertenece = True

            break

    
    return pertenece

def pertenece (list: [int], val: int) -> bool:
    return list.count(val) > 0

def fortaleza (contra: str) -> str:
    level: int = 0 
    chars: list = list(contra)
    estados: [str] = ["ROJO", "AMARILLO", "VERDE"]
    lenght: int = len(chars)

    if lenght < 5: return estados[level]

    level += 1
    
    tieneLargoMin: bool = lenght >= 8
    tieneMayus: bool = False
    tieneMin: bool = False
    tieneNum: bool = False

    for char in chars:
        esNum = char <= "9"

        if esNum:
            tieneNum = True

            continue

        if char > "Z" and char <= "z":
            tieneMayus = True

            continue

        tieneMin = True

    if tieneNum and tieneMayus and tieneLargoMin and tieneMin:
        level += 1
    
    return estados[level]

listToChange: list = [1,2,4,5,6]
def cambiarACeros(lista: [int]) -> None: 
    for num in lista:
        posicion = lista.index(num)
        esPar: bool = posicion % 2 == 0

        if esPar: 
            lista[posicion] = 0

def perteneceACadaUno (s: [[int]], e: int) -> [bool]:
    res: [int] = []

    for list in s:
        perteneceLista = pertenece(list, e)

        res.append(perteneceLista)

    return res 
# Ej 1ra Parte saldoActual
def saldoActual (movs: [(str,int)]) -> int:
    saldo: int = 0

    for mov in movs:
        evento: str = mov[0]
        dinero: int = mov[1]

        if evento == "I":
            saldo += dinero

            continue

        saldo -= dinero

    return saldo

#Ej 9 

def tieneMas3VocalesDist(pal: str) -> bool:
    chars: list = list(pal)
    vocales: list = []

    for char in chars:
        charInMayus: str = char.capitalize()
        if esVocal(char) and not pertenece(vocales, charInMayus): vocales.append(charInMayus)

    return len(vocales) >= 3

def esVocal(char: str) -> bool:
    charEnMay: str = char.capitalize()
    listaVocales: list = list("AEIOU")

    return listaVocales.count(charEnMay) > 0

# Ej 2da parte 3)
def reemplazarVocales(s: [str]) -> [str]:
    nuevosCharac: list = []

    for charac in s:
        nuevoChar: str = charac
        if esVocal(nuevoChar): nuevoChar = "_"

        nuevosCharac.append(nuevoChar)
    
    return nuevosCharac
    
# EJ 4 2da parte
def construirEstudiantes(): return


print(reemplazarVocales(["a","e","T", "t","u","s"]))

