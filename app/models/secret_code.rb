class SecretCode < ApplicationRecord
    #has_one :user
  belongs_to :user , optional: true
end
