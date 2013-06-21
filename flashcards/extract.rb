#!/usr/bin/env ruby

# Fred Brockstedt, HU-Berlin, 2013

# Dieses Programm erstellt 'flashcards' aus einem LaTeX Skript

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Variablen
record = FALSE
texenvs  = ["defn", "prop", "prop*", "lem", "lem*"]

for texenv in texenvs # Fuer alle Umgebungen (texenv)
  File.open('../Stochastik_Skript.tex').each do |line|  # Fuer alle Zeilen im Skript
    if( line =~ /\\begin\{#{texenv}\}/)     # startet mit \begin{defn}
      record = TRUE # ab hier die folgenden Zeilen in die flashcard aufnehmen
      puts "\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      puts "\\begin{flashcard}[#{texenv}]{???}"
      next # diese Zeile enthaelt \begin{...} also ueberspringen 
    end

    if( line =~ /\\end\{#{texenv}\}/ ) # falls zeile gleich \end{defn}
      puts "\\end{flashcard}"
      record = FALSE # Umgebung beendet keine weiteren Zeilen mehr aufnehmen
      next
    end

    if( record )
      puts line  # alle zeilen in der Mitte des environments ausgeben
    end
  end
end
