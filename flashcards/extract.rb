#!/usr/bin/env ruby

# Fred Brockstedt, HU-Berlin, 2013

# Dieses Programm erstellt 'flashcards' aus einem LaTeX Skript
# Beispiel: ruby extract.rb ../Stochastik_Skript >> flashcards.tex

################################################################################
# Variablen
record = FALSE
texenvs  = ["defn", "prop", "prop*", "lem", "lem*"]

skript = ARGV[0]

fcname = "" # Name fuer die Flashcard
fcrseite = "" # Aufschrift der Rueckseite
fctyp = {"defn" => "Definition", 
"prop"  => "Satz", 
"prop*" => "Satz", 
"lem"   => "Lemma", 
"lem*"  => "Lemma"
}

################################################################################
# Main
for texenv in texenvs # Fuer alle Umgebungen (texenv)
  File.open(skript).each do |line|  # Fuer alle Zeilen im Skript
    if( line =~ /\\begin\{#{texenv}\}/)     # startet mit \begin{defn}
      record = TRUE # ab hier die folgenden Zeilen in die flashcard aufnehmen
      puts "\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      fcname = line.scan(/\\begin\{#{texenv}\}\[([^\]].*)\]/) # Name extrahieren
      if(fcname == []) # falls kein Name vorhanden
        fcname = line.scan(/\% flashcard-name: (.*)$/) # Name per Kommentar finden
      else
        fcname = fcname.last.first
      end

      puts "\\begin{flashcard}[#{fctyp[texenv]}]{#{fcname}}"
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
