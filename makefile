CXX = g++
CXXFLAGS = -Wall -Wextra -Iinclude -lpthread

all: sensor monitor

sensor: sensor.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@

monitor: monitor.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@

run: run_sensor run_monitor

run_sensor: sensor
	@echo "Ejecutando sensor en segundo plano..."
	@./sensor -s 1 -t 3 -f datos.txt -p pipe1 &

run_monitor: monitor
	@echo "Ejecutando monitor en segundo plano..."
	@./monitor -b 10 -t file-temp.txt -h file-ph.txt -p pipe1 &
