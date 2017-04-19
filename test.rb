str = File.open('todo.txt'){ |file| file.read } # импортировано расписание из файла
cut_str = str.delete("\"\{\}")                  # обрезана строка расписания от кавычек и скобок
spl_str = cut_str.split(', ')                    # разбита строка на блоки действие+период
a = {}                                    
spl_str.each_with_object({}) do |object|        # блоки сложены в новый хэш
  key, value = object.split('=>')
  a[key] = value
end

# hh[key] = value



  # @str = { "1. жить"=>18000, "2. поспим"=>28800, "3. умываться"=>420 }
  a.each do |k, v|                       # поменять ключ на время действия

    if k[0] == "1" 
      vv = v.to_i
      vv = vv + Time.now
    # else 
      # puts "No"
    #=> 0
  # # # if @n == 0                      
  # # #   @n = @t + @time                 #end time of action
  # # # else
  # # #   @n = @time2+@time
  end
  end
  puts a

# t = Time.now
# @schedule = {}
# @ordnum = 1
# @n = 0