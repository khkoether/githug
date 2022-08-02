difficulty 2
# description "There have been modifications to the `app.rb` file since your last commit. Find out which line has changed."
text = <<~TEXT
  Die Datei 'app.rb' wurde seit Ihrem letzten Commit geändert.
  Finden Sie heraus, welche Zeile sich geändert hat.
TEXT
description text

setup do
  init_from_level
end

solution do
  # line = request "What is the number of the line which has changed?"
  line = request "Wie lautet die Nummer der geänderten Zeile?"
  return false unless line == "26"
  true
end

hint do
  # puts "You are looking for the difference since your last commit. Don't forget that running `git` on its own will list the possible commands."
  puts "Sie suchen nach der Differenz seit Ihrem letzten Commit. \nVergessen Sie nicht, dass das Ausführen von `git` selbst die \nmöglichen Befehle auflistet."
end
