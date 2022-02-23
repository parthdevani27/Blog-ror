class Admin < ApplicationRecord
	has_many :pictures, as: :imageable
end
