class Prisoner < ApplicationRecord
  belongs_to :prison

  validates_presence_of :name, :description, :image_url
end
