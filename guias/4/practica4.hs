-- fibonacci

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = (fibonacci(n - 1)) +
              (fibonacci(n - 2))

parteEntera :: Float -> Int
parteEntera x | 0 <= x && x < 1 = 0
              | x > -1 && x <= 0 = -1
              | x >= 1 = 1 + parteEntera(x - 1) 
              |otherwise = (-1) + parteEntera(x + 1) 

-- Ejercicio 4
-- problema sumaImpares (Int) : Int {
--       requiere: { El valor ingresado tiene que ser estrictamente natural }
--       asegura: { Devuelve 0 si el valor ingresado es 0 }
--       asegura: { Sumara recursivamente numeros impares hasta llegar a la n cantidad de sumas }
-- }

sumaImpares :: Int -> Int 
sumaImpares times | times == 1 = 1
                  |  otherwise = 1 +  (2 * (times - 1)) + sumaImpares (times - 1)  

esPar x = mod x 2 == 0 

--Ejercicio 5
medioFact :: Int-> Int
medioFact n | n == 0 || n < 0 = 1
            | otherwise = n * medioFact(n - 2)

--Ejercicio 6
-- problema sumaDigitos (Int): Int {
--       requiere: { Tiene que ser un numero natural }
--       asegura: { result es el mismo valor que se ingreso si los digitos es igual a 1 }
--       asegura: { Sumara digito por digito del valor ingresado }
-- }

sumaDigitos :: Int -> Int
sumaDigitos x | x < 10 = x
              | otherwise = (mod x 10) + sumaDigitos (div x 10)

-- Ejercicio 7

todosDigitosIguales :: Int -> Bool
todosDigitosIguales n | n < 10 = True
                      | otherwise = ultimoDigito n == ultimoDigito (sacarUltimo n) && 
                                    todosDigitosIguales(sacarUltimo n)

ultimoDigito :: Int -> Int
ultimoDigito n = mod n 10

sacarUltimo :: Int -> Int
sacarUltimo n = div n 10

--Ejercicio 8
-- la hice asi, sin ser recursiva

iesimoDigito :: Int -> Int -> Int
iesimoDigito n i | cantDigitos n == i = mod n 10
                 | otherwise = mod (div n (10^(cantDigitos (n) - i))) 10

--recursivamente

iesimoDigitoRec :: Int -> Int -> Int
iesimoDigitoRec n i | cantDigitos n == i = ultimoDigito n
                    | otherwise = iesimoDigitoRec (sacarUltimo n) i 
                    where ultimoDigito n = mod n 10
                          sacarUltimo n = div n 10
-- ultimoDigito (div n (10^(cantDigitos (n) - i)))

cantDigitos :: Int -> Int
cantDigitos n | n < 10 = 1
              | otherwise = 1 + cantDigitos (sacarUltimo n)
              where sacarUltimo n = div n 10

--Ejercicio 9
-- problema esCapicua (Int): Bool {
--       require: { Tiene que ingresar un numero natural estrictamente mayor a 0 }
--       asegura: { Revisa digito por digito, en el que result = True si todos los digitos son iguales }
--       asegura: { result = false, si al menos un digito es distinto a otro}
-- }

-- esCapicua :: Int -> Bool
-- esCapicua x | x == 0 = True
--             | cantDigitos x > 1 && x != sacarSiguiente = False
--             | otherwise =  esCapicua (sacarUltimo n)
--             where sacarSiguiente x = x div 100 
