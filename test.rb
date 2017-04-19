str = File.open('todo.txt'){ |file| file.read }
obr = str.delete("\"\{\}")
spl_str = obr.split(',') # Разбить по двоеточию не более чем на 2 части
a = {}
spl_str.each_with_object({}) do |object|
  key, value = object.split('=>', 2)
  value.to_i
  a[key] = value
end

# hh[key] = value



  # @str = { "1. жить"=>18000, "2. поспим"=>28800, "3. умываться"=>420 }
  a.each { |key, value| a[key] = 3 }
  # # if @n == 0                      
  # #   @n = @t + @time                 #end time of action
  # # else
  # #   @n = @time2+@time
  # end
  puts a