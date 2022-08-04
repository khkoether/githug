difficulty 2
# description "You want to include the files from the following repo: `https://github.com/jackmaney/githug-include-me` into the folder `./githug-include-me`. Do this without manually cloning the repo or copying the files from the repo into this repo."
text = <<~TEXT
  Sie möchten die Dateien aus dem folgenden Repository:
  'https://github.com/jackmaney/githug-include-me'
  in den Ordner './githug-include-me' einbinden.
  Tun Sie dies, ohne das Repo manuell zu klonen oder die Dateien
  aus dem Repo in dieses Repo zu kopieren.
TEXT
description text

setup do
    repo.init
end

solution do
    return false if not File.directory?("./githug-include-me")
    return false if not File.exist?("./githug-include-me/README.md")
    return false if not File.exist?("./githug-include-me/.git")
    return false if File.directory?("./githug-include-me/.git")
    return false if not File.exist?(".gitmodules")

    return true
end

hint do
    # puts "Take a look at `git submodule`."
    puts "Schauen Sie sich `git submodule` an."
end
