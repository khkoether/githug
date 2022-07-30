difficulty 2

# description "We have a git repo and we want to tag the current commit with `new_tag`."
text = <<~TEXT
  Sie haben ein Git-Repository und wollen
  den aktuellen Commit mit `new_tag` taggen.
TEXT
description text

setup do
    repo.init
    FileUtils.touch("somefile.txt")
    repo.add("somefile.txt")
    # repo.commit_all("Added some file to the repo")
    repo.commit_all("Eine Datei zum Repo hinzugefügt")
end

solution do
    repo.tags.first.name == "new_tag"
end

hint do
    # puts "Take a look at `git tag`."
    puts "Schauen Sie sich `git help tag` an."
end
