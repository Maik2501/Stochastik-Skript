#!/usr/bin/env ruby

# Fred Brockstedt, HU-Berlin, 2013

# Dieses Programm erstellt 'Flashcards' aus einem LaTeX Skript

# Variablen
record = FALSE

# Fuer alle Zeilen im Skript
File.open('../Stochastik_Skript.tex').each do |line|
# startet mit \begin{defn}
  if( line =~ /\\begin\{prop\}/)
    record = TRUE
    puts "\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "\\begin{flashcard}[Satz]{???}"
  end

  if( record )
    # alle zeilen in der mitte ausgeben
    puts line
  end

  if( line =~ /\\end\{prop\}/ )
    # falls zeile gleich \end{defn}
    puts "\\end{flashcard}"
    record = FALSE
  end
end
