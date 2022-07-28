module Githug
  class Game

    attr_accessor :profile

    def initialize
      @profile = Profile.load
    end

    def play_level
      solve = true
      if profile.level.nil?
        #en# UI.puts("Welcome to Githug!")
        UI.puts("Willkommen zu Githug-de!")
        solve = false
        level_bump
      else
        level = Level.load(profile.level)
        if solve && level
          if level.solve
            #en# UI.success "Congratulations, you have solved the level!"
            UI.success "Gratulation, Sie haben das Level gelöst!"
            level_bump
          else
            #en# UI.error "Sorry, this solution is not quite right!"
            UI.error "Entschuldigung, diese Lösung ist nicht ganz richtig!"
            profile.current_attempts += 1
            profile.save

            if (profile.current_attempts > 2 && profile.current_attempts % 3 == 0)
              #en# UI.error "Don't forget you can type `githug hint` for a hint and `githug reset` to reset the current level."
              UI.error "Nicht vergessen, sie können `githug-de hint` für einen Hinweis, \nund `githug-de reset` zum zurücksetzen des aktuellen Levels eingeben."
            end

            UI.puts level.full_description
          end
        end
      end
    end

    def test_level(level, errors = nil)
      UI.puts level.full_description
      method = :solve
      method = :test if errors
      if level.send(method)
        #en# UI.success "Valid solution"
        UI.success "Gültige Lösung"
      else
        #en# UI.error "Invalid solution"
        UI.success "Ungültige Lösung"
      end
    end

    def level_bump
      profile.level_bump
      if level = Level.load(profile.level)
        UI.puts(level.full_description)
        level.setup_level
      end
    end

  end
end
