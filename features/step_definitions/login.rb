Dado('que acesso a página principal') do
    visit "/"
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
    find("#email").set email
    find("#password").set password

    click_button "Entrar"
end


