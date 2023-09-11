-- fibonacci

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = (fibonacci(n - 1)) +
              (fibonacci(n - 2))

parteEntera :: Float -> Integer
parteEntera x | 0 <= x && x < 1 = 0
              | x > -1 && x <= 0 = -1
              | x >= 1 = 1 + parteEntera(x - 1) 
              |otherwise = (-1) + parteEntera(x + 1) 

-- Ejercicio 4
-- problema sumaImpares (Integer) : Integer {
--       requiere: { El valor ingresado tiene que ser estrictamente natural }
--       asegura: { Devuelve 0 si el valor ingresado es 0 }
--       asegura: { Sumara recursivamente numeros impares hasta llegar a la n cantidad de sumas }
-- }

-- sumaImpares :: Integer -> Integer 
-- sumaImpares times | times == 1 = 1
--                   |  otherwise = 1 +  (2 * (times - 1)) + sumaImpares (times - 1)  

sumaImpares :: Integer -> Integer 
sumaImpares n | n == 0 = 0
                  |  otherwise = ((n*2) - 1) + sumaImpares (n - 1)  




esPar x = mod x 2 == 0 

--Ejercicio 5
medioFact :: Integer-> Integer
medioFact n | n == 0 || n < 0 = 1
            | otherwise = n * medioFact(n - 2)

--Ejercicio 6
-- problema sumaDigitos (Integer): Integer {
--       requiere: { Tiene que ser un numero natural }
--       asegura: { result es el mismo valor que se ingreso si los digitos es igual a 1 }
--       asegura: { Sumara digito por digito del valor ingresado }
-- }

sumaDigitos :: Integer -> Integer
sumaDigitos x | x < 10 = x
              | otherwise = (mod x 10) + sumaDigitos (div x 10)

-- Ejercicio 7

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n < 10 = True
                      | otherwise = ultimoDigito n == ultimoDigito (sacarUltimo n) && 
                                    todosDigitosIguales(sacarUltimo n)

ultimoDigito :: Integer -> Integer
ultimoDigito n = mod n 10

sacarUltimo :: Integer -> Integer
sacarUltimo n = div n 10

--Ejercicio 8
-- la hice asi, sin ser recursiva

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i | cantDigitos n == i = mod n 10
                 | otherwise = mod (div n (10^(cantDigitos (n) - i))) 10

--recursivamente

iesimoDigitoRec :: Integer -> Integer -> Integer
iesimoDigitoRec n i | cantDigitos n == i = ultimoDigito n
                    | otherwise = iesimoDigitoRec (sacarUltimo n) i 
-- ultimoDigito (div n (10^(cantDigitos (n) - i)))

cantDigitos :: Integer -> Integer
cantDigitos n | n < 10 = 1
              | otherwise = 1 + cantDigitos (sacarUltimo n)

--Ejercicio 9
-- problema esCapicua (Integer): Bool {
--       require: { Tiene que ingresar un numero natural estrictamente mayor a 0 }
--       asegura: { Revisa digito por digito, en el que result = True si todos los digitos son iguales }
--       asegura: { result = false, si al menos un digito es distinto a otro}
-- }

esCapicua :: Integer -> Bool
esCapicua x | cantDigitos x == 1 = True
            | iesimoDigitoRec x ((cantDigitos x) - 1) == (ultimoDigito x) = esCapicua (sacarUltimo x)
            | otherwise = False

--Ejercicio 11
-- problema eAprox (Integer): Float {
--       require: { True }
--       asegura: { retorna = 1 si el valor es 1  }
--       asegura: { retorna el valor mas aproximado a e dependiendo el valor ingresado }
-- }

eAprox :: Integer -> Float
eAprox x | x == 0 = 1
         | otherwise = (1 / (factorial (fromIntegral x))) + eAprox (x - 1)
         

factorial :: Float -> Float
factorial x | x == 1 = 1
            | otherwise = x * factorial (x - 1)

-- Ej 12 problema raizDe2Aprox (Integer n): Float {
--       requiere: { Tiene que ser un numero natural  y n > 1 }
--       asegura: { 
--             n = 1 -> result = 2
--             n > 1 -> result sera el resultado de una sucesión 
--       }
-- }

raizDe2Aprox :: Integer -> Float
raizDe2Aprox 1 = 2
raizDe2Aprox n = 2 + (1 / raizDe2Aprox (n-1)) - 1 

-- Ej 13 problema dobleSumatoria (n : Integer, m: Integer): Integer {
--       requiere: { True }
--       asegura: {
--             Si n = 1, result = 1
--             Si m = 1, result = Sumatoria n
--             Sino realiza las 2 sumatorias
--       }
-- }

sumatoria :: (Integer, Integer) -> Integer
sumatoria (n,i) | i == 1 = n
                | otherwise = n + sumatoria (n,i - 1) 

dobleSumatoria :: Integer -> Integer -> Integer
dobleSumatoria n m | 1 == n = sumatoria (1, m) 
                   | otherwise = n^m + (dobleSumatoria (n-1) m)

-- Ejercicio 14

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m |  n == 1 || m == 1 = q^(n + m)
                    | otherwise = q^(n + m) + (sumaPotencias q (n-1) (m-1))

--Ej 17
-- problema esFibonacci (n: Z) : B {
--    requiere: { n ≥ 0 }
--    asegura: { resultado = true ↔ n es alg´un valor de la secuencia de Fibonacci definida en el ejercicio 1}
-- }



existsInFibonacci :: Integer -> Integer -> Bool
existsInFibonacci n fibo | fibo == 0 && n /= 0 = False
                         | otherwise = n == (fibonacci fibo) || (existsInFibonacci n (fibo-1))

esFibonacci :: Integer -> Bool
esFibonacci n | existsInFibonacci n n == True = True
              | otherwise = False

-- Clase
menorDivisorHasta :: Int -> Int -> Int
menorDivisorHasta x d | x == d = x
                      | mod x d == 0 = d
                      | otherwise = menorDivisorHasta x (d + 1)

menosDivisor :: Int -> Int
menosDivisor x = menorDivisorHasta x 2

esPrimo :: Int -> Bool
esPrimo x = menosDivisor x == x

proximoPrimo :: Int -> Int
proximoPrimo x | esPrimo x = x
               | otherwise = proximoPrimo (x + 1)

kEsimoPrimo :: Int -> Int
kEsimoPrimo 1 = 2
kEsimoPrimo k = proximoPrimo (kEsimoPrimo (k - 1) + 1)

sumaDePrimerosKPrimos :: Int -> Int
sumaDePrimerosKPrimos 1 = 2
sumaDePrimerosKPrimos k = kEsimoPrimo k +  sumaDePrimerosKPrimos (k - 1)

esSumaDePrimerosKPrimos :: Int -> Int -> Bool
esSumaDePrimerosKPrimos n k | n == sumaDePrimerosKPrimos k = True
                            | n < sumaDePrimerosKPrimos k = False
                            | otherwise = esSumaDePrimerosKPrimos n (k + 1)

esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos n = esSumaDePrimerosKPrimos n 1

-- La otra solucion seria ir restando de primos
