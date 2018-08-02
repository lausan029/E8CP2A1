def aprobados(archivo,defecto=5)
	file = File.open(archivo, 'r')
  contents = file.readlines
  file.close

  result = 0
  contents.each do |e|
		new_c  = e.split(",")
		dv     = new_c.length - 1
		result = new_c.inject(0){|x,y| x + y.to_i}
		promedio = result/dv
		if promedio >= defecto
			puts "El alumno #{new_c[0]} ha aprobado la materia"
		end
	end
end


puts 'Ingrese una opcion:'
puts ' 1: Promedio de cada alumno'
puts ' 2: Inasistencias de cada alumno'
puts ' 3: Alumnos aprobados'
puts ' 4: Salir'
num = gets.chomp.to_i


while num != 4
	case num
	when 1
		file = File.open('archivo.csv', 'r')
  	contents = file.readlines
  	file.close

  	promedio = File.open('promedio.csv', 'w')
  	
  	result = 0
			  contents.each do |e|
					new_c  = e.split(",")
					dv     = new_c.length - 1
					result = new_c.inject(0){|x,y| x + y.to_i}
					promedio.puts "El alumno #{new_c[0]} tiene #{result/dv} puntos en promedio"
				end
		promedio.close
	when 2
		file = File.open('archivo.csv', 'r')
	  contents = file.readlines
	  file.close
	  ausencia = " A"
	  ausencia_o = " A\n"
	  sum = 0
		  contents.each do |e|
				new_c  = e.split(",")
				new_c.map do |a|
					if ausencia == a || ausencia_o == a
	  				sum += 1
	  			end
				end
				puts "El alumno #{new_c[0]} tiene #{sum} inasistencia"
				sum = 0 
			end
		when 3
			aprobados('archivo.csv')
		else
		  puts "Introduzca una opcion correcta"
		end

puts 'Ingrese una opcion:'
puts ' 1: Promedio de cada alumno'
puts ' 2: Inasistencias de cada alumno'
puts ' 3: Alumnos aprobados'
puts ' 4: Salir'
num = gets.chomp.to_i
end

puts "Hasta Luego"