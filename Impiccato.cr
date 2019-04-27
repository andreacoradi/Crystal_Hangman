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

    private def reset
        @lettere = Array(Char).new
        @currentGuess = Array(Char).new
        @currentGuess << parola[0]
        i = 1
        until i >= parola.size - 1
            @currentGuess << '_'
            i += 1
        end
        @currentGuess << parola[-1]
    end

    def getErrori
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
            if @parola[lettera]?

                /i = 1
                @parola.chars.each do |c|
                    if c == lettera
                        @currentGuess[i] = c
                    end
                    i += 1
                end/

                i = 1
                until i >= @parola.size - 1
                    c = @parola[i]
                    if c == lettera
                        @currentGuess[i] = c
                    end
                    i += 1
                end
                return true
            end
        else
            false
        end
    end

    private def valid?(c : Char)
        c <= 'z' && c >= 'a'
    end
end
        