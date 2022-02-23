class Product < ApplicationRecord
  after_initialize do |product|
    puts "You have initialized an object!"
  end
 
  after_find do |product|
    puts "You have found an object!"
  end

  after_touch do |product|
    puts "You have touched an object@@@@@@@@@@@@@@@@@"
  end

  after_destroy :log_destroy_action

  before_save :normalize_name 

	validates:name ,presence: true
	validates:description ,presence: true

	
    def normalize_name 
    	self.name="mobile"
    end
    def log_destroy_action
    	throw :abort
  end
end
