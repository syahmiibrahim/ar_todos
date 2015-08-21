require 'faker'
require_relative '../app/models/task'

module TasksImporter
	def self.import
		10.times do 
			Task.create(description: Faker::Lorem.sentence(4), completed: "[ ]")
		end			
	end
end