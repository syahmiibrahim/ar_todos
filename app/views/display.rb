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

	def self.errors
		puts "------------------------------------------------"
		puts "| Error! please type a correct task id/number. |"
		puts "------------------------------------------------"
	end

	def self.header
		puts "------------------------------------------------"
		puts "|    Your tasks			       	       |"
		puts "------------------------------------------------"
	end

	def self.content(viewer, panjang)
		printing = panjang.first.description.to_s
		puts "-" * printing.length + "-" * 12

		viewer.each do |task|
			printer = printing.length - (task.length - 10) # - 10 to remove first 10 string
			puts "|" + task + " " * printer + "|"
			end

		puts "-" * printing.length + "-" * 12
	end

	def self.delete_task(input)
		result = "Your '#{input.description}' task has been deleted!"
		puts "-" * result.length + "--"
		puts "|" + result + "|"
		puts "-" * result.length + "--"

	end

	def self.complete_task(input)
		result = "Task number '#{input.id}' completed! phewww!"
		puts "-" * result.length + "--"
		puts "|" + result + "|"
		puts "-" * result.length + "--"
	end

	def self.incomplete(input)
		result = "Untick number '#{input.id}' task."
		puts "-" * result.length + "--"
		puts "|" + result + "|"
		puts "-" * result.length + "--"
	end

	def self.add_task(input)
		# result = input.to_s
		# puts "------------------------------------------------"
		# puts " Your new task '#{input.to_s}'' has been added!"
		# puts "------------------------------------------------"
		result = " Your new task '#{input.to_s}'' has been added!"
		puts "-" * result.length + "--"
		puts "|" + result + "|"
		puts "-" * result.length + "--"
	end
end #End of class