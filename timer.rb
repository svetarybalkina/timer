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
  end

end  

def add_act_time                        #add strings - actions and periods to schedule  
  puts "Что будем делать?"
  action = gets.chomp
  act = @ordnum.to_s + ". " + action

  puts "Сколько минут будем #{action}?"
  @time = gets.chomp.to_i*60

  @schedule[act] = @time

  output = File.open "#{@sch_name}.txt", "w"
  output.write @schedule
  output.close

end

def run                               #start schedule

  puts "Введите имя нужного расписания (по умолчанию todo)" #call one schedule from list
  # @sch_name = gets.chomp
  str = File.open('todo.txt'){ |file| file.read }
  # @str = { "1. жить"=>18000, "2. поспим"=>28800, "3. умываться"=>420 }
  str.each { |key, value| str[key] = 3 }
  # # if @n == 0                      
  # #   @n = @t + @time                 #end time of action
  # # else
  # #   @n = @time2+@time
  # # end
  puts str
  
end

def add_new_sch                         #add new schedule (askes for name), run add_string

  puts "Назовите расписание (по умолчанию todo)"
  @sch_name = gets.chomp

  if @sch_name == ''
    @sch_name = 'todo'
  end

  add_strings

end

def choose_another #не начато
end

def edit #не начато
end

def delete #не начато
end

def choose_task                     # what to do with schedules
  puts "Choose what to do with your schedule: run existed schedule, add new, choose another, edit existed schedule or delete."
  order = gets.chomp
  if order == 'run'
    run
  elsif order == 'add new'
    add_new_sch

  elsif order == 'choose another'
  choose_another

  elsif order == 'delete'
  delete

  else order == 'edit'
    edit
  end
  
end

add_new_sch