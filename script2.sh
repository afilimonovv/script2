#!/bin/bash

for i in {1..4}; do echo -e "#!/bin/bash \necho 'privet$i'"  > /root/scripts/file$i.sh;done

chmod +x file{1..4}.sh

if ! [-d /root/temp1/]; then
mkdir /root/temp1/
fi

rsync -avz /root/scripts/ root@51.250.17.118:/root/scripts/
#echo "rsync -avz --delete /root/temp1/ root@51.250.11.132:/root/scripts/" | at now +1 week




# hours, days, weeks. minutes



