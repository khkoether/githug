difficulty 1
# description "Clone the repository at https://github.com/Gazler/cloneme."
text = <<~TEXT
  Klonen Sie das Repository: https://github.com/Gazler/cloneme
TEXT
description text

solution do
  repo("cloneme").commit("157b2b61f29ab9df45f31c7cd9cb5d8ff06ecde4")
end

hint do
  # puts "You should have a look at this site: https://github.com/Gazler/cloneme."
  puts "Sie sollten sich diese Website ansehen: \nhttps://github.com/Gazler/cloneme"
end
