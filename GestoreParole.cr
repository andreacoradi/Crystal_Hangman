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
            @lista << line
        end
    end

    def size
        @lista.size
    end

    def get_parole(n : Int32)
        temp = Array(String).new
        i = 0
        until i >= n 
            pos = Random.rand(@lista.size)
            temp << @lista[pos]
            i += 1
        end
        temp
    end

    private def mescola
        @lista.shuffle
    end
end

