require_relative '../../config/application'
require_relative '../views/display'
require_relative '../models/task'

class Controller #< ActiveRecord::Base

	def self.all
		#This will display all the list with special header
		Display.header
		self.content
	end
	
	def self.content
		#This will only display the list without header
		viewer =[]
		Task.all.each do|tasks|
		 viewer << " #{tasks.id}. #{tasks.completed} #{(tasks.description).to_s} "
		end
		panjang = Task.order('length(description) DESC').limit(1)
		Display.content(viewer, panjang)
	end

	def self.add(todo)
		input = todo[1..todo.length].join(" ")
		Task.create(description: input, completed:"[ ]" )
		Display.add_task(input)
		self.content
	end

	def self.delete(todo)
		input_id = (todo[1].to_i)
		tasks = Task.find_by(id: input_id)
		if tasks.nil?
			Display.errors
			self.content 
		else
			tasks.destroy
			Display.delete_task(tasks)
			self.content
		end
	end

	def self.complete(todo)
		input_id = (todo[1].to_i)
		tasks = Task.find_by(id: input_id)
		if tasks.nil?
			Display.errors 
			self.content
		else
			tasks.update(completed: "[X]")
			Display.complete_task(tasks)
			self.content
		end
	end

	def self.incomplete(todo)
		input_id = (todo[1].to_i)
		tasks = Task.find_by(id: input_id)
		if tasks.nil?
			Display.errors
			self.content
		else
			tasks.update(completed: "[ ]")
			Display.incomplete(tasks)
			self.content
		end
	end

end