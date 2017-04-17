@t = Time.now
@schedule = {}
@ordnum = 1
@n = 0

def choice_task                     # what to do with schedules

  edit
  add_new
  delete
  choice_from_list

end

def add_new                             # to fill schedule
                 
  def add_new_strings                         #add new string
    puts "Придумайте имя для расписания (по умолчанию todo)"
    @sch_name = gets.chomp

    if @sch_name == ''
      @sch_name = 'todo'
    end
      
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

    output = File.open "#{@sch_name}.txt", "a"
    output.write @schedule
    output.close

  end
    
  loop do
    puts 7.chr
    add_new_strings
    @time2 = @n
    
    @ordnum += 1
    puts "Продолжить? Enter, если продолжаем, f, если закончили."
    b = gets.chomp

    if b == 'f'
      puts "Расписание #{@sch_name} составлено: "
      puts @schedule
      exit
    end

    # input = File.open "todo.txt", "r"
    # while (line = input.gets)
    #   puts line
    # end
  end

end

add_new