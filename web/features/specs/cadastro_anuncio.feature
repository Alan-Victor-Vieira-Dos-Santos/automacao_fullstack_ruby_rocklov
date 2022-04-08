#language:pt

Funcionalidade: Cadastro de Anuncios 
    Sendo usuario cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibiliza los para locação 

    Contexto: Login 
        * Login com "victor@gmail.com" e "Senha1234"

    Cenario: Novo Equipamento 

    Dado que acesso o formulario de cadastro de anuncios
        E que eu tenho o seguinte equipamento 
        | nome     | Fender Strato  | 
        | categoria| Cordas         | 
        | preco    | 200            | 
        | imagem   | fender-sb.jpg  | 
    Quando submeto o cadastro desse item
    Então devo ver este item no meu Dashboard

    Esquema do Cenario: Tentativa de cadastro de anuncio 

     Dado que acesso o formulario de cadastro de anuncios
        E que eu tenho o seguinte equipamento 
        | nome     | <nome>      | 
        | categoria| <categoria> | 
        | preco    | <preco>     | 
        | imagem   | <foto>      | 
    Quando submeto o cadastro desse item
    Então deve conter a mensagem de alerta: "<saida>"  
     
    Exemplos: 
      |foto          |nome           |categoria |preco |saida                                |
      |              |Violao de Nylon|Cordas    |150   |Adicione uma foto no seu anúncio!    |
      |clarinete.jpg |               |Outros    |250   |Informe a descrição do anúncio!      |
      |violino.jpg   |Violino        |          |350   |Informe a categoria                  |
      |trompete.jpg  |Trompete       |Outros    |      |Informe o valor da diária            |
      |conga.jpg     |Conga          |Outros    |abc   |O valor da diária deve ser numérico! |
      |conga.jpg     |Conga          |Outros    |100a  |O valor da diária deve ser numérico! |
