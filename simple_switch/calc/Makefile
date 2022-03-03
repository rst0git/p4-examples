all: run

compile:
	mkdir -p build
	p4c-bm2-ss --p4v 16 --p4runtime-files build/calc.p4.p4info.txt -o build/calc.json calc.p4

run: compile
	sudo simple_switch -i 0@veth0-0 -i 1@veth1-0 --log-console --thrift-port 9090 build/calc.json -- --enable-swap

cli:
	sudo simple_switch_CLI

veth:
	sudo ip link add veth0-0 type veth peer name veth0-1
	sudo ip link add veth1-0 type veth peer name veth1-1
	sudo ifconfig veth0-0 up
	sudo ifconfig veth0-1 up
	sudo ifconfig veth1-0 up
	sudo ifconfig veth1-1 up
	sudo ethtool -K veth0-0 tx off
	sudo ethtool -K veth0-1 tx off
	sudo ethtool -K veth1-0 tx off
	sudo ethtool -K veth1-1 tx off

clean:
	rm -rf build/
	sudo ip link del veth0-0
	sudo ip link del veth1-0
