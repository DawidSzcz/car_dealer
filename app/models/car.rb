class Car < ActiveRecord::Base
  belongs_to :body
  has_many :assembly_lines
  has_many :features, through: :assembly_lines
end
