difficulty 2

# description "This project has a remote repository. Identify it."
text = <<~TEXT
  Dieses Projekt hat ein Remote Repository. Identifizieren Sie es.
TEXT
description text

setup do
  repo.init
  repo.remote_add("my_remote_repo", "https://github.com/Gazler/githug")
end

solution do
  # "my_remote_repo" == request("What is the name of the remote repository?")
  "my_remote_repo" == request("Wie lautet der Name des Remote Repositorys?")
end

hint do
  # puts "You are looking for a remote. You can run `git` for a list of commands."
  puts "Sie können `git --help` oder `git` in Ihrer Shell eingeben, \num eine Liste der verfügbaren Git-Befehle zu erhalten."
end
