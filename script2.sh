#!/bin/bash

#mkdir /home/serv1/scripts

for i in {1..4}; do echo -e "#!/bin/bash \necho 'privet$i'" > /home/serv1/scripts/file$i.sh;done

chmod +x /home/serv1/scripts/file{1..4}.sh
rsync -avz /home/serv1/scripts/ root@51.250.18.185:/home/serv2/scripts/

### 1 вариант - работает

#if [ ! -d /home/serv1/temp1/ ]; then
#mkdir /home/serv1/temp1/
#fi

#echo "rsync -avz --delete /home/serv1/temp1/ root@84.201.160.37:/home/serv2/scripts/" | at now +1 week
#echo "rsync -avz --delete /home/serv1/temp1/ root@51.250.18.185:/home/serv2/scripts/" | at now +3 minutes

###------end 1 variant


###2 вариант - работает

echo "ssh root@84.201.160.37 find /home/serv2/scripts/ -type f -mtime +7 -delete" | at now +7 days   # удалять 7 дневные 

#echo "ssh root@51.250.18.185 find /home/serv2/scripts/ -type f -cmin +2 -delete" | at now +3 minutes     # для проверки удалить 5 минутные создания

### ------end 2 variant


# hours, days, weeks. minutes
# -exec rm{}


