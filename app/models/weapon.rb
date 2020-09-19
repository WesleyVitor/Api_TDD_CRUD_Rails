class Weapon < ApplicationRecord
    validates :nome, presence: true
    validates :description, presence: true
    validates :power_base, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :power_step, presence: true
    validates :level, presence: true, numericality: {equal_to: 1}


    def current_power
        return self.power_base + (level*power_step)
    end
    
    def title
        "#{self.nome}##{self.level}"
    end
end
