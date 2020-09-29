require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  let(:inimigo){create(:enemy)}
  let(:enemy_attributes){attributes_for(:enemy)}
  
  
  describe 'PUT /enemies' do
    context "when the enemy exists" do
      it "if exists return code 200" do
        #enemy = create(:enemy)
        #enemy_attributes = attributes_for(:enemy)
        puts "ALgo",enemy_attributes[:name]
        put "/enemies/#{inimigo.id}",params: enemy_attributes
        expect(response).to have_http_status(200)
      end
      it "if update record" do
        #enemy = create(:enemy)
        #enemy_attributes = attributes_for(:enemy)
        put "/enemies/#{inimigo.id}",params: enemy_attributes
        #Enemy pega o enemy mais atualizado e assim verifica se o
        #Mais atualizado tem os atributos que eu atualizei no put
        expect(inimigo.reload).to have_attributes(enemy_attributes)
      end
      
      # it "return enemy updated" do
      #   enemy = create(:enemy)
      #   enemy_attributes = attributes_for(:enemy)
      #   put "/enemies/#{enemy.id}",params: enemy_attributes
      #   expect(enemy.reload).to have_attributes(json.except('created_at','update_at'))
      # end
    end

    context "when the enemy does not exists" do
      it "return code 404"do
        #enemy_attributes = attributes_for(:enemy)
        put "/enemies/0",params:enemy_attributes
        expect(response).to have_http_status(404)
      end
      it "return not found message" do
        #enemy_attributes = attributes_for(:enemy)
        put "/enemies/0",params:enemy_attributes
        expect(response.body).to match(/Couldn't find Enemy with/)
      end
    end
  end

  describe "DELETE /enemies" do
    context "when the enemy exists" do
      it "return status code 204" do
        #enemy = create(:enemy)
        delete "/enemies/#{inimigo.id}"
        expect(response).to have_http_status(204)
      end
      it "destroy the record" do
        #enemy = create(:enemy)
        delete "/enemies/#{inimigo.id}"
        expect {inimigo.reload}.to raise_error(ActiveRecord::RecordNotFound)
   

      end
    end

    context "when the enemy don´t exists" do
      it "return status code 404" do
        delete "/enemies/0"
        expect(response).to have_http_status(404)
      end
      it "return message not found" do
        delete "/enemies/0"
        expect(response.body).to match(/Couldn't find Enemy with/)
      end
    end
  end

end
