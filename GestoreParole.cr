class GestoreParole
	@lista = Array(String).new

	def initialize
	end

	def open(fileName : String)
		if !File.exists?("./#{fileName}")
			puts "No file #{fileName} found!"
			exit 
		end
		contents = File.read_lines(fileName)
		contents.each do |line|
			if valid?(line)
				@lista << line
			end
		end
	end

	def size
		@lista.size
	end

	def get_parole(n : Int32)
		temp = Array(String).new
		n.times() do |i|
			pos = Random.rand(@lista.size)
			temp << @lista[pos]
		end
		temp
	end

	private def mescola
		@lista.shuffle
	end

	private def valid?(s : String)
		valid = true
		s.chars.each do |c|
			if c < 'a' || c > 'z'
				valid = false
			end
		end
		valid
	end
end

