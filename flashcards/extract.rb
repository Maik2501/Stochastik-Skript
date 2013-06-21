#!/usr/bin/env ruby

# Fred Brockstedt, HU-Berlin, 2013

# Dieses Programm erstellt 'Flashcards' aus einem LaTeX Skript

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Variablen
record = FALSE
texenvs  = ["defn", "prop", "prop*", "lem", "lem*"]

# Fuer alle Umgebungen (texenv)
for texenv in texenvs
  # Fuer alle Zeilen im Skript
  File.open('../Stochastik_Skript.tex').each do |line|
    # startet mit \begin{defn}
    if( line =~ /\\begin\{#{texenv}\}/)
      record = TRUE
      puts "\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      puts "\\begin{flashcard}[#{texenv}]{???}"
    end

    if( record )
      # alle zeilen in der mitte ausgeben
      puts line
    end

    if( line =~ /\\end\{#{texenv}\}/ )
      # falls zeile gleich \end{defn}
      puts "\\end{flashcard}"
      record = FALSE
    end
  end
end
