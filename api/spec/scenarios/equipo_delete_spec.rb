describe "DELTE /equipo/{equipo_id}" do 

    before(:all) do 
        payload = { email: "alan@gmail.com", password: "Senha1234" }
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end 

    context "Obter um unico Equipamento" do
        
        before(:all) do

            payload = { 
                thumbnail: Helpers::get_thumb("violino.jpg"),
                name: "Violino",
                category: "Outros",
                price: 499,
            }

            MongoDB.new.remove_equipo(payload[:name], @user_id)

            equipo = Equipos.new.create(payload, @user_id)
            @equipo_id = equipo.parsed_response["_id"]

            @result = Equipos.new.remove_by_id(@equipo_id, @user_id)
             
        end 

        it "deve retornar status code 204" do 

            expect(@result.code).to eql 204

        end 

    end 

    context "equipo nao existe" do
        before(:all) do
          @result = Equipos.new.remove_by_id(MongoDB.new.get_mongo_id, @user_id)
        end
    
        it "deve retornar 204" do
            expect(@result.code).to eql 204
          end
    end 
end