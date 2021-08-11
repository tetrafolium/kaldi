#!/usr/bin/env python3

# Copyright 2016-2018    Johns Hopkins University (Dan Povey)
#           2016    Vijayaditya Peddinti
#           2017    Google Inc. (vpeddinti@google.com)
# Apache 2.0.

# This is like xconfig_to_configs.py but with a simpler interface; it writes
# to a single named file.

import libs.common as common_lib
import libs.nnet3.xconfig.parser as xparser
import argparse
import os
import sys
from collections import defaultdict

sys.path.insert(0, 'steps/')
# the following is in case we weren't running this from the normal directory.
sys.path.insert(0, os.path.realpath(os.path.dirname(sys.argv[0])) + '/')


def get_args():
    # we add compulsory arguments as named arguments for readability
    parser = argparse.ArgumentParser(
        description="Reads an xconfig file and creates config files "
        "for neural net creation and training",
        epilog='Search egs/*/*/local/{nnet3,chain}/*sh for examples')
    parser.add_argument('--xconfig-file',
                        required=True,
                        help='Filename of input xconfig file')
    parser.add_argument('--existing-model',
                        help='Filename of previously trained neural net '
                        '(e.g. final.mdl) which is useful in case of '
                        'using nodes from list of component-nodes in '
                        'already trained model '
                        'to generate new config file for new model.'
                        'The context info is also generated using '
                        'a model generated by adding final.config '
                        'to the existing model.'
                        'e.g. In Transfer learning: generate new model using '
                        'component nodes in existing model.')
    parser.add_argument('--config-file-out',
                        required=True,
                        help='Filename to write nnet config file.')
    parser.add_argument('--nnet-edits',
                        type=str,
                        default=None,
                        action=common_lib.NullstrToNoneAction,
                        help="""This option is useful in case the network you
                        are creating does not have an output node called
                        'output' (e.g. for multilingual setups).  You can set
                        this to an edit-string like: 'rename-node old-name=xxx
                        new-name=output' if node xxx plays the role of the
                        output node in this network.  This is only used for
                        computing the left/right context.""")

    print(' '.join(sys.argv), file=sys.stderr)

    args = parser.parse_args()

    return args


def write_config_file(config_file_out, all_layers):
    # config_basename_to_lines is map from the basename of the
    # config, as a string (i.e. 'ref', 'all', 'init') to a list of
    # strings representing lines to put in the config file.
    config_basename_to_lines = defaultdict(list)

    for layer in all_layers:
        try:
            pairs = layer.get_full_config()
            for config_basename, line in pairs:
                config_basename_to_lines[config_basename].append(line)
        except Exception as e:
            print("{0}: error producing config lines from xconfig "
                  "line '{1}': error was: {2}".format(sys.argv[0], str(layer),
                                                      repr(e)),
                  file=sys.stderr)
            # we use raise rather than raise(e) as using a blank raise
            # preserves the backtrace
            raise

    with open(config_file_out, 'w') as f:
        print('# This file was created by the command:\n'
              '# {0} '.format(sys.argv),
              file=f)
        lines = config_basename_to_lines['final']
        for line in lines:
            print(line, file=f)


def main():
    args = get_args()
    existing_layers = []
    if args.existing_model is not None:
        existing_layers = xparser.get_model_component_info(args.existing_model)
    all_layers = xparser.read_xconfig_file(args.xconfig_file, existing_layers)
    write_config_file(args.config_file_out, all_layers)


if __name__ == '__main__':
    main()

# test:
# (echo 'input dim=40 name=input'; echo 'output name=output input=Append(-1,0,1)')  >xconfig; steps/nnet3/xconfig_to_config.py --xconfig-file=xconfig --config-file-out=foo
