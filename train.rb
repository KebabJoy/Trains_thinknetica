class Train
	attr_accessor :speed
	attr_reader :type; :number; :wagons_count; :route; :current_station; :station_index
	def initialize(type, num, wagons)
		@type = type
		@number = num
		@wagons_count = wagons
		@speed = 0
	end

	def set_route(route)
		@route = route
		@current_station = @route.stations[0]
		@route.stations[0].trains << self
	end

	def wagons_count
		@wagons_count
	end

	def current_speed
		@speed
	end

	def add_wagon
		@wagons_count += 1 if @speed == 0
	end

	def delete_wagon
		if @speed == 0
			@wagons_count -= 1
		end
	end

	def move_to_next_station
		@route.stations[@route.stations.index(@current_station)].trains.delete(self)
		if @route.stations.index(@current_station) == @route.stations.length-1
			puts "Поезд достиг конечной станции и отправляется в депо"
		else
			@current_station = self.next_station
			@route.stations[@route.stations.index(@current_station)].trains << self
		end
	end

	def move
		@speed = 80
	end

	def stop
		@speed = 0
	end

	def current_station
		@route.stations.index(@current_station)
	end

	def next_station
		if @current_station == @route.stations.last
			@route.stations[@route.stations.length-2]
		else
			@route.stations[@route.stations.index(@current_station)+1]
		end
	end

	def previous_station
		if @current_station == @route.stations[0]
			@route.stations[1]
		else
			@route.stations[@route.stations.index(@current_station)-1]
		end
	end
end



