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
