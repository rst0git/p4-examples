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

from scapy.all import sniff

def handle_pkt(pkt):
    pkt.show2()

def main():

    if len(sys.argv) != 2:
        print("Usage: {} <iface>".format(sys.argv[0]))
        sys.exit(1)

    iface = sys.argv[1]

    print("sniffing on %s" % iface)
    sniff(filter="ip and ( tcp or udp )", iface=iface, prn=handle_pkt)

if __name__ == '__main__':
    main()
