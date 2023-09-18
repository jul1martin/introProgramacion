--Inicia funciones auxiliares

-- Chequea si una tupla tiene la persona en los 2 espacios de la tupla

personaDuplicada :: (String, String) -> Bool
personaDuplicada (p1,p2) = p1 == p2 

--Chequea que la relacion ingresada coincide o no con alguna tupla de la lista ingresada (sin importar el orden de las tuplas dentro de ellas)

relacionPertenece :: (String, String) -> [(String, String)] -> Bool
relacionPertenece rel1 [rel2] = contienenMismasPersonas rel1 rel2
relacionPertenece rel1 (rel2:relaciones) = (contienenMismasPersonas rel1 rel2) || (relacionPertenece rel1 relaciones)

-- Revisa que la ambas relaciones sean iguales (sin importar el orden dentro de la tupla)

contienenMismasPersonas :: (String, String) -> (String, String) -> Bool
contienenMismasPersonas (personaRel1, persona2Rel1) (personaRel2, persona2Rel2) = (personaRel1 == personaRel2 && persona2Rel1 == persona2Rel2) || (persona2Rel1 == personaRel2 && personaRel1 == persona2Rel2)

--Termina funciones auxiliares

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [rel] = not (personaDuplicada rel)
relacionesValidas (rel:relaciones) | personaDuplicada rel || relacionPertenece rel relaciones = False   
                                   | otherwise = relacionesValidas relaciones

--Revisa si existe una persona dentro de algun orden de la tupla 

coincideConAlgunaPersona :: String -> (String, String) -> Bool
coincideConAlgunaPersona pers (p1, p2) = personaDuplicada (pers, p1) || personaDuplicada (pers, p2)

--Chequea que la persona exista dentro de alguna tupla de las ingresadas en la lista

existeEnRelaciones :: String -> [(String, String)] -> Bool
existeEnRelaciones pers [rel] = coincideConAlgunaPersona pers rel
existeEnRelaciones pers (rel:relaciones) | coincideConAlgunaPersona pers rel = True
                                         | otherwise = existeEnRelaciones pers relaciones

--Terminan funciones auxiliares

personas :: [(String, String)] -> [String]
personas [(p1,p2)] = [p1,p2]
personas ((pers1,pers2):relaciones) | not (existeEnRelaciones pers1 relaciones) &&  not (existeEnRelaciones pers2 relaciones) = [pers1, pers2]++(personas relaciones)
                                    | not (existeEnRelaciones pers1 relaciones) = [pers1]++(personas relaciones)
                                    | not (existeEnRelaciones pers2 relaciones) = [pers2]++(personas relaciones)
                                    | otherwise = []++(personas relaciones)

amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe persona (rel:relaciones) | coincideConAlgunaPersona persona rel = [fst rel, snd rel]++(amigosDe persona relaciones)
                                  | otherwise = amigosDe persona relaciones

maxCantidadAmigos :: [String] -> [(String, String)] -> String
maxCantidadAmigos [p] _ = p
maxCantidadAmigos (p1:p2:personas) relaciones | cantDeAmigos p1 relaciones >= cantDeAmigos p2 relaciones = maxCantidadAmigos (p1:personas) relaciones
                                              | otherwise = maxCantidadAmigos (p2:personas) relaciones

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos relaciones = maxCantidadAmigos (personas relaciones) relaciones 

cantDeAmigos :: String -> [(String, String)] -> Integer
cantDeAmigos _ [] = 0
cantDeAmigos text (x:lista) | coincideConAlgunaPersona text x = 1 + cantDeAmigos text lista
                            | otherwise = cantDeAmigos text lista
