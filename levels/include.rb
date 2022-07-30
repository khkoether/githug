difficulty 2
# description "Notice a few files with the '.a' extension. We want git to ignore all the files except the 'lib.a' file."
text = <<~TEXT
  Beachten Sie einige Dateien mit der Erweiterung '.a'. Wir möchten,
  dass Git alle Dateien außer der Datei 'lib.a' ignoriert.
TEXT
description text

setup do
  repo.init
  FileUtils.touch("first.a")
  FileUtils.touch("second.a")
  FileUtils.touch("lib.a")
  file = File.open(".git/config", "w") do |file|
    file.puts "[core]\nexcludesFile="
  end
end

solution do
  entries = File.readlines('.gitignore').map(&:chomp)
  entries.include? '*.a' and entries.include? '!lib.a'
end

hint do
  # puts "Using `git help gitignore`, read about the optional prefix to negate a pattern."
  puts "Mit `git help gitignore` können Sie sich über das optionale Präfix \nzum Negieren eines Musters informieren."
end
