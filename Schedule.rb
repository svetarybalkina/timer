@t = Time.now
@schedule = {}
@ordnum = 1
@n = 0

def add                             # to fill schedule
                 
  def write                         #add new string

    puts "Что будем делать?"
    action = gets.chomp
      act = @ordnum.to_s + ". " + action

    puts "Сколько минут будем #{action}?"
    @time = gets.chomp.to_i*60

      if @n == 0                      # этот блок перенести в "запустить расписание"
        @n = @t + @time               #end time of action
      else
        @n = @time2+@time
      end

    @schedule[act] = @n

    output = File.open "todo.txt", "a"
    output.write @schedule
    output.close

  end
    
  loop do
    puts 7.chr
    write
    @time2 = @n
    
    @ordnum += 1
    puts "Продолжить? Enter, если продолжаем, f, если закончили."
    b = gets.chomp

    if b == 'f'
      puts "Расписание составлено: "
      puts @schedule
      exit
    end

    # input = File.open "todo.txt", "r"
    # while (line = input.gets)
    #   puts line
    # end
  end

end

add