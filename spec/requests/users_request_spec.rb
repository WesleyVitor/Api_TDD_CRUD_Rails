require 'rails_helper'

RSpec.describe "Users", type: :request do
    describe "GET /users" do
        it "return success status"
    end

    describe "POST /users" do
        context "when it has valid params" do
            it "Create new Users with correct params" do
                user_attributes = FactoryBot.attributes_for(:user)
                post users_path, params: {user: user_attributes}
                expect(User.last).to have_attributes(user_attributes)
            end
        end

        context "when it has not valid params" do
            it "not create new Users with not correct params" do
                #Caso eu passe parametros inválidos não é para mudar o número de Usuarios dentro da 
                #tabela User
                expect{
                    post users_path, params: {user:{nickname:'',kind:'',level:''}}
                }.to_not change(User, :count)
            end
        end
    end



end