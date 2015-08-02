class PersonalityType < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :careers, dependent: :destroy

end