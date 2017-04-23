str = File.open('todo.txt'){ |file| file.read } # импортировано расписание из файла
cut_str = str.delete("\"\{\}")                  # обрезана строка расписания от кавычек и скобок
spl_str = cut_str.split(', ')                    # разбита строка на блоки действие+период
a = {}                                    
spl_str.each_with_object({}) do |object|        # блоки сложены в новый хэш
  key, value = object.split('=>')
  a[key] = value
end

# loop do
n = 0

  a.each do |k, v|                       # поменять ключ на время действия

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
      
      puts n

  # # # if @n == 0                      
  # # #   @n = @t + @time                 #end time of action
  # # # else
  # # #   @n = @time2+@time
  end

# end

  puts a

# t = Time.now
# @schedule = {}
# @ordnum = 1
# @n = 0