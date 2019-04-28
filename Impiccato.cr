class Impiccato
    @parola : String
    @currentGuess : Array(Char)
    @lettere : Array(Char)

    def initialize
        @parola = ""
        @currentGuess = Array(Char).new
        @lettere = Array(Char).new
    end

    getter parola
    
    def currentGuess
        s = ""
        @currentGuess.each do |c|
            s += c 
        end
        s
    end

    getter lettere
    
    def parola=(@parola : String)
        reset
    end

    def fine(msg : String)
        puts msg
        puts "La parola era #{parola}"
        exit
    end

    def vinto?
        currentGuess == @parola
    end

    private def reset
        @lettere = Array(Char).new
        @currentGuess = Array(Char).new
        @currentGuess << @parola[0]
        2.to(@parola.size - 1) do |i|
            @currentGuess << '_'
        end
        @currentGuess << @parola[-1]
    end

    def errori
        @lettere.size
    end

    private def contains?(c : Char)
        @lettere.each do |l|
            if l == c
                return true
            end
        end
        false
    end

    def addLettera?(lettera : Char)
        if !valid?(lettera)
            return true
        end
        if !contains?(lettera)
            @lettere << lettera
            found = false
            @parola.each_char_with_index do |c,i|
                unless i == 0 || i == @parola.size - 1
                    if c == lettera
                        found = true
                        @currentGuess[i] = c
                    end
                end
            end
            return found
        else
            false
        end
    end

    private def valid?(c : Char)
        c <= 'z' && c >= 'a'
    end
end
        