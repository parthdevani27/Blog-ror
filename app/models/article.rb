
class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if options[:fields].any?{|field| record.send(field) == "Evil" }
      record.errors[:base] << "This person is evil"
    end
  end
end

class Article < ApplicationRecord
	has_many :comments , dependent: :destroy
	  validates_with GoodnessValidator, fields: [:title, :title_confirmation]
	validates:title ,presence: true,format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" },exclusion: { in: %w(www us ca jp),message: "%{value} is reserved." },uniqueness: true
    # ,inclusion: { in: %w(small medium large),message: "%{value} is not a valid size" }
    validates:title ,confirmation: true,unless: Proc.new { |a| a.title.blank? }
	validates:body ,presence: true, length: 
									      # {minimum:10,message: "Length is sort"}
										  # { maximum: 500 }
										  { in: 6..20 ,too_long:'lenght is long	',too_short:'lenght is sort'}
									      # { is: 6 }
									      #numericality: { only_integer: true }


	validates:title_confirmation, presence: true,on: :create

validates_each :title do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
end


# validate :expiration_date_cannot_be_in_the_past,
#     :discount_cannot_be_greater_than_total_value
 
#   def expiration_date_cannot_be_in_the_past
#     if expiration_date.present? && expiration_date < Date.today
#       errors.add(:expiration_date, "can't be in the past")
#     end
#   end
 
#   def discount_cannot_be_greater_than_total_value
#     if discount > total_value
#       errors.add(:discount, "can't be greater than total value")
#     end
#   end


# person.errors[:name]
#  # => ["cannot contain the characters !@#%*()_-+="]
 
# person.errors.full_messages
 # => ["Name cannot contain the characters !@#%*()_-+="]


#  person.errors.clear
# person.errors.empty?
# person.errors.size # => 2