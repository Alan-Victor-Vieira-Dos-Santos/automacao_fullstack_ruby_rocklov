describe "POST /equipos/{equipo_id}/bookings" do
    before(:all) do
      payload = {email: "ed@temp.vc", password: "Senha1234" }
      result = Sessions.new.login(payload)
      @ed_id = result.parsed_response["_id"]
    end
  
    context "solicitar locacao" do
      before(:all) do
  
        result = Sessions.new.login({ email: "joe@temp.vc", password: "Senha1234" })
        joe_id = result.parsed_response["_id"]
  
        fender = {
          thumbnail: Helpers::get_thumb("fender-sb.jpg"),
          name: "Fender to rent",
          category: "Cordas",
          price: 150,
        }
  
        MongoDB.new.remove_equipo(fender[:name], joe_id)
  
        result = Equipos.new.create(fender, joe_id)
        fender_id = result.parsed_response["_id"]
  

        @result = Equipos.new.booking(fender_id, @ed_id)
      end
  
      it "deve retornar 200" do
        expect(@result.code).to eql 200
      end
    end
  end