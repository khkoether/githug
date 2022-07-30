difficulty 1
# description "There are some files in this repository, but only one of them is untracked. Which file is it?"
text = <<~TEXT
  Es gibt einige Dateien in diesem Repository, aber nur in einer
  werden Änderungen nicht beobachtet. Welche Datei ist es?
TEXT
description text

setup do
  repo.init
  %w{config.rb README setup.rb deploy.rb Guardfile}.each do |file|
    FileUtils.touch(file)
    repo.add(file)
  end
  FileUtils.touch("database.yml")
end

solution do

  # name = request("What is the full file name of the untracked file?")
  name = request("Wie lautet der vollständige Dateiname der unbeobachten Datei?")

  if name != "database.yml"
    return false
  end

  true
end

hint do
  # puts "You are looking for a command to identify the status of the repository."
  puts "Sie suchen nach einem Befehl, der den Status des Repositorys ermittelt."
end
