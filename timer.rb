@t = Time.now
@schedule = { }
@ordnum = 1
@n = 0

def add_strings
  loop do
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

def add_act_time                        # add strings - actions and periods to schedule  
  puts "Что будем делать?"
  action = gets.chomp
  act = @ordnum.to_s + ". " + action

  puts "Сколько минут будем #{action}?"
  @time = gets.chomp.to_i*60

  @schedule[act] = @time

  output = File.open "#{@sch_name}.json", "w"
  output.write @schedule
  output.close
end

def run                               # start schedule
  puts "Введите имя нужного расписания (по умолчанию todo)" # call one schedule from list
  @sch_name = gets.chomp
  str = File.open("#{@sch_name}.json") { |file| file.read } # импортировано расписание из файла
  cut_str = str.delete("\"\{\}")                  # обрезана строка расписания от кавычек и скобок
  spl_str = cut_str.split(', ')                    # разбита строка на блоки действие+период
  a = { }               

  spl_str.each_with_object( { } ) do |object|        # блоки сложены в новый хэш
    key, value = object.split('=>')
    a[key] = value
  end

  n = 0

  a.map do |k, v|                       # значение меняется на время окончания действия пункта расписания

    v = v.to_i
        
    if n == 0
      v1 = Time.now + v
      a[k] = v1
      n = v
    else
      v1 = Time.now + v + n
      a[k] = v1
      n += v
    end
    
  end

  puts a

  loop do

  present_time = Time.now
  b = present_time.to_s

    a.map do |k, v|
      v.to_s
      if "#{v}" == b
        puts "#{k} окончить. Переходите к следующему пункту."
        puts 7.chr
        # puts a
      end
    end
  end
end

def add_new                         # add new schedule (askes for name), run add_string
  puts "Назовите расписание (по умолчанию todo)"
  @sch_name = gets.chomp

  if @sch_name == ''
    @sch_name = 'todo'
  end

  add_strings
end

def choose_another 
end                                      # TODO

def edit 
end                                      # TODO

def delete 
end                                      # TODO

def choose_task                          # what to do with schedules
  puts "Choose what to do with your schedule: run, add new, choose another, delete or edit."
  order = gets.chomp
  if order == 'run'
    run
  elsif order == 'add new'
    add_new

  elsif order == 'choose another'
    choose_another

  elsif order == 'delete'
    delete

  else order == 'edit'
    edit
  end
end

choose_task