difficulty 4

# description "You've made changes within a single file that belong to two different features, but neither of the changes are yet staged. Stage only the changes belonging to the first feature."
text = <<~TEXT
  Sie haben in einer einzigen Datei Änderungen vorgenommen, die zu
  zwei verschiedenen Features gehören, aber keine der Änderungen
  wurde bisher bereitgestellt.
  Stellen Sie nur die Änderungen des ersten Feature
  für den nächsten Commit zur Verfügung.
TEXT
description text

setup do
  repo.init
  File.open("feature.rb", "w") do |file|
    # file.puts("This is the class of my feature")
    file.puts("Das ist die Datei mit allen Features.")
  end

  repo.add("feature.rb")
  # repo.commit_all("Added initial feature file")
  repo.commit_all("Füge 'feature.rb' hinzu")

  File.open("feature.rb", "a") do |file|
    # file.puts("This change belongs to the first feature")
    file.puts("Diese Änderungen gehören zum ersten Feature.")
  end

  File.open("feature.rb", "a") do |file|
    # file.puts("This change belongs to the second feature")
    file.puts("Diese Änderungen gehören zum zweiten Feature.")
  end
end

solution do
  `git diff --no-ext-diff --no-color --staged` =~ /\+Diese Änderungen gehören zum ersten Feature./ && `git diff --no-ext-diff --no-color` =~ /\+Diese Änderungen gehören zum zweiten Feature./
end

hint do
  # puts "You might want to try to manipulate the hunks of the diff to choose which lines of the diff get staged. Read about the flags which can be passed to the `add` command; `git --help add`."
  puts "Vielleicht möchten Sie versuchen, die Hunks des Diffs zu manipulieren, um \nauszuwählen, welche Zeilen des Diffs in den Staging-Bereich versetzt werden. \nLesen Sie über die Optionen, die dem `add` Befehl übergeben werden können; \n`git help add`."
end
