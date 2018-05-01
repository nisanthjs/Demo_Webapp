webapp_ver=$1
wget http://mastervm.centralus.cloudapp.azure.com:8081/nexus/content/repositories/Silos_Repo/com/devops/azure/silos/$webapp_ver/silos-$webapp_ver.war -O /tmp/silos.war
webapps_dir=/usr/share/tomcat/webapps/
# Remove existing assets (if any)
rm -rf $webapps_dir/ROOT
# Copy WAR file into place
cp /tmp/silos.war $webapps_dir
exit 0
