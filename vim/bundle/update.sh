for i in ./*;do if [ -d "$i" ]; then echo $i;cd $i; git checkout master; git pull;cd ..; fi; done
