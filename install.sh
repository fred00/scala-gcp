#!/bin/bash

# On debian only: allow apt to download packages through https
sudo apt-get update
sudo apt-get --yes install apt-transport-https

# On debian/ubuntu: install sbt

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get --yes install sbt

# update certificates to allow sbt to download its dependencies.
sudo update-ca-certificates -f

# Add Scala syntax highlighting
mkdir -p ~/.vim/{ftdetect,indent,syntax}
for d in ftdetect indent syntax ; do wget -O ~/.vim/$d/scala.vim https://raw.githubusercontent.com/derekwyatt/vim-scala/master/$d/scala.vim; done

echo "Now you can run a scala project using SBT and edit files using VIM."
echo "First SBT launch will download required dependencies."
echo
echo "Enable syntax highlighting in VIM with :syntax on"
echo "Enjoy!"
