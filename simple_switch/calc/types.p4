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
 * This file defines constants and types
 * used by the Calculator Protocol.
 */

typedef bit<48> mac_addr_t;

enum bit<16> ether_type_t {
    CALC = 0x1234
}

enum bit<8> op_t {
    ADD  = 0x2b,  /* + */
    SUB  = 0x2d,  /* - */
    AND  = 0x26,  /* & */
    OR   = 0x7c,  /* | */
    XOR  = 0x5e,  /* ^ */
    MUL  = 0x2a,  /* * */
    SHL  = 0x3c,  /* < */
    SHR  = 0x3e,  /* > */
    CMP  = 0x3f,  /* ? */
    MIN  = 0x6d,  /* m */
    MAX  = 0x4d,  /* M */
    CNT1 = 0x31,  /* 1 */
    LOG2 = 0x32,  /* 2 */
    RND  = 0x52   /* R */
}

const bit<8> P = 0x50;
const bit<8> FOUR = 0x34;
const bit<8> VER = 0x01;

