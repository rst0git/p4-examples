# Copyright (c) 2022-present Radostin Stoyanov (radostin.stoyanov@eng.ox.ac.uk)
# All rights reserved
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at :
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

all: run

compile:
	mkdir -p build
	p4c-bm2-psa --p4v 16 --p4runtime-files build/calc.p4.p4info.txt -o build/calc.json calc.p4

run: compile
	sudo psa_switch -i 0@veth0-0 -i 1@veth1-0 --log-console --thrift-port 9090 build/calc.json

cli:
	sudo psa_switch_CLI

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

.PHONY: all compile run cli veth clean
