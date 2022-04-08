require_relative "routes/sessions"

describe "POST /sessions" do 
    context "Login com sucesso" do
        before(:all) do 

            payload = { email: "victor@gmail.com", password: "Senha1234" }
            @result = Sessions.new.login(payload)

        end 

    it "Valida Status code" do
        expect(@result.code).to eql 200      
    end

    it "Valida ID Usuario" do
        expect(@result.parsed_response["_id"].length).to eql 24    
        end
    end


    examples = [
        {
        title: "Senha Incorreta",
        payload: { email: "victor@gmail.com", password: "9999999999" },
        code: 401, 
        error: "Unauthorized"
        },

        {
        title: "Email Incorreto",
        payload: { email: "victor*gmail.com", password: "Senha1234" },
        code: 412, 
        error: "wrong email"
        },

        {
        title: "Senha em branco",
        payload: { email: "victor@gmail.com", password: "" },
        code: 412, 
        error: "required password"
        },

        {
        title: "Email em branco",
        payload: { email: "", password: "Senha1234" },
        code: 412, 
        error: "required email"
        },

        {
        title: "Sem o campo senha",
        payload: { email: "victor@gmail.com"},
        code: 412, 
        error: "required password"
            },
    
        {
        title: "Sem o campo email",
        payload: { password: "Senha1234" },
        code: 412, 
        error: "required email"
        },
            ]

    examples.each do |e|
        context "#{e[:title]}" do
            before(:all) do 

                @result = Sessions.new.login(e[:payload])
    
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

