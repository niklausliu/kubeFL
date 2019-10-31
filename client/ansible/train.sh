if [ "$#" -lt 1 ]; then
    echo "$# is Illegal number of parameters."
    echo "Usage: $0 [options]"
    exit 1
fi
args=("$@")
echo 'Round' $1
echo 'Server Ip' $2
echo 'Epoch' $3

ansible-playbook -i ./inventory/ec2.py \
      --limit "tag_type_client" \
      -u ubuntu \
      --private-key ~/.ssh/SoRT.pem train.yaml \
      --extra-vars "round=$1 server=$2 epoch=$3" -vvvv
