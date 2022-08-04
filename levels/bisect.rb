difficulty 3
# description "A bug was introduced somewhere along the way. You know that running `ruby prog.rb 5` should output 15. You can also run `make test`. What are the first 7 chars of the hash of the commit that introduced the bug."
text = <<~TEXT
  Irgendwo auf dem Weg wurde ein Fehler eingeführt.
  Sie wissen, dass die Ausführung von `ruby prog.rb 5` 15 ausgeben sollte.
  Sie können auch `make test` ausführen.
  Wie lauten die ersten 7 Zeichen des Hashes des Commits,
  der den Fehler eingeführt hat.
TEXT
description text

setup do
  init_from_level
  repo.init
end

solution do
  # "18ed2ac" == request("What are the first 7 characters of the hash of the commit that introduced the bug?")[0..6]
  "18ed2ac" == request("Wie lautet der Commit, der den Fehler verursacht hat (7 Zeichen)?")[0..6]
end

hint do
  # puts ["The fastest way to find the bug is with bisect.", "Don't forget to start bisect first, identify a good or bad commit, then run `git bisect run make test`."]
  puts "Der schnellste Weg, den Fehler zu finden, ist mit `git bisect`. \nVergessen Sie nicht, bisect zuerst zu starten, einen guten oder schlechten \nCommit zu identifizieren und dann `git bisect run make test` auszuführen."
end
