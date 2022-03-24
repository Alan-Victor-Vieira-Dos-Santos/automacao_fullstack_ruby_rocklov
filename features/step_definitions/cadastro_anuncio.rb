Dado('que estou logado no sistema RockLov com o {string} e {string}') do |email, password|
    @email = email
    
    visit "/" 
    
    find("#email").set email
    find("#password").set password

    click_button "Entrar"
end
  
Dado('que acesso o formulario de cadastro de anuncios') do
    click_button "Criar anúncio"
    expect(page).to have_css "#equipoForm"
end

Dado('que eu tenho o seguinte equipamento') do |table|
    @anuncio = table.rows_hash 

    MongoDB.new.remover_equipamento(@anuncio[:nome], @email)
end
  
Quando('submeto o cadastro desse item') do

    imagem = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:imagem]

    find("#thumbnail input[type=file]", visible: false).set imagem
    find("#name").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find("#price").set @anuncio[:preco]   

    click_button "Cadastrar"
end
  
Então('devo ver este item no meu Dashboard') do
    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end
