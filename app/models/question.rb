class Question < ActiveRecord::Base
  default_scope -> { order('countnum DESC') }
end
