require 'faker'

		10.times do 
			a = Task.create(description: Faker::Lorem.sentence(4), completed: "[ ]")
			p a
		end


p "hahah"