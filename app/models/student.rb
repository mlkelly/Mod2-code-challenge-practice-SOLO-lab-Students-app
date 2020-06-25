class Student < ApplicationRecord
    belongs_to :instructor
    
    validates :age, numericality: {greater_than: 18}
end
