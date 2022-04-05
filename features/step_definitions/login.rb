Dado('que acesso a página principal') do
    @login_page.abre_pagina
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
    @login_page.preencher_login(email, password)
end


 