require_relative "signup"
require_relative "mongo"

describe "POST /signup" do 
    context "Cadastro com Sucesso" do
        before(:all) do 

            payload = { name: "Alan Victor", email: "alan@gmail.com", password: "Senha1234" }
           
            MongoDB.new.remover_usuario(payload[:email])
          
            @result = Signup.new.create(payload)
        end 

    it "Valida Status code" do
        expect(@result.code).to eql 200      
    end

    it "Valida ID Usuario" do
        expect(@result.parsed_response["_id"].length).to eql 24    
        end
    end

    context "Usuario que ja Existe" do 
        before(:all) do
            payload = { name: "Victor", email: "victor@gmail.com", password: "Senha1234" }

            Signup.new.create(payload)
            @result = Signup.new.create(payload)
        end

        it "Valida Status code 409" do
            expect(@result.code).to eql 409      
        end
        it "Valida Response" do
            expect(@result.parsed_response["error"]).to eql "Email already exists :("    
            end
    end 


    examples = [
        {
        title: "Nome em branco",
        payload: { name: "", email: "alan@gmail.com", password: "Senha1234" },
        code: 412, 
        error: "required name"
        },

        {
        title: "Sem o campo nome",
        payload: {email: "alan@gmail.com", password: "Senha1234" },
        code: 412, 
        error: "required name"
        },

        {
        title: "Email em branco",
        payload: { name: "Alan Victor", email: "", password: "Senha1234" },
        code: 412, 
        error: "required email"
        },

        {
        title: "Sem o campo email",
        payload: { name: "Alan Victor", password: "Senha1234" },
        code: 412, 
        error: "required email"
        },
    
        {
        title: "Sem o campo email",
        payload: { name: "Alan Victor", email: "victor*gmail.com", password: "Senha1234" },
        code: 412, 
        error: "wrong email"
        },

        {
        title: "Senha em branco",
        payload: { name: "Alan Victor", email: "alan@gmail.com", password: "" },
        code: 412, 
        error: "required password"
        },
        
        {
        title: "Sem o campo senha",
        payload: { name: "Alan Victor", email: "alan@gmail.com"},
        code: 412, 
        error: "required password"
        },
        ]

    examples.each do |e|
        context "#{e[:title]}" do
            before(:all) do 

                @result = Signup.new.create(e[:payload])
    
            end 
    
        it "Valida Status code: #{e[:code]}" do
            expect(@result.code).to eql e[:code]      
        end
    
        it "Valida Response: #{e[:error]}" do
            expect(@result.parsed_response["error"]).to eql e[:error]
            end
        end
    end 
end

