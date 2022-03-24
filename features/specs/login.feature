#language:pt

Funcionalidade: Login
Sendo um usuário cadastrado
Quero acessar o sistema da Rocklov
Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login com sucesso

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "victor@gmail.com" e "Senha1234"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Login sem sucesso  

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"    
        Exemplos: 
            |email_input     |senha_input    |mensagem_output                  |
            |victor@gmail.com|9999999999     |Usuário e/ou senha inválidos.    |  
            |victor*gmail.com|Senha1234      |Oops. Informe um email válido!   |
            |                |Senha1234      |Oops. Informe um email válido!   |
            |victor@gmail.com|               |Oops. Informe sua senha secreta! |            
