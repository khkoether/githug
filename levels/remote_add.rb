difficulty 2

# description "Add a remote repository called `origin` with the url https://github.com/githug/githug"
text = <<~TEXT
  Fügen Sie ein Remote Repository namens 'origin' mit der
  URL 'https://github.com/githug/githug' hinzu.
TEXT
description text

setup do
  repo.init
end

solution do
  result = `git remote -v`
  result.include?("https://github.com/githug/githug")
end

hint do
  # puts "You can run `git remote --help` for the man pages."
  puts "Sie können `git remote --help` ausführen, um die Hilfe-Seite zu erhalten."
end
