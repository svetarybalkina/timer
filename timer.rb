@t = Time.now
@schedule = {}
@ordnum = 1
@n = 0

def add_strings

  loop do
    # puts 7.chr
    add_act_time
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

def add_new_sch                         #add new schedule (askes for name), run add_string

  puts "Назовите расписание (по умолчанию todo)"
  @sch_name = gets.chomp

  if @sch_name == ''
    @sch_name = 'todo'
  end

  add_strings

end

def add_act_time                        #add strings - actions and periods to schedule  
  puts "Что будем делать?"
  action = gets.chomp
  act = @ordnum.to_s + ". " + action

  puts "Сколько минут будем #{action}?"
  @time = gets.chomp.to_i*60

  @schedule[act] = @time

  output = File.open "#{@sch_name}.txt", "a"
  output.write @schedule
  output.close

end

def run                               #start schedule

  # puts "Введите имя нужного расписания (по умолчанию todo)" #call one schedule from list
  # @sch_name = gets.chomp
  string = File.open('todo.txt'){ |file| file.read }
  puts string
  
  # if @n == 0                      
  #   @n = @t + @time                 #end time of action
  # else
  #   @n = @time2+@time
  # end

end

def choose_task                     # what to do with schedules
  puts "Choose what to do: run last schedule (run), add new, choose from list"
  order = gets.chomp
  if order == 'run'
    run
  elsif order == 'add_new'
    add_new_sch

  # else order == 'choose from list'
  #   choose_from_list
  end
  
  # run
  # edit
  # add_new
  # delete
  # choose_from_list

end

choose_task