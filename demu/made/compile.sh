#travaille avec un autre bout de de code, qui fait l'installation, a la 
#fois pour les binaire et les codes ( la seul chose qui change est 
#build.sh, y a pas sur les binaire )

file=~/demu/made/test
if [ -d temp ]
   then
      rm -R temp
fi
mkdir temp


if [ -d $file/src ]
   then
      cp -r $file/src temp/source
fi
if [ -d $file/doc ]
   then
      if [ -f $file/doc/index.html ]
         then
            cp -r $file/doc temp/doc
         else
            echo "la doc ne contient pas de fichier index.html"
            exit -1
      fi
fi

if [ -d $file/open ]
   then
      cp -r $file/open temp/open
fi

if [ -d $file/bin ]
   then
      cp -r $file/bin temp/bin
fi

cp $file/type temp/type
cp $file/install/desc temp/desc
cp $file/install/install.sh temp/build.sh
if [ -f $file/install/build.sh ]
   then
      cp $file/install/build.sh temp/build.sh
fi
cp $file/install/pre-install.sh temp/pre-install.sh
cp $file/install/post-install.sh temp/post-install.sh
cp $file/install/uninstall.sh temp/uninstall.sh
cp $file/install/need temp/need




tar -cvjSf rendu.tar.bz2 temp
rm -r temp
