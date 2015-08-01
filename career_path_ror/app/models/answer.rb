class Answer < ActiveRecord::Base
  serialize :results

  belongs_to :user

end