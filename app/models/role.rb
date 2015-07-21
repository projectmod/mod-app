class Role < ActiveRecord::Base
  belongs_to :user

  def name_enum
    ['admin','merchant','customer']
  end
end
