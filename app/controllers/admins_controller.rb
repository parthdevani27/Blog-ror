class AdminsController < ApplicationController
	def index 
		# @a = Admin.find(2)
		# # @p = Picture.new(name: 'sjd.dhdh')
		# @p =@a.pictures.create(name:'2.jpg')
		# @p.save

		# @e = Employee.create(name:'ded')
		# @e = Employee.find(3)

		# @p =@e.pictures.create(name:'44%%.jpg')
		# @p.save
		@all = Admin.all
		@allEmp=Employee.all

	end

end
