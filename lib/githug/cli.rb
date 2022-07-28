require 'thor'
require 'githug'
module Githug
  class CLI < Thor


    default_task :play

    #en# desc :play, "Initialize the game"
    desc :play, "Initialisieren Sie das Spiel"

    def play
      #en# UI.word_box("Githug")
      UI.word_box("Githug-de")
      make_directory!
      Game.new.play_level
    end

    #en# desc :test, "Test a level from a file path"
    desc :test, "Testen eines Levels von einem Verzeichnis"
    method_option :errors, :type => :boolean, :default => false

    def test(path)
      #en# UI.word_box("Githug")
      UI.word_box("Githug-de")
      make_directory!
      level = Level.load_from_file(path)
      Game.new.test_level(level, options[:errors])
    end

    #en# desc :hint, "Get a hint for the current level"
    desc :hint, "Einen Hinweis für das aktuelle Level erhalten"

    def hint
      if level = load_level
        level.show_hint
      end
    end

    #en# desc :reset, "Reset the current level or select specific level"
    desc :reset, "Den aktuellen Level zurücksetzen oder einen bestimmten Level auswählen."
    #en# long_desc <<-LONGDESC
    #   `githug reset` will reset the current level. You can optionally specify a
    #   LEVEL parameter which will reset the game to a specific level. For
    #   example:
    #
    #   > $ githug reset merge_squash   # or $ githug reset 47
    #
    #   Will reset githug to level '#47: merge_squash'
    # LONGDESC
    long_desc <<-LONGDESC
      `githug-de reset` setzt den aktuellen Level zurück.
      Sie können optional einen LEVEL-Parameter angeben.
      Zum Beispiel:

      > $ githug-de reset merge_squash   # oder auch: $ githug-de reset 47

      Setzt Githug-de auf den Level '#47: merge_squash' zurück.
    LONGDESC
    def reset(path = nil)
      level = load_level(path)
      #en# UI.word_box("Githug")
      UI.word_box("Githug-de")
      if level
        #en# UI.puts("resetting level")
        UI.puts("Level zurücksetzen (reset)")
        level.setup_level
        level.full_description
      else
        #en# UI.error("Level does not exist")
        UI.error("Level existiert nicht")
      end
    end

    #en# desc :levels, "List all of the levels"
    desc :levels, "Alle Levels auflisten (grün passed/bestanden, rot pending/ausstehend)"

    def levels
      list_with_numbers = Level.list.each_with_index.map do |name, index|
        "##{index + 1}: #{name}"
      end
      UI.puts(list_with_numbers)
    end

    no_tasks do

      def load_level(path = nil)
        return load_level_from_profile unless path
        return load_level_from_number(path.to_i) if path.to_i.to_s == path
        return load_level_from_name(path) if Level.list.include?(path)
        Level.load_from_file(path)
      end

      def load_level_from_number(number)
        level_name = number >= 1 ? Level.list[number - 1] : nil
        return load_level_from_name(level_name)
      end

      def load_level_from_name(name)
        profile = Profile.load
        profile.set_level(name)
        Level.load(name)
      end

      def load_level_from_profile
        profile = Profile.load
        Level.load(profile.level)
      end


      def make_directory!
        return if File.basename(Dir.pwd) == "git_hug"
        check_githug_directory!
        prompt_githug_directory!
        make_githug_directory!
      end

      def check_githug_directory!
        if File.exists?("./git_hug")
          #en# UI.puts "Please change into the git_hug directory"
          UI.puts "Bitte wechseln Sie in das Verzeichnis 'git_hug'."
          exit
        end
      end

      def prompt_githug_directory!
        #en# unless UI.ask("No githug directory found, do you wish to create one?")#
        unless UI.ask("Kein Verzeichnis 'git_hug' gefunden, möchten Sie eines erstellen?")
          #en# UI.puts("Exiting")
          UI.puts("Abbruch")
          exit
        end
      end

      def make_githug_directory!
        Dir.mkdir("./git_hug")
        Dir.chdir("git_hug")
      end

    end

  end
end
