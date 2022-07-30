difficulty 1
# description "A new directory, `git_hug`, has been created; \ninitialize an empty repository in it."
text = <<~TEXT
  Ein neues Verzeichnis, 'git_hug', wurde erstellt.
  Initialisieren Sie ein leeres Repository in diesem Verzeichnis.
TEXT
description text

solution do
  repo.valid?
end

hint do
  # puts "You can type `git --help` or  `git` in your shell \nto get a list of available git commands."
  puts "Sie können `git --help` oder `git` in Ihrer Shell eingeben, \num eine Liste der verfügbaren Git-Befehle zu erhalten."
end
