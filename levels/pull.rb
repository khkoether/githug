difficulty 2

# description "You need to pull changes from your origin repository."
text = <<~TEXT
  Übernehmen Sie Änderungen von ihrem Remote Repository 'origin'.
TEXT
description text

setup do
  repo.init
  branch_name = repo.head.name
  if branch_name != "master"
    system("git branch -m #{branch_name} master")
  end
  repo.remote_add("origin", "https://github.com/pull-this/thing-to-pull")
end

solution do
  repo.commits(repo.head.name).last.id_abbrev == "1797a7c"
end

hint do
  # puts "Check out the remote repositories and research `git pull`."
  puts "Prüfen Sie die Remote Repositorys und das Kommando `git pull`."
end
