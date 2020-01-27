#!/usr/bin/env python3
# Copyright   2019   Yusuke Fujita
# Apache 2.0.
"""This script generates hypothesis utterances aligned with reference segments.
  Usage: gen_align_hyp.py alignment.txt wc.txt > hyp.txt
    alignment.txt is a session-level word alignment generated by align-text command.
    wc.txt is a sequence of utt-id:reference_word_count generated by 'local/get_ref_perspeaker_persession_file.py'.
"""

import sys
import io
import string
output = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')


def load_align_text(f):
    alignments = {}
    for line in f:
        recoid, res = line.split(None, 1)
        alignments[recoid] = []
        toks = res.split(';')
        for tok in toks:
            ref, hyp = tok.split()
            alignments[recoid].append((ref, hyp))
    return alignments


alignments = load_align_text(open(sys.argv[1], 'r', encoding='utf8'))

for line in open(sys.argv[2], 'r', encoding='utf8'):
    recoid, res = line.split(None, 1)
    ali = iter(alignments[recoid])
    toks = res.split()
    for tok in toks:
        uttid, count = tok.split(':')
        count = int(count)
        text = ''
        for i in range(count):
            while True:
                ref, hyp = ali.__next__()
                if hyp != '<eps>':
                    text += ' ' + hyp
                if ref != '<eps>':
                    break
        output.write(uttid + ' ' + text.strip() + '\n')
