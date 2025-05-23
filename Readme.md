start tomcat server

cd ~/tomcat
./bin/startup.sh

view project
http://localhost:8080/MyJsApp

stop tomcat server
./bin/shutdown.sh

compile the java code   
javac -cp "WEB-INF/lib/mysql-connector-j-9.3.0.jar" -d WEB-INF/classes ConnectionHelper.java
