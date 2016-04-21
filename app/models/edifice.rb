class Edifice < ActiveRecord::Base
  has_many :sustainability_level_checks
end
