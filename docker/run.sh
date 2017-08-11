#!/bin/sh

if [ -d "/home/sites/picocms/init/config" ] && [ "$(ls -A /home/sites/picocms/init/config)" ]; then
  echo "Moving Pico configuration"
  cp -rn /home/sites/picocms/init/config/* /home/sites/picocms/config/
fi

if [ -d "/home/sites/picocms/init/plugins" ] && [ "$(ls -A /home/sites/picocms/init/plugins)" ]; then
  echo "Moving initial plugins to plugins"
  cp -rn /home/sites/picocms/init/plugins/* /home/sites/picocms/plugins/
fi

if [ -d "/home/sites/picocms/init/themes" ] && [ "$(ls -A /home/sites/picocms/init/themes)" ]; then
  echo "Moving initial themes to themes"
  cp -rn /home/sites/picocms/init/themes/* /home/sites/picocms/themes/
fi

if [ ! -d "/home/sites/picocms/content" ] || [ ! "$(ls -A /home/sites/picocms/content)" ]; then
    echo "Moving content-sample to content"
    mv /home/sites/picocms/content-sample/* /home/sites/picocms/content/  
fi

rm -rf /home/sites/picocms/init
rm -rf /home/sites/picocms/content-sample

/init
