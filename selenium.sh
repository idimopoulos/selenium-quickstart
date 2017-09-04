#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
TMP_DIR=`mktemp -d -p "/tmp"`

function setup_selenium_components {
	echo "Changing to directory ${DIR}."
	if [[ -f "${DIR}/selenium-server.jar" ]]; then
		echo "Selenium server jar already exists. Skipping..."
	else
		echo "Downloading selenium-server jar file."
		curl -Ss "https://goo.gl/hWYjHR" -o selenium-server.jar
	fi
	if [[ -f "${DIR}/chromedriver" ]]; then
		echo "Chromedriver already exists. Skipping..."
	else	
		echo "Changing to directory ${TMP_DIR}."
		cd ${TMP_DIR}
		echo "Downloading chromedriver for linux x64."
		curl -Ss "https://chromedriver.storage.googleapis.com/2.32/chromedriver_linux64.zip" -o chromedriver.zip
		echo "Unzipping content of chromedriver.zip into ${TMP_DIR}"
		unzip -o chromedriver.zip
		echo "Moving chromedriver into ${DIR}"
		mv ${TMP_DIR}/chromedriver ${DIR}/chromedriver
	fi

	echo "You should be ready. :)";
}

action="${1}"
case "${action}" in
	"start" )
		# To run on the backend, switch the next to lines from and to comment.
		# nohup /usr/bin/java -Dwebdriver.chrome.driver=chromedriver -jar selenium-server-standalone-3.5.3.jar &;;
		/usr/bin/java -Dwebdriver.chrome.driver=chromedriver -jar selenium-server-standalone-3.5.3.jar;;
	"stop" )
		pkill -f 'selenium-server-standalone*';;
	"setup" )
		setup_selenium_components;;
esac
