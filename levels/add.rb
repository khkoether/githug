difficulty 1
# description "There is a file in your folder called `README`, you should add it to your staging area
# Note: You start each level with a new repo. Don't look for files from the previous one."
text = <<~TEXT
  Es gibt eine Datei in Ihrem Ordner namens 'README',
  die Sie zu Ihrem Staging-Bereich hinzufügen sollten.

  Hinweis:
  Sie beginnen jedes LEVEL mit einem neuen Projektarchiv.
  Suchen Sie nicht nach Dateien aus dem vorherigen.
TEXT
description text


setup do
  repo.init
  FileUtils.touch("README")
end

solution do
  return false unless repo.status.files.keys.include?("README")
  return false if repo.status.files["README"].untracked
  if repo.commits(repo.head.name).length > 0
    puts ">>> Sie haben bereits einen Commit durchgeführt."
    return false
  end
  true
end

hint do
  # puts "You can type `git` in your shell to get a list of available git commands."
  puts "Sie können `git` oder auch `git help` in Ihrer Shell eingeben, \num eine Liste der verfügbaren Git-Befehle zu erhalten."
end
