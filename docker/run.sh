#!/bin/sh

echo "Moving Pico configuration"
mv /home/sites/picocms/init/config/* /home/sites/picocms/config/

echo "Moving initial plugins to plugins"
mv /home/sites/picocms/init/plugins/* /home/sites/picocms/plugins/

echo "Moving initial themes to themes"
mv /home/sites/picocms/init/themes/* /home/sites/picocms/themes/

echo "Moving content-sample to content"
mv /home/sites/picocms/init/content/* /home/sites/picocms/content/
mv /home/sites/picocms/content-sample/* /home/sites/picocms/content/

rm -rf /home/sites/picocms/init

/init
