class Enemy < ApplicationRecord
    enum kind: [ :goblin, :orc, :demon, :dragon]
    validates_presence_of :name,:power_base,:power_step,:level,:kind
    validates :level, numericality: [greater_than:0,less_than_or_equal_to:99]

    def current_power
        power_base + ((level-1)*power_step)
    end
end
