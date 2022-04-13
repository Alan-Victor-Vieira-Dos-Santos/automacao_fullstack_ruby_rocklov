describe "POST /equipos" do

    before(:all) do 
        payload = { email: "victor@gmail.com", password: "Senha1234" }
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end 

    context "Novo Equipamento" do 

        before(:all) do 
            payload = { 
                thumbnail: Helpers::get_thumb("kramer.jpg"),
                name: "Guitarra Kramer",
                category: "Cordas",
                price: 299,
            }

            MongoDB.new.remover_equipamento(payload[:name], @user_id)

            @result = Equipos.new.create(payload, @user_id)

        end 

        it "Deve retornar 200" do 
            expect(@result.code).to eql 200 
        end 
    end 


    context "Cadastro Nao Autorizado" do 

        before(:all) do 
            payload = { 
                thumbnail:Helpers::get_thumb("baixo.jpg"),
                name: "Contra Baixo",
                category: "Cordas",
                price: 100,
            }

            @result = Equipos.new.create(payload, nil)

        end 

        it "Deve retornar 401" do 
            expect(@result.code).to eql 401 
        end 
    end 
end 