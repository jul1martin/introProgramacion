path: str = "text.txt" 

def contarLineas(nombre: str) -> int:
     contenido: str = readFile(f'guias/python/{nombre}')
     characs: str = list(contenido)

     return len(characs)

def readFile(path: str) -> str:
     mode: str = "r"
     encoding: str = "UTF-8"

     file = open(path, mode, encoding=encoding)

     content: str = file.read()

     file.close()

     return content  

print(contarLineas(path))