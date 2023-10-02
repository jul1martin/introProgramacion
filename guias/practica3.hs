--Practica 4
-- Ejercicio 1
-- a)

ej1a :: (Int) -> Int
ej1a  n | n == 1 = 8
     | n == 4 = 131
     | n == 16 = 16

-- b)
-- problema ej1b (n: Z) : Z {
--     requiere: {n = 8 ∨ n = 16 ∨ n = 131}
--     asegura: {(n = 8 → result = 16) ∧ (n = 16 → result = 4) ∧ (n = 131 → result = 1)}
-- }

ej1b :: (Int) -> Int
ej1b  n | n == 8 = 16
     | n == 16 = 4
     | n == 131 = 1 

ej1cH  :: (Int) -> Int
ej1cH x | True = ej1a (ej1b x) 

-- Ejercicio 2
-- a) absoluto: calcula el valor absoluto de un numero entero.
-- problema absoluto (num: Int): Int {
--     asegura: { True }
--     require: { Si x >= 0, result = x }
--     require: { Si x < 0, result = x * (-1) }
-- }

absoluto :: Int -> Int
absoluto x | x >= 0 = x
           | otherwise = x * (-1)

-- b) maximoabsoluto: evuelve el maximo entre el valor absoluto de dos n´umeros enteros
-- problema maximoabsoluto (nums: (Int x Int)): Int {
--     asegura: { True }
--     require: { absoluto(abs (num[0])) > absoluto(abs (num[1])), result = abs (num[0])  }
--     require: { absoluto(abs (num[0])) < absoluto(abs (num[1])), result = abs (num[1])  }
-- }

maximoAbsoluto :: (Int, Int) -> Int
maximoAbsoluto (x, y) | abs x >= abs y = abs x
                   | otherwise = abs y

-- c) maximo3: devuelve el m´aximo entre tres n´umeros enteros.
-- problema maximoabsoluto (nums: (Int x Int x Int)): Int {
--     asegura: { True }
--     require: { Si x > y && x > z, result = x}
--     require: { Si y > x && y > z, result = y  }
--     require: { Si z > y && z >= y, result = z  }
-- }

maximo3 :: (Int, Int, Int) -> Int
maximo3 (x, y, z) | x >= y && x >= z = x
                  | y >= x && y >= z = y
                  | otherwise = z

-- d) algunoEs0: dados dos n´umeros racionales, decide si alguno de los dos es igual a 0 (hacerlo dos veces, una usando pattern
-- matching y otra no).
-- problema algunoEs0 (nums: (Float x Float)): Bool {
--     asegura: { True }
--     require: { Si x == 0 || y == 0, result = True}
--     require: { Si x != 0 && y != 0, result = False}
-- }

-- Sin pattern matching
algunoEs0 :: (Float, Float) -> Bool
algunoEs0 (x, y) | x == 0 || y == 0 = True
               | otherwise = False

-- Con pattern matching

algunoEs0V2 x y = x == 0 || y == 0

-- e) ambosSon0: dados dos n´umeros racionales, decide si ambos son iguales a 0 (hacerlo dos veces, una usando pattern matching
-- y otra no).
-- problema ambosSon0 (nums: (Float x Float)): Bool {
--     asegura: { True }
--     require: { Si x == 0 && y == 0, result = True}
--     require: { Si x != 0 || y != 0, result = False}
-- }

-- Sin pattern matching
ambosSon0 :: (Float, Float) -> Bool
ambosSon0 (x, y) | x == 0 && y == 0 = True
                 | otherwise = False

-- Con pattern matching

ambosSon0V2 x y = x == 0 && y == 0

-- f) mismoIntervalo: dados dos n´umeros racionales, decide si ambos son iguales a 0 (hacerlo dos veces, una usando pattern matching
-- y otra no).
-- problema mismoIntervalo (nums: (Float x Float)): Bool {
--     asegura: { True }
--     require: { Si  (x <= 3 && y <= 3) ||  (3 < x <= 7 && 3 < y <= 7)  || (7 < x && 7 < y), result = True}
--     require: { Si no cumple las condiciones anteriores, result = False}
-- }

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | (x <= 3 && y <= 3) ||  (3 < x && x <= 7 && 3 < y && y <= 7)  || (7 < x && 7 < y) = True
                   | otherwise = False

--h) esMultiploDe: dados dos n´umeros naturales, decidir si el primero es m´ultiplo del segundo.
-- problema esMultiploDe (nums: (Int x Int)): Bool {
--     asegura: { ambos elementos de nums tienen que ser mayor a 0  }
--     require: { Si el resto de x / y es igual a 0, result = True )  || (7 < x && 7 < y), result = True}
--     require: { SI el resto no es 0, result = False}
-- }

esMultiploDe :: (Int, Int) -> Bool
esMultiploDe (x, y) | mod y x == 0 = True
                    | otherwise = False

--i) digitoUnidades: dado un n´umero natural, extrae su d´ıgito de las unidades
-- problema digitoUnidades (num: Int): Int {
--     asegura: { El numero tiene que ser mayor a 0  }
--     require: { result sera resto de num / 10}
-- }

digitoUnidades num = mod num 10

--i) digitoDecenas: dado un n´umero natural, extrae su d´ıgito de las decenas.
-- problema digitoUnidades (num: Int): Int {
--     asegura: { El numero tiene que ser mayor a 0  }
--     require: { result sera resto de num / 100}
-- }

digitoDecenas num = mod num 100

--Ejercicio 4

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
-- todoMenor (x, y) (v, w) | x < v && y < w = True
--                         | otherwise = False

--Opcion usando funciones de haskell

todoMenor t1 t2 | fst t1 < fst t2 && snd t1 < snd t2 = True
                | otherwise = False 

--Ejercicio 5 
-- problema posPrimerPar(terna : seq(Int x Int x Int)) : Int {
--    requiere: { True }
--    asegura: { Devuelve la posicion del entero que cumpla que Int es par }
--    asegura: { Devuelve el 4 si (para todos) los valores de la secuencia no existe un numero par }
--}

thr (_, _, z) = z

esPar x = mod x 2 == 0

posPrimerPar :: (Int, Int, Int) -> Int
-- posPrimerPar terna | esPar (fst terna) = 0
                    -- | esPar (snd terna) = 1
                    -- | esPar (thr terna) = 2
                    -- | otherwise = 4
posPrimerPar (x, y, z) | esPar x = 0
                       | esPar y  = 1
                       | esPar z  = 2
                       | otherwise = 4

-- g) problema crearPar (seq(Float x Float)) : Int {
--        requiere: { True }
--        asegura: { Arma un valor con los 2 componentes de la secuencia que estrictamente es par, si ya es par se envia ese resultado, sino se le suma 1}
-- }

crearPar :: (Int, Int) -> Int
crearPar componentes | esPar (sumarComp (fst componentes) (snd componentes)) == False = 1 + sumarComp (fst componentes) (snd componentes)
                    | otherwise = sumarComp (fst componentes) (snd componentes)
                    where sumarComp c1 c2 = (absoluto c1) + (absoluto c2)    

-- h) problema invertir (seq(Float x Float)) : Int {
--        requiere: { Tienen que ser par }
--        asegura: {  result invierte la secuencia par}
-- }

invertir :: (Int, Int) -> (Int, Int)
invertir componentes = (snd componentes, fst componentes)

