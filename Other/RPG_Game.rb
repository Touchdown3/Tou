class Game
  class Character
    attr_accessor :name, :gender, :level, :backstory, :class_choice, :age, :hp

    def initialize
      puts "Enter the name of the character: "
      @name = gets.chomp

      puts "Enter the gender of the character (male/female/non-binary):"
      @gender = gets.chomp.downcase

      puts "Enter the age of the character:"
      @age = gets.chomp.to_i

      @level = 1 # Default level
      @hp = 50
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

    def report_hp
      puts "#{@name} has #{@hp} points of HP"
    end

    def report_story
      puts "#{@name} is a #{@backstory}"
    end

    def report_class
      puts "The class of the character: #{@class_choice}"
    end

    def attack(enemy)
      damage = rand(5..10)  #Damage from character's attack
      enemy.hp -= damage
      puts "#{@name} attacks #{enemy.name} for #{damage} damage!"
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

  #LOCATIONS
  class Locations
    attr_accessor :abandoned_castle, :mystery_cave, :ancient_forest
  
    def initialize
      @abandoned_castle = [Ghost, Skeleton1, DarkKnight, Bat]
      @mystery_cave = [Skeleton2, CrystalMonster, CaveTroll, PoisonousSnake]
      @ancient_forest = [DarkMage, ForestSpirit, Wolf, Fairy]
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
          return "abandoned_castle"  # Return the string for the chosen location
        when 2
          puts "As you approach the place you notice hidden behind a waterfall, a cave that may be full of shiny crystals and mysterious creatures. Legends say that deep within the cave is a source of power that can grant incredible abilities."
          return "mystery_cave"  # Return the string for the chosen location
        when 3
          puts "As soon as you enter the thicket of the forest, you feel that it is full of life and magic. The trees here are tall and ancient, and there are many secrets hidden under their crowns. The forest is inhabited by various creatures, from friendly fairies to dangerous predators."
          return "ancient_forest"  # Return the string for the chosen location
        else
          puts "Unknown number, try again."
        end
      end
    end
    #ПОЯВЛЕНИЕ РАНДОМНОГО ВРАГА В ЗАВИСИМОСТИ ОТ ЛОКАЦИИ
    def get_random_enemy(location)
      case location
      when "abandoned_castle"
        enemy_class_name = @abandoned_castle.sample
      when "mystery_cave"
        enemy_class_name = @mystery_cave.sample
      when "ancient_forest"
        enemy_class_name = @ancient_forest.sample
      else
        return nil
      end

      return enemy_class_name.new  # ВОЗВРАЩАЕМ ЭКЗЕМПЛЯР ВРАГА
      
    end
  end

  class Enemies
    attr_accessor :hp
    attr_reader :name
    def initialize(name)
      @name = name
      @hp = 0
    end
  end

  #ВРАГИ ИЗ ЗАБРОШЕННОГО ЗАМКА
  class Ghost < Enemies
    def initialize
      super("Ghost")
      @hp = 25
    end
  end

  class Skeleton1 < Enemies
    def initialize
      super("Skeleton")
      @hp = 10
    end
  end

  class DarkKnight < Enemies
    def initialize
      super("Dark Knight")
      @hp = 60
    end
  end
  class Bat < Enemies
    def initialize
      super ("Bat")
      @hp = 7
    end
  end
  #ВРАГИ ИЗ ПЕЩЕРЫ
  class Skeleton2 < Enemies
    def initialize
      super("Skeleton")
      @hp = 10
    end
  end

  class CrystalMonster < Enemies
    def initialize
      super("Crystal Monster")
      @hp = 80
    end
  end

  class CaveTroll < Enemies
    def initialize
      super("Cave Troll")
      @hp = 55
    end
  end

  class PoisonousSnake < Enemies
    def initialize
      super("Poisonous Snake")
      @hp = 10
    end
  end

  #ВРАГИ ИЗ ЛЕСА
  class DarkMage < Enemies
    def initialize
      super("Dark Mage")
      @hp = 35
    end
  end

  class ForestSpirit < Enemies
    def initialize
      super("Forest Spirit")
      @hp = 25
    end
  end

  class Wolf < Enemies
    def initialize
      super("Wolf")
      @hp = 15
    end
  end

  class Fairy < Enemies
    def initialize
      super("Fairy")
      @hp = 20
    end
  end
  #БИТВА
  def self.battle(character, enemy)
    puts "#{character.name} encouters a #{enemy.name}!"
    puts "Press Enter to continue..."
    gets  # Ожидаем нажатия Enter
    while character.hp > 0 && enemy.hp > 0
      #ПЕРСОНАЖ АТАКУЕТ ВРАГА
      character.attack(enemy)
      puts "#{enemy.name} has #{enemy.hp} HP left."

      #ПРОВЕРЯЕМ, ЖИВ ЛИ ВРАГ
      if enemy.hp > 0
        puts "Press Enter to continue..."
        gets  # Ожидаем нажатия Enter

        #ВРАГ АТАКУЕТ ПЕРСОНАЖА
        enemy_damage = rand(3..8) #УРОН ОТ ВРАГА
        character.hp -= enemy_damage
        puts "#{enemy.name} attacks #{character.name} for #{enemy_damage} damage!"
        puts "#{character.name} has #{character.hp} HP left."
      end
      puts "Press Enter to continue..."
      gets  # Ожидаем нажатия Enter
    end

    #ПРОВЕРЯЕМ КТО ПОБЕДИЛ
    if character.hp <= 0
      puts "#{character.name} has been defeated!"
    else
      puts "#{enemy.name} has been defeated!"
    end
  end
end


# Создаем экземпляр класса Locations
locations = Game::Locations.new

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
character.report_hp

#Вызываем метод для выбора места
selected_location = locations.choose_place

#Создаем врага в зависимости от выбранного места
enemy = locations.get_random_enemy(selected_location)

# Начинаем бой, если враг был создан
if enemy
  Game.battle(character, enemy)
else
  puts "No enemy encountered."
end