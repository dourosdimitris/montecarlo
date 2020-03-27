module Montecarlo

	# Point struct
	Point = Struct.new(:x, :y) do
		# Find if point is into circle (Euclidean distance). 
		# Distance from center of circle less than radius. 
		def in_circle
			return Math.sqrt( ((x - 0.5)**2) + ((y - 0.5)**2) ) < 0.5
		end
	end

	class Pi

		# Initialize points
		def initialize(iterations: 1000000)
			print "Initializing #{iterations} points... "
			t1 = Time.now
			@iterations = iterations
			@points = []
			@points_inside_circle = 0
			@iterations.times do 
				@points << Point.new(rand(), rand())
			end
			puts "✔️ \t (Initialization took #{Time.now - t1} seconds)"
		end

		# Calculate pi
		def calculate
			print "Calculating π... "
			t1 = Time.now
			@points.each do |point|
				@points_inside_circle += 1 if point.in_circle
			end
			pi = 4*(@points_inside_circle.to_f/@iterations.to_f)
			puts "#{pi.to_f} \t✔️\t (Calculation took #{Time.now - t1} seconds)\n\n"
			return pi
		end

	end

end
