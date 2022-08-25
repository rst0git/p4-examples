/* Copyright (c) 2022-present Radostin Stoyanov
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * This file defines ingress packet processing that implement
 * the Calculator Protocol.
 */

struct headers {
    ethernet_t   ethernet;
    p4calc_t     p4calc;
}

struct metadata {
    /* empty */
}

parser IngressParserImpl(
    packet_in packet,
    out   headers_t hdr,
    inout metadata_t user_meta,
    in    psa_ingress_parser_input_metadata_t istd,
    in    empty_metadata_t resubmit_meta,
    in    empty_metadata_t recirculate_meta
) {


    state start {
        packet.extract(hdr.ethernet);
        transition select(hdr.ethernet.etherType) {
            P4CALC_ETYPE : check_p4calc;
            default      : accept;
        }
    }

    state check_p4calc {
        transition select(
            packet.lookahead<calc_t>().ver
        ) {
            (P4CALC_VER) : parse_p4calc;
            default                          : accept;
        }
    }

    state parse_p4calc {
        packet.extract(hdr.p4calc);
        transition accept;
    }
}

control ingress(
    inout headers_t hdr,
    inout metadata_t user_meta,
    in    psa_ingress_input_metadata_t  istd,
    inout psa_ingress_output_metadata_t ostd
) {

}

control IngressDeparserImpl(
    packet_out packet,
    out   empty_metadata_t clone_i2e_meta,
    out   empty_metadata_t resubmit_meta,
    out   empty_metadata_t normal_meta,
    inout headers_t hdr,
    in    metadata_t meta,
    in    psa_ingress_output_metadata_t istd
) {
    apply {
        packet.emit(hdr);
    }
}


