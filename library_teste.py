import requests as req



def Get_Endpoint_Usuarios_Tantas_Vezes(vezes):
    lista = []
    for vez in range(0, vezes):
        r = req.get("https://serverest.dev/usuarios")   
        para_json = r.json()
        lista.append(para_json)
    return lista


def Pegar_Quantidade_De_Usuarios_Cadastrados():
    r = req.get("https://serverest.dev/usuarios")   
    request_json = r.json()


    return   request_json["quantidade"]