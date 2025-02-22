class Game
  class Character
    attr_accessor :name, :gender, :level, :backstory, :class_choice, :age

    def initialize
      puts "Enter the name of the character: "
      @name = gets.chomp

      puts "Enter the gender of the character (male/female/non-binary):"
      @gender = gets.chomp.downcase

      puts "Enter the age of the character:"
      @age = gets.chomp.to_i

      @level = 1 # Default level
    end
    
    # BACKSTORY
    def choose_backstory
      puts "Choose the backstory of the character:"
      puts "1. Usual person"
      puts "2. People's hero"
      puts "3. Villain"
      puts "4. Adventurer"
      print "Your choice (enter the number): "
      choice = gets.chomp.to_i

      case choice
      when 1
        @backstory = "Usual person"
      when 2
        @backstory = "People's hero"
      when 3
        @backstory = "Villain"
      when 4
        @backstory = "Adventurer"
      else
        @backstory = "Unknown backstory"
      end
    end

    # GENDER
    def male?
      @gender == 'male'
    end
  
    def female?
      @gender == 'female'
    end

    def non_binary?
      @gender == 'non-binary'
    end

    # REPORTING METHODS
    def report_name
      puts "The name of the character: #{@name}"
    end

    def report_age
      puts "#{@name} - is #{@age} years old"
    end

    def report_level
      puts "#{@name} has level #{@level}"
    end

    def report_story
      puts "#{@name} is a #{@backstory}"
    end

    def report_class
      puts "The class of the character: #{@class_choice}"
    end
  end

  class Barbarian < Character
    def initialize
      super
      @class_choice = "Barbarian"
    end
  end

  class Mage < Character
    def initialize
      super
      @class_choice = "Sorcerer"
    end
  end

  class Druid < Character
    def initialize
      super
      @class_choice = "Druid"
    end
  end
end

class Locations
  attr_accessor :abandoned_castle, :mystery_cave, :ancient_forest

  def initialize
    @abandoned_castle = "Abandoned castle"
    @mystery_cave = "Mystery cave"
    @ancient_forest = "Ancient forest"
  end

  def choose_place
    loop do
      puts "Choose the place where would you like to go: "
      puts "1: Abandoned castle"
      puts "2: Mystery cave"
      puts "3: Ancient forest"
      place = gets.chomp.to_i

      case place
      when 1
        puts "When you came to the castle you remembered the story about it: This ancient castle, surrounded by dense forest, was once the home of a powerful king. Now its walls are covered in moss and its windows are broken. Inside you can find ancient artefacts, but also ghosts guarding its secrets."
        break
      when 2
        puts "As you approach the place you notice hidden behind a waterfall, a cave that may be full of shiny crystals and mysterious creatures. Legends say that deep within the cave is a source of power that can grant incredible abilities."
        break
      when 3
        puts "As soon as you enter the thicket of the forest, you feel that it is full of life and magic. The trees here are tall and ancient, and there are many secrets hidden under their crowns. The forest is inhabited by various creatures, from friendly fairies to dangerous predators."
        break
      else
        puts "Unknown number, try again."
      end
    end
  end
end

# Пример использования
# Создаем экземпляр класса Locations
locations = Locations.new

character = nil # Инициализируем переменную character как nil

# Запрашиваем выбор класса персонажа
loop do
  puts "Choose the class of the character:"
  puts "1. Barbarian"
  puts "2. Sorcerer"
  puts "3. Druid"
  print "Your choice (enter the number): "
  class_choice = gets.chomp.to_i

  case class_choice
  when 1
    character = Game::Barbarian.new
    break
  when 2
    character = Game::Mage.new
    break
  when 3
    character = Game::Druid.new
    break
  else
    puts "Unknown class, try again."
  end
end

# Вызываем методы для выбора предыстории и места
character.choose_backstory

# Выводим информацию о персонаже
character.report_name
character.report_age
character.report_level
character.report_story
character.report_class

#Вызываем метод для выбора места
locations.choose_place
