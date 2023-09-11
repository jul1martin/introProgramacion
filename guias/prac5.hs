-- TRATAR DE HACERLO CON PATTERN MATCHING

--Ejercicio 1.1

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs


-- EJercicio 2.4
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = x == e || pertenece e xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = hayRepetidos xs || pertenece x xs

-- Ejercicio 3.1

sumatoria :: [Integer] -> Integer
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs

-- Ejercicio 3.2

productoria :: [Integer] -> Integer
productoria [x] = x
productoria (x:xs) = x * productoria xs


-- Ejercicio 3.3

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:list) | x > y = maximo (x:list)
                  | otherwise = maximo (y:list)

minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:y:list) | x < y = minimo (x:list)
                  | otherwise = minimo (y:list)

-- Ejercicio 3.4

-- sumarN :: Integer -> [Integer] -> [Integer]
-- sumarN n [x] = [x + n]
-- sumarN n [x:xs] = [x + n]:(sumarN n xs) ACA VA ++

-- Ejercicio 3.9

ordenar :: [Integer] -> [Integer]
ordenar [] = []
-- ordenar (x:xs) | x <= minimo xs = (x):(ordenar xs)
--                | otherwise = (minimo xs):(ordenar xs)
ordenar xs = (minimo xs) : ordenar (quitar (minimo xs) xs)

quitar :: Integer -> [Integer] -> [Integer]
quitar _ [] = []
quitar n (x:xs) | n /= x = (x) : (quitar n xs)
                | otherwise = xs

