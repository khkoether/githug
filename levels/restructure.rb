difficulty 3

# description "You added some files to your repository, but now realize that your project needs to be restructured. Make a new folder named `src` and use Git move all of the .html files into this folder."
text = <<~TEXT
  Sie haben einige Dateien zu Ihrem Repository hinzugefügt, stellen aber
  nun fest, dass Ihr Projekt umstrukturiert werden muss. Legen Sie einen
  neuen Ordner mit dem Namen 'src' an und verschieben Sie mit Git alle
  .html-Dateien in diesen Ordner.
TEXT
description text

setup do
  repo.init

  FileUtils.touch("about.html")
  FileUtils.touch("contact.html")
  FileUtils.touch("index.html")

  repo.add("about.html")
  repo.add("contact.html")
  repo.add("index.html")

  repo.commit_all("adding web content.")
end

solution do
  index =
    repo.status["index.html"].type == "D" &&
    repo.status["index.html"].stage.nil? &&
    repo.status["src/index.html"].type == "A"

  about =
    repo.status["about.html"].type == "D" &&
    repo.status["about.html"].stage.nil? &&
    repo.status["src/about.html"].type == "A"

  contact =
    repo.status["contact.html"].type == "D" &&
    repo.status["contact.html"].stage.nil? &&
    repo.status["src/contact.html"].type == "A"

  index && about && contact
end

hint do
  # puts "You'll have to use mkdir, and `git mv`."
  puts "Sie müssen `mkdir` und `git mv` verwenden."
end
