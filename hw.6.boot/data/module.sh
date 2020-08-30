#!/bin/bash

declare -r module_dir="/usr/lib/data/modules.d/01pinguin"

mkdir "$module_dir"
mv /vagrant/data/module-setup.sh "$module_dir"
mv /vagrant/data/print-pinguin.sh "$module_dir"

data -fv
