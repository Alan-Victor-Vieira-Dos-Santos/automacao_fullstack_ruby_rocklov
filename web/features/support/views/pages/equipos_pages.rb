class EquiposPage

    include Capybara::DSL

    def create(equipo)
        page.has_css?("#equipoForm")

    upload(equipo[:imagem]) if equipo[:imagem].length > 0

    find("#name").set equipo[:nome]
    select_cat(equipo[:categoria]) if equipo[:categoria].length > 0 
    find("#price").set equipo[:preco]   

    click_button "Cadastrar"
    
    end

    def select_cat(cat)
        find("#category").find('option', text: cat).select_option
    end 

    def upload(file_name)
        image = Dir.pwd + "/features/support/fixtures/images/" + file_name

        find("#thumbnail input[type=file]", visible: false).set image
    end 
end