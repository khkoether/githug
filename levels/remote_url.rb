difficulty 2

# description "The remote repositories have a url associated to them. Please enter the url of remote_location."
text = <<~TEXT
  Die Remote Repositories sind mit einer URL verknüpft.
  Bitte geben Sie die URL von 'remote_location' ein.
TEXT
description text

setup do
  repo.init
  repo.remote_add("my_remote_repo", "https://github.com/Gazler/githug")
  repo.remote_add("remote_location", "https://github.com/githug/not_a_repo")
end

solution do
  # !!(request("What is the url of the remote repository?") =~ /https:\/\/github.com\/githug\/not_a_repo\/?/)
  !!(request("Wie lautet die URL des Remote Repository?") =~ /https:\/\/github.com\/githug\/not_a_repo\/?/)
end

hint do
  # puts "You can run `git remote --help` for the man pages."
  puts "Sie können `git remote --help` ausführen, um die Hilfe-Seite zu erhalten."
end
