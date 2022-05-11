### [Spark Operator](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator)   
#### [Spark 3.4 Documentation](https://github.cfpb.gov/HMDA-Operations/hmda-devops/tree/eks/spark-operator/spark3.4)

#### INSTALL Spark Operator  version 3.1.x
```
helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator

helm install hmda \
--set sparkJobNamespace=default \
--set serviceAccounts.spark.name=spark \
spark-operator/spark-operator 

helm uninstall hmda 
```
##### EXAMPLE JAR [spark-pi.yaml](https://raw.githubusercontent.com/GoogleCloudPlatform/spark-on-k8s-operator/master/examples/spark-pi.yaml)    
Spark-pi is a example spark jar that calculates value of PI   
```
kubectl apply -f spark-pi-secure.yaml
kubectl logs -f spark-pi-driver 
kubectl logs spark-pi-driver  | grep ^Pi

kubectl describe sparkapplications spark-pi
kubectl port-forward svc/spark-pi-ui-svc  4040:4040

kubectl delete sparkapplications spark-pi
```
##### EXAMPLE Python
Spark-pi is a example python job that calculates value of PI
```
kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/spark-on-k8s-operator/master/examples/spark-py-pi.yaml
kubectl describe sparkapplications pyspark-pi 
kubectl delete sparkapplications pyspark-pi
```
#### BUILD Spark Operator Image
[Spark operator image repo](https://console.cloud.google.com/gcr/images/spark-operator?project=active-tangent-189416)    
Based on the the [Dockerfile](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator/blob/master/spark-docker/Dockerfile)
```
git clone https://github.com/GoogleCloudPlatform/spark-on-k8s-operator
cd spark-on-k8s-operator
docker build -t 626560329871.dkr.ecr.us-east-1.amazonaws.com/hmda/spark-operator:v1beta2-1.3.3-3.1.1-v4 -f ../Dockerfile-spark-operator .
docker push 626560329871.dkr.ecr.us-east-1.amazonaws.com/hmda/spark-operator:v1beta2-1.3.3-3.1.1-v4
```
##### Patch Spark Operator
```
kubectl patch deploy hmda-spark-operator   -p \
'{"spec":{"template":{"spec":{"containers":[{"name":"spark-operator","image":"dtr-registry.cfpb.gov/hmda-testing/spark-operator:v1beta2-1.3.3-3.1.1-v4"}]}}}}'
```
### HMDA Reporting Spark Application  
[More info, applicaton yaml files in hmda-platform repo](https://github.com/cfpb/hmda-platform/tree/master/kubernetes/hmda-spark-reporting)   
[Data science repo](https://github.com/cfpb/HMDA_Data_Science_Kit/tree/master/A_D_Reports/hmda-spark-reporting) contains partial code, reference only   

There are two options to run A&D reports: In production  or In Development. If running in development, the production data must be copied to development. This README assumes that the reports are being run in development. 

In summary, the spark jobs that run the reports do the following things:

- Disclosure Reports: Read a record from kafka topic of type (<lei>:<submission-id>). The spark job will fetch all the data for the lei from PG tables, perform analysis for each msamd, and generate an S3 file for each msamd. 
- Aggregate Reports: Aggregate reports will run on the entire dataset for each msamd and S3 files will be published. 

The spark jobs depend on the following secrets:
- inst-postgres-credentials: JDBC URL connection to the DB
- aws-credentials: containing access and secret keys
- kafka-hosts: connection informatino for kafka
- aws-ev: dev vs. prod

#### RUN Disclosure Applicaiton 
```
kubectl apply -f hmda-spark-disclosure.yaml
kubectl describe  -f hmda-spark-disclosure.yaml
kubectl logs hmda-spark-disclosure-driver
kubectl delete sparkapplications hmda-spark-disclosure

kubectl port-forward hmda-spark-disclosure-driver 4040:4040
```
#### Verifying: Disclosure reports:
There are two types of disclosure reports

1.json (Applications by Tract)   
2.json (Loans Purchased by Tract)   
Below are the S3 paths for disclosure reports   
`aws s3 ls s3://cfpb-hmda-public/<dev | prod>/reports/disclosure/<year>/<lei>/<msamd>/<1.json | 2.json>`   
Monitor, report count should increase     
`aws s3 ls s3://cfpb-hmda-public/dev/reports/disclosure/2021/ | wc -l`

#### RUN Aggregate  Applicaiton 
```
kubectl apply -f hmda-spark-aggregate.yaml
kubectl describe  -f hmda-spark-aggregate.yaml
kubectl logs hmda-spark-disclosure-driver
kubectl delete sparkapplications hmda-spark-aggregate

kubectl port-forward hmda-spark-aggregate-driver 4040:4040
```
#### Verifying: Aggregate reports:
There are seven types of aggregate reports

1.json (Applications by Tract)  
2.json (Loans Purchased by Tract)   
3.json (Applications by Race and Sex)   
4.json (Applications by Ethnicity and Sex)   
5.json (Applications by Income, Race, Ethnicity)  
9.json (Applications by Median Age of Homes)   
10.json (Reporting Financial Institutions)      

Below are the S3 paths for aggregate reports   
`aws s3 ls s3://cfpb-hmda-public/<dev | prod>/reports/aggregate/<year>>/<msamd>/`  

Monitor, report count should increase  
`aws s3 ls s3://cfpb-hmda-public/dev/reports/aggregate/2021/ | wc -l`    

Trigger job by adding random value to the kafka job `hmda-spark-ad`

#### BUILD Disclosure/Aggregate  Image      
Note: Instructions to be updated once a new repo is created
```
# Clone repo
git clone https://github.com/omnipresent07/hmda-platform.git
cd hmda-platform/
git checkout a_d_reports_2020

# Build jar file and docker image
env JAVA_OPTS="-Xms256m -Xmx4096m -Xss8m" sbt -batch hmda-spark-reporting/docker

# env JAVA_OPTS="-Xms256m -Xmx4096m -Xss8m" sbt -batch hmda-spark-reporting/docker && docker tag hmda-spark-reporting hmda/hmda-spark-reporting:test2020 
[info] #12 DONE 0.1s
[info] Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
[error] java.lang.RuntimeException: Could not parse image id
[error] 	at scala.sys.package$.error(package.scala:30)

# Igmore if you see docker build error, its harmless

cd hmda-spark-reporting/target/docker/
```

Replace Pre-configured `Dockerfile` with `Dockerfile-hmda-reporting`     
Download older Java SE Runtime Environment 8u211(jre-8u211-linux-x64.tar.gz) package from [Oracle archive](https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html). Oracle login required to download binary    
Note: New java versions throws [Content-Length error](https://stackoverflow.com/questions/63167261/apachespark-read-from-s3-exception-premature-end-of-content-length-delimited-me), do not work  
```
(MP-C02XJ0BCJGH7:docker joshib$ ls 
0                          Dockerfile                 jre-8u211-linux-x64.tar.gz

docker build -t spark:local -f  Dockerfile-hmda-reporting  .
docker tag spark:local 626560329871.dkr.ecr.us-east-1.amazonaws.com/hmda/hmda-spark-reporting:ad2021V3
docker push 626560329871.dkr.ecr.us-east-1.amazonaws.com/hmda/hmda-spark-reporting:ad2021V3
```
Note : hmda-spark-reporting run as a `root` user, its blocked by Twistlock, store image in `testing` repo
