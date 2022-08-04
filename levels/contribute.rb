difficulty 3
# description "This is the final level, the goal is to contribute to this repository by making a pull request on GitHub. Please note that this level is designed to encourage you to add a valid contribution to Githug, not testing your ability to create a pull request. Contributions that are likely to be accepted are levels, bug fixes and improved documentation."
text = <<~TEXT
  Dies ist das letzte Level.
  Das Ziel ist es, zu diesem Repository beizutragen, indem Sie einen
  pull-Request auf GitHub erstellen. Bitte beachten Sie, dass dieses
  Level Sie dazu ermutigen soll, einen gültigen Beitrag zu Githug
  hinzuzufügen, und nicht Ihre Fähigkeit, einen pull-Request zu
  erstellen, testen soll.
  Beiträge, die wahrscheinlich akzeptiert werden, sind Level,
  Fehlerbehebungen und verbesserte Dokumentation.
TEXT
description text

solution do
  location = "/tmp/githug"
  FileUtils.rm_rf(location)
  puts "Cloning repository to #{location}"
  puts "-" * 60
  `git clone https://github.com/Gazler/githug #{location}`
  puts "-" * 60

  contributor = false

  repo = Grit::Repo.new(location)
  repo.commits('master', false).each do |commit|
    if commit.author.name == repo.config["user.name"]
      if commit.author.email == repo.config["user.email"]
        contributor = true
      end
    end
  end
  puts "\nSie sind noch kein Contributor... ;-)" unless contributor

  contributor
end

hint do
  # puts "Forking the repository would be a good start!"
  puts "Das Forken des Repositorys wäre ein guter Anfang!"
end
