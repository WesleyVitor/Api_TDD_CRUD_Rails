require 'rails_helper'

RSpec.describe Weapon, type: :model do
  subject {create(:weapon)}
  context "has or not has attributes" do
    it "is valid if has name" do
      
      expect(subject).to be_valid
    end

    #Caso não tenha uma validação de presença no model ele vai dizer que é válido a criação
    #do weapon, mas nós queremos que ele seja inválido caso passar alguma valor nil
    it "is invalid if has not  description" do
      weapon = build(:weapon, nome: nil)
      expect(weapon).to_not be_valid
    end
    it "is invalid if has not  power_base" do
      weapon = build(:weapon, power_base: nil)
      expect(weapon).to_not be_valid
    end
    it "is invalid if has not  power_step" do
      weapon = build(:weapon, power_step: nil)
      expect(weapon).to_not be_valid
    end
    it "is invalid if has not  level" do
      weapon = build(:weapon, level: nil)
      expect(weapon).to_not be_valid
    end
  end
  context "at relation the level" do
    it "is valid if the level is 1" do
      expect(subject).to be_valid
    end
    it "is invalid if the level is not 1" do
      weapon = build(:weapon,level: FFaker::Random.rand(2..99))
      expect(weapon).to_not be_valid
    end
  end
  context "at relation power_base" do
    it "is valid if the power_base is grater than or equal to 0" do
      expect(subject).to be_valid
    end
    it "is invalid if the power_base is letter to 0" do
      weapon = build(:weapon,power_base: -1)
      expect(weapon).to_not be_valid
    end
  end
  context "verificated method current_power" do
    it "is equal to" do
      equacao = subject.power_base + (subject.level*subject.power_step)
      expect(subject.current_power).to eq(equacao)
    end
  end
  context "verificated method title" do
    it "is equal to" do
      
      expect(subject.title).to eq("#{subject.nome}##{subject.level}")
    end
  end
  
end
