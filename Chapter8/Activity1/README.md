# Activity 1

```
docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube
```
 
 

 
[https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip](https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip)
 
 
```
http://<your IP>:9000
``` 

```
IFCONFIG
```

```
H/5 * * * *
```

```
sonar.projectKey=hit_count
sonar.projectName=hit_count
sonar.projectVersion=1.0
sonar.sources=.
sonar.language=py
sonar.sourceEncoding=UTF-8
# Test Results
sonar.python.xunit.reportPath=nosetests.xml
# Coverage
sonar.python.coverage.reportPath=coverage.xml
# Linter (https://docs.sonarqube.org/display/PLUG/Pylint+Report)
#sonar.python.pylint=/usr/local/bin/pylint
#sonar.python.pylint_config=.pylintrc
#sonar.python.pylint.reportPath=pylint-report.txt
``` 

http://<ip>:9000 

or 

[http://localhost:9000](http://localhost:9000)
 
