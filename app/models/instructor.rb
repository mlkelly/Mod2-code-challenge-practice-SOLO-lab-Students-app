class Instructor < ApplicationRecord
    has_many :students

    def avg_student_age
        if students.count != 0
            students.sum {|s| s.age} / students.count
        else
            0
        end
    end

    def name_alphabetical_sort
        students.sort_by {|s| s.name}
    end
end
