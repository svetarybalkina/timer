@t = Time.now
@schedule = {}
@ordnum = 1
@n = 0

def action

	puts "Что будем делать?"
	a = gets.chomp
	puts "Как долго будем #{a}? (в минутах)"
	act = @ordnum.to_s + ". " + a
	@time = gets.chomp.to_i*60
	if @n == 0
		@n = @t + @time #время окончания
	else
		@n = @time2+@time
	end
		@schedule[act] = @n
		puts "#{act} до #{@n}"

end
	
loop do
	action
	@time2 = @n
	
	@ordnum += 1
	puts "Продолжить? Любой символ, если 'Да', Enter, если закончили."
	a = gets.chomp

	if a == ""
		puts "Расписание составлено: "
		puts @schedule
		exit
	end
end