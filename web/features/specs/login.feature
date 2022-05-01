#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da RockLov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário

        Dado que acesso a pagina principal
        Quando submeto minhas credenciais com "victor@gmail.com" e "Senha1234"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentar logar

        Dado que acesso a pagina principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<msg_output>"
 
        Exemplos: 
            |email_input     |senha_input    |msg_output                  |
            |victor@gmail.com|9999999999     |Usuário e/ou senha inválidos.    |  
            |victor*gmail.com|Senha1234      |Oops. Informe um email válido!   |
            |                |Senha1234      |Oops. Informe um email válido!   |
            |victor@gmail.com|               |Oops. Informe sua senha secreta! |            
