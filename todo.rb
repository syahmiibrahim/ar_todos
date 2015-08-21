require_relative 'config/application'
require_relative 'app/controllers/controller'
require_relative 'app/views/display'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

class Command
	def self.run(todo)
		input = todo[0]
		case input
			when "list" then Display.all
			when "add" then Controller.add(todo)
			when "delete" then Controller.delete(todo)
			when "complete" then Controller.complete(todo)
			when "incomplete" then Controller.incomplete(todo)
			else
				Display.menu
		end
	end
end

Command.run(ARGV)