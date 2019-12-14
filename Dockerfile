FROM openjdk:8
VOLUME /tmp
ADD target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar app.jar
ADD elastic-apm-agent-1.12.0.jar apm-agent.jar
ENV JAVA_OPTS="-javaagent:./apm-agent.jar -jar app.jar"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]