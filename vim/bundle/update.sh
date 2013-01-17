for i in ./*;do if [ -d "$i" ]; then echo $i;cd $i; git pull;cd ..; fi; done
