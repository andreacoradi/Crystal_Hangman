require "./GestoreParole"
require "./Impiccato"

gp = GestoreParole.new
impiccato = Impiccato.new
vite = 5
gp.open("italian")
impiccato.parola = gp.get_parole(1)[0]
until impiccato.vinto?
    #CLEAR
    puts "\033[H\033[2J"
    #puts "Parola: #{impiccato.parola}"
    puts impiccato.currentGuess
    puts "Vite: #{vite}"
    puts "Lettere: #{impiccato.lettere}"
    guess = gets.not_nil!
    if guess.size == 1
        if !impiccato.addLettera?(guess[0])
            vite -= 1
        end
    elsif guess.size > 1
        if guess == impiccato.parola
            impiccato.fine("Hai vinto")
        else
            vite -= 1
        end
    end
    if vite == 0
        impiccato.fine("Hai Perso!")
    end
end

impiccato.fine("Hai vinto!")