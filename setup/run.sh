set -eux
DIR="$( dirname "${BASH_SOURCE[0]}" )"
pushd $DIR
bash ./prepare.sh
bash ./generate-ca.sh
bash ./generate-server.sh
bash ./generate-client.sh
bash ./configure-server.sh
bash ./generate-client-2.sh
popd