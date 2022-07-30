difficulty 2
description "The text editor 'vim' creates files ending in `.swp` (swap files) for all files that are currently open. We don't want them creeping into the repository. Make this repository ignore those swap files which are ending in `.swp`."
text = <<~TEXT
  Der Texteditor 'vim' erstellt Dateien mit der Endung '.swp'
  (Auslagerungsdateien) für alle Dateien, die gerade geöffnet sind.
  Wir wollen nicht, dass sie sich in das Repository einschleichen.
  Bringen Sie dieses Repository dazu, die Auslagerungsdateien,
  die auf '.swp' enden, zu ignorieren.
TEXT
description text

setup do
  repo.init
  FileUtils.touch("README.swp")
  file = File.open(".git/config", "w") do |file|
    file.puts "[core]\nexcludesFile="
  end
end

solution do
  valid = false

  File.open(".gitignore", "r") do |file|
    while line = file.gets
      if line.chomp == "*.swp"
        valid = true
      end
    end
  end

  valid
end

hint do
  # puts "You may have noticed there is a file named `.gitignore` in the repository."
  puts "Sie haben vielleicht bemerkt, dass es im Repository \neine Datei namens `.gitignore` gibt."
end
