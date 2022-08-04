difficulty 2
# description "Your project's deadline approaches, you should evaluate how many TODOs are left in your code"
text = <<~TEXT
  Wenn der Abgabetermin für Ihr Projekt näher rückt, sollten Sie prüfen,
  wie viele TODOs noch in Ihrem Code vorhanden sind
TEXT
description text

setup do
  init_from_level
end

solution do
  # request("How many items are there in your todolist?") == "4"
  request("Wie viele Einträge befinden sich in Ihrer 'todolist'?") == "4"
end

hint do
  # puts "You want to research the `git grep` command."
  puts "Schauen Sie sich `git help grep` an."
end
