class Prison < ApplicationRecord
  belongs_to :user

    has_many :prisoners


  validates_presence_of :number
end
