-- import Test.HUnit
-- TRATAR DE HACERLO CON PATTERN MATCHING

--Ejercicio 1.1

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

ultimo :: (Eq t) => [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

principio :: (Eq t) => [t] -> t
principio (x:xs) = x

reverso :: (Eq t) => [t] -> [t]
reverso [x] = [x]
reverso (x:xs) = (reverso xs)++[x]   

-- EJercicio 2.4
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = x == e || pertenece e xs

noPertenece :: (Eq t) => t -> [t] -> Bool
noPertenece _ [] = True
noPertenece e (x:xs) = x /= e && noPertenece e xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [x] = True
todosIguales (x:xs) = pertenece x xs && (todosIguales xs)

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [x] = True
todosDistintos (x:xs) = noPertenece x xs && (todosDistintos xs)

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = hayRepetidos xs || pertenece x xs

quitar :: Integer -> [Integer] -> [Integer]
quitar _ [] = []
quitar n (x:xs) | n /= x = (x) : (quitar n xs)
                | otherwise = xs

quitarTodos :: Integer -> [Integer] -> [Integer]
quitarTodos _ [] = []
quitarTodos n (x:xs) | n /= x = (x) : (quitarTodos n xs)
                | otherwise = quitarTodos n xs

quitarTodosEq :: (Eq t) => t -> [t] -> [t]
quitarTodosEq _ [] = []
quitarTodosEq n (x:xs) | n /= x = (x) : (quitarTodosEq n xs)
                | otherwise = quitarTodosEq n xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos xs     | todosDistintos xs = xs
eliminarRepetidos (x:xs) | otherwise = x:(eliminarRepetidos (quitarTodosEq x xs))

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True 
mismosElementos _ [] = False 
mismosElementos [] _ = False
mismosElementos (x:xs) (y:ys) = ((pertenece x ys && pertenece y xs) || x == y) && mismosElementos (quitarTodosEq y xs) (quitarTodosEq x ys) 

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

-- testSuiteMultiplosDeN = test [
--      "lista vacia" ~: (multiplosDeN 4 []) ~?= [],
--      "valor 0,mult 1" ~: (multiplosDeN 0 []) ~?= []
-- ]

