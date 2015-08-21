require_relative '../../config/application'
require_relative '../controllers/controller'
require_relative '../models/task'
class Display 

	def self.menu
		puts "----------------------------------------------"
		puts "| Invalid options! You might need some help: |"
		puts "----------------------------------------------"
		puts "| list                                       |"
		puts "| add <insert new task>                      |"
		puts "| delete <type task id/number>               |"
		puts "| complete <type task id/number>             |"
		puts "| incomplete <type task id/number>           |"
		puts "----------------------------------------------"
	end

	def self.all
		puts "------------------------------------------------"
		puts "|    Your tasks			       	       |"
		puts "------------------------------------------------"
		Task.all.each do|tasks|
			puts " #{tasks.id}. #{tasks.completed} #{(tasks.description).to_s} "
		end
		puts "------------------------------------------------"
	end

	def self.delete_task
		puts "--------------------------------------------------"
		puts "| Your task has been deleted! Your latest task is: |"
		puts "--------------------------------------------------"
			Task.all.each do|tasks|
			puts " #{tasks.id}. #{tasks.completed} #{(tasks.description).to_s} "
		end
		puts "------------------------------------------------"
	end

	def self.complete_task
		puts "------------------------------------------------"
		puts "| Task completed! Your updated list:           |"
		puts "------------------------------------------------"
			Task.all.each do|tasks|
			puts " #{tasks.id}. #{tasks.completed} #{(tasks.description).to_s} "
		end
		puts "------------------------------------------------"
	end

	def self.incomplete
		puts "------------------------------------------------"
		puts "| Untick your task. Current list is:           |"
		puts "------------------------------------------------"
			Task.all.each do|tasks|
			puts " #{tasks.id}. #{tasks.completed} #{(tasks.description).to_s} "
		end
		puts "------------------------------------------------"
	end

	def self.add_task
			puts "------------------------------------------------"
		puts "| Your task has been added! Your current task is: |"
		puts "------------------------------------------------"
			Task.all.each do|tasks|
			puts " #{tasks.id}. #{tasks.completed} #{(tasks.description).to_s} "
		end
		puts "------------------------------------------------"
	end
end #End of class