require_relative '../../config/application'
require_relative '../views/display'
require_relative '../models/task'

class Controller #< ActiveRecord::Base
	
	def self.add(todo)
		input = todo[1..todo.length].join(" ")
		Task.create(description: input, completed:"[ ]" )
		Display.add_task
	end

	def self.delete(todo)
		input_id = (todo[1].to_i)
		tasks = Task.find_by(id: input_id)
		if tasks.nil?
			puts "------------------------------------------------"
			puts "| Error! please type a correct task id/number:  |"
			puts "------------------------------------------------"
			Display.all
		else
		tasks.destroy
		Display.delete_task
		end
	end

	def self.complete(todo)
		input_id = (todo[1].to_i)
		tasks = Task.find_by(id: input_id)
		if tasks.nil?
			puts "------------------------------------------------"
			puts "| Error! please type a correct task id/number:  |"
			puts "------------------------------------------------"
			Display.all
		else
			tasks.update(completed: "[X]")
			Display.complete_task
		end
	end

	def self.incomplete(todo)
		input_id = (todo[1].to_i)
		tasks = Task.find_by(id: input_id)
		if tasks.nil?
			puts "------------------------------------------------"
			puts "| Error! please type a correct task id/number:  |"
			puts "------------------------------------------------"
			Display.all
		else
			tasks.update(completed: "[ ]")
			Display.incomplete
		end
	end

end