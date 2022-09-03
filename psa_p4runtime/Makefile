all: run

compile:
	mkdir -p build
	mkdir -p logs
	p4c-bm2-psa --p4v 16 --p4runtime-files build/main.p4.p4info.txt -o build/main.json main.p4

run: compile
	sudo psa_switch \
		-i 0@veth0-0 \
		-i 1@veth1-0 \
		--log-console \
		--thrift-port 9090 \
		build/main.json \
		-- \
		--grpc-server-addr 0.0.0.0:9551

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
	rm -rf build/ logs/
	sudo ip link del veth0-0
	sudo ip link del veth1-0
