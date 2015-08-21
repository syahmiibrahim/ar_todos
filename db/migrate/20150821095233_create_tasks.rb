require_relative '../../config/application'

class CreateTasks < ActiveRecord::Migration
	def change
		create_table :tasks do |s|
			s.string :description
			s.string :completed
			s.timestamps null: false
		end
	end
end