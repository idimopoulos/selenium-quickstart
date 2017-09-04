# selenium-quickstart
Setup selenium on Ubuntu 16.04 the lazy way.
This repo will simply download selenium-standalone jar file and the chromedriver under the same directory and will provide an option to start or stop the selenium.

Nothing too fancy :)

## Usage
From wherever you want to set it up:
```
# Clone repo.
git clone https://github.com/idimopoulos/selenium-quickstart.git
# Change directory into the repo.
cd selenium-quickstart
# Make selenium.sh executable.
chmod +x selenium.sh
# Download the driver and the jar file.
./selenium.sh setup
# Start selenium in the background.
./selenium.sh start
# Or start selenium in the foreground.
./selenium.sh start fg
# Stop selenium
./selenium.sh stop
```

## Directories
You can place the folder wherever and create a symlink to your bin folder e.g.
```
# ln -s TARGET SOURCE
sudo ln -s /home/user/selenium-quickstart/selenium.sh /usr/local/bin/selenium
```
and run it as `$ selenium` directly from your bash.
