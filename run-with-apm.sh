# run with Java APM Agent
java -javaagent:./elastic-apm-agent-1.12.0.jar \
-Delastic.apm.server_urls=http://localhost:8200 \
-Delastic.apm.secret_token=secret_token \
-Delastic.apm.service_name=spring-petclinic-monolith \
-Delastic.apm.application_packages=org.springframework.samples \
-Delastic.apm.trace_methods="org.springframework.samples.petclinic.*" \
-jar target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar

# Add Trace Methods property to above run command
# This will trace all methods in the package.
#-Delastic.apm.trace_methods="org.springframework.samples.petclinic.*" \

# Use is you have a self signed cert for testing 
#-Delastic.apm.verify_server_cert=false \
