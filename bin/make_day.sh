#!/bin/bash

mkdir "$1"

for PART in {1..2}
do
  cat > $1/part${PART}.rb << EOM
def main
end

main if __FILE__ == \$PROGRAM_NAME
EOM

cat > $1/part${PART}_spec.rb << EOM
require_relative './part$PART.rb'

describe 'day $1 part $PART' do
end
EOM
done
