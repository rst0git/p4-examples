#!/usr/bin/python3
#
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

import sys
import socket
import random

from scapy.all import sendp, get_if_list, get_if_hwaddr
from scapy.all import Ether, IP, TCP

def get_if():
    ifs = get_if_list()
    for i in ifs:
        if "eth0" in i:
            return i
    print("Cannot find eth0 interface")
    sys.exit(1)

def main():
    if len(sys.argv) < 3:
        print('Usage: %s <iface> <destination> "<message>"' % sys.argv[0])
        sys.exit(1)

    iface = sys.argv[1]
    addr = socket.gethostbyname(sys.argv[2])

    print("sending on interface %s to %s" % (iface, str(addr)))
    pkt = Ether(src=get_if_hwaddr(iface), dst='ff:ff:ff:ff:ff:ff') / IP(dst=addr)
    pkt /= TCP(dport=1234, sport=random.randint(49152, 65535)) / sys.argv[3]
    pkt.show2()
    sendp(pkt, iface=iface, verbose=False)

if __name__ == '__main__':
    main()
