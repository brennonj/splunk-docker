#https://docs.docker.com/engine/reference/commandline/build/
if [ -z $CURRENT ]; then
	CURRENT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
fi

docker build --no-cache=true -t splunk/splunklight:7.1.2 .
docker tag splunk/splunklight:7.1.2 splunk/splunklight:latest
docker tag splunk/splunklight:7.1.2 dennybritz/splunklight:latest
docker tag splunk/splunklight:7.1.2 dennybritz/splunklight:7.1.2