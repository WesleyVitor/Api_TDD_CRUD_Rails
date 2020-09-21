require 'rails_helper'

RSpec.describe "Weapons", type: :request do

  describe "GET /weapons" do
    it "verify if name there is" do
      weapons_list = create_list(:weapon,3)
      get '/weapons'
      weapons_list.each do |weapon|
        expect(response.body).to include(weapon.nome)
      end
      
    end
    it "verify if description there is" do
      weapons_list = create_list(:weapon,3)
      get '/weapons'
      weapons_list.each do |weapon|
        expect(response.body).to include(weapon.description)
      end
    end
    it "verify if power_base there is" do
      weapons_list = create_list(:weapon,3)
      get '/weapons'
      weapons_list.each do |weapon|
        expect(response.body).to include(weapon.power_base.to_s)
      end
    end
    it "verify if power_step there is" do
      weapons_list = create_list(:weapon,3)
      get '/weapons'
      weapons_list.each do |weapon|
        expect(response.body).to include(weapon.power_step.to_s)
      end
    end
    it "verify if level there is" do
      weapons_list = create_list(:weapon,3)
      get '/weapons'
      weapons_list.each do |weapon|
        expect(response.body).to include(weapon.level.to_s)
      end
    end
  end

  describe "POST /weapons" do
    context "with valid params" do
      it "create new weapons" do
        weapon_attribute = FactoryBot.attributes_for(:weapon)
        post '/weapons',params: {weapon: weapon_attribute}
        expect(Weapon.last).to have_attributes(weapon_attribute)
      end
    end

    context "with invalid params" do
      it "no create new weapons" do
        expect {
          post '/weapons',params: {weapon: {nome:'',description:'',power_base:'',
          power_step:'',level:''}}
          }.to_not change(Weapon,:count)
      end
    end
  end

  describe "DELETE /weapons/:id" do
    context "with id correct" do
      it "delete the weapon explicit"
    context "with id no correct" do
      it "no delete the weapon explicit" 
    end
  end

  describe "GET /show" do
    it "show weapon explicit" 
  end

end
