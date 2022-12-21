#https://docs.docker.com/engine/reference/commandline/build/
if [ -z $CURRENT ]; then
	CURRENT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
fi

docker build --no-cache=true -t splunk/splunk:latest .
docker tag splunk/splunk:latest splunk/splunk:latest 
docker tag splunk/splunk:latest registry.splunk.com/splunk/splunk:latest 
docker tag splunk/splunk:latest registry.splunk.com/splunk/splunk:latest
