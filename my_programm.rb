require 'tk'

class Calculator
  def initialize
    @root = TkRoot.new { title "Калькулятор" 
    geometry "400x400"
    }
    @entry = TkEntry.new(@root) do
      font 'Arial 24'  # Устанавливаем шрифт Arial размером 24
      width 15         # Устанавливаем ширину поля ввода
    end
    @entry.pack(pady: 10)

    @buttons = [
      ['7', '8', '9', '/'],
      ['4', '5', '6', '*'],
      ['1', '2', '3', '-'],
      ['0', '=', '+']
    ]

    @buttons.each do |row|
      frame = TkFrame.new(@root).pack
      row.each do |label|
        button = TkButton.new(frame) do
          text label
          width 5  # Устанавливаем ширину кнопки
          height 2
          font 'Arial 16'
        end
        button.command = proc { handle_button(label) }
        button.pack(side: 'left', padx: 5, pady: 5)
      end
    end

    Tk.mainloop
  end

  def handle_button(label)
    if label == '='
      begin
        result = eval(@entry.get)
        @entry.delete(0, 'end')
        @entry.insert('end', result)
      rescue StandardError => e
        @entry.delete(0, 'end')
        @entry.insert('end', 'Ошибка')
        puts e.message  # Выводим сообщение об ошибке в консоль
      end
    else
      @entry.insert('end', label)
    end
  end
end

Calculator.new
      