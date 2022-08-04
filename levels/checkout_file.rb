difficulty 3

# description "A file has been modified, but you don't want to keep the modification. Checkout the `config.rb` file from the last commit."
text = <<~TEXT
  Eine Datei wurde geändert, aber Sie wollen die Änderung nicht beibehalten.
  Stellen Sie die Version der Datei aus dem letzten Commit wieder her.

  Hinweis:
  Für die das Wiederherstellen der Datei gibt es zwei Befehle:
  `git checkout` und `git restore`
TEXT
description text

setup do
  repo.init
  File.open("config.rb", "w") do |file|
    # file.puts("This is the initial config file")
    file.puts("Dies ist die initiale config Datei")
  end

  repo.add("config.rb")
  # repo.commit_all("Added initial config file")
  repo.commit_all("Füge config-Datei hinzu")

  File.open("config.rb", "a") do |file|
    # file.puts("These are changed you don't want to keep!")
    file.puts("Das sind Änderungen, die Sie nicht behalten wollen!")
  end
end

solution do
  repo.status.files["config.rb"].type != "M" && repo.commits(repo.head.name).length == 1
end

hint do
  # puts "You will need to do some research on the checkout command for this one."
  puts "Sie können einige nützliche Informationen über den Git-Status erhalten, \nder Ihnen sagt, welchen Befehl Sie ausführen müssen."
end
