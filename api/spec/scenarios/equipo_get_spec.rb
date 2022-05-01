describe "GET /equipo/{equipo_id}" do 

    before(:all) do 
        payload = { email: "alan@gmail.com", password: "Senha1234" }
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end 

    context "Obter um unico Equipamento" do
        
        before(:all) do

            payload = { 
                thumbnail: Helpers::get_thumb("sanfona.jpg"),
                name: "Sanfona",
                category: "Outros",
                price: 499,
            }

            MongoDB.new.remove_equipo(payload[:name], @user_id)

            equipo = Equipos.new.create(payload, @user_id)
            @equipo_id = equipo.parsed_response["_id"]

            @result = Equipos.new.find_by_id(@equipo_id, @user_id)
             
        end 

        it "deve retornar status code 200" do 

            expect(@result.code).to eql 200

        end 

    end 

    context "equipo nao existe" do
        before(:all) do
          @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)
        end

    
        it "deve retornar 404" do
            expect(@result.code).to eql 404
          end
    end 
end

describe "GET /equipos" do
    before(:all) do
      payload = { email: "gabi@gmail.com", password: "Senha1234" }
      result = Sessions.new.login(payload)
      @user_id = result.parsed_response["_id"]
    end
  
    context "obter uma lista" do
      before(:all) do
        payloads = [
          {
            thumbnail: Helpers::get_thumb("sanfona.jpg"),
            name: "Sanfona",
            category: "Outros",
            price: 499,
          },
          {
            thumbnail: Helpers::get_thumb("baixo.jpg"),
            name: "Baixo",
            category: "Outros",
            price: 700,
          },
          {
            thumbnail: Helpers::get_thumb("slash.jpg"),
            name: "Les Paul do Slash",
            category: "Outros",
            price: 699,
          },
        ]
  
        payloads.each do |payload|
          MongoDB.new.remove_equipo(payload[:name], @user_id)
          Equipos.new.create(payload, @user_id)
        end
  
        @result = Equipos.new.list(@user_id)
      end
  
      it "deve retornar 200" do
        expect(@result.code).to eql 200
      end
  
      it "deve retornar uma lista de equipos" do
        expect(@result.parsed_response).not_to be_empty
      end
    end
  end