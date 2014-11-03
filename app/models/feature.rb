class Feature < ActiveRecord::Base
  has_many :assembly_lines
  has_many :cars, through: :assembly_lines
end
