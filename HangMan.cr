require "./GestoreParole"
require "./Impiccato"

gp = GestoreParole.new
impiccato = Impiccato.new
vite = 5
gp.open("italian")
impiccato.parola = gp.get_parole(1)[0]
#puts impiccato.parola
until impiccato.currentGuess == impiccato.parola
    #CLEAR
    puts "\033[H\033[2J"
    
    puts impiccato.currentGuess
    puts "Vite: #{vite}"
    puts "Lettere: #{impiccato.lettere}"
    guess = gets.not_nil!
    if guess.size == 1
        if !impiccato.addLettera?(guess[0])
            vite -= 1
        end
    end
    if vite == 0
        puts "HAI PERSO!"
        puts "La parola era #{impiccato.parola}"
        exit
    end
end

puts "HAI VINTO!"
puts "La parola era #{impiccato.parola}"