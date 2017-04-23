

puts "Введите имя нужного расписания (по умолчанию todo)" #call one schedule from list
  # @sch_name = gets.chomp
  str = File.open('todo.txt'){ |file| file.read } # импортировано расписание из файла
  cut_str = str.delete("\"\{\}")                  # обрезана строка расписания от кавычек и скобок
  spl_str = cut_str.split(', ')                    # разбита строка на блоки действие+период
  a = {}               

  spl_str.each_with_object({}) do |object|        # блоки сложены в новый хэш
    key, value = object.split('=>')
    a[key] = value
  end

  n = 0

  a.each do |k, v|                       # значение меняется на время окончания действия пункта расписания

    v = v.to_i
        
    if n == 0
      v1 = Time.now + v
      a[k] = v1
      n = v

    else

    v1 = Time.now + v + n
      a[k] = v1
      n = v+n
    end

end

puts a

loop do

  present_time = Time.now
  b =present_time.to_s

    a.each do |k, v|
      v.to_s
      puts "#{v} = #{b}"
      if "#{v}" == b
        puts 7.chr
      else 
        puts "No"
      end
  end
end
  # output = File.open "todo1.txt", "w"
  # output.write a
  # output.close