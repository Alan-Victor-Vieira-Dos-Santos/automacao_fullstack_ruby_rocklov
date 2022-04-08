class LoginPage
    include Capybara::DSL

    def abre_pagina
        visit "/"
    end

    def preencher_login(email,password)
        find("#user_email").set email
        find("#user_password").set password
        click_button "Entrar"
    end
end
 