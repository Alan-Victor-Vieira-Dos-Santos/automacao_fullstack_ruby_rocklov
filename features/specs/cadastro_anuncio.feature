#language:pt

Funcionalidade: Cadastro de Anuncios 
    Sendo usuario cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibiliza los para locação 

    @cadastro_anuncio
    Cenario: Novo Equipamento 

        Dado que estou logado no sistema RockLov com o "victor@gmail.com" e "Senha1234"
        E que acesso o formulario de cadastro de anuncios
        E que eu tenho o seguinte equipamento 
        | nome     | Fender Strato  | 
        | categoria| Cordas         | 
        | preco    | 200            | 
        | imagem   | fender-sb.jpg  | 
    Quando submeto o cadastro desse item
    Então devo ver este item no meu Dashboard
     