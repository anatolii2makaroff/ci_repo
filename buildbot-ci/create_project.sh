#
# Create project from template & start
#
# sh create_project.sh $source $group $name $port $http 

function sedeasy {
  sed -i "s/$(echo $1 | sed -e 's/\([[\/.*]\|\]\)/\\&/g')/$(echo $2 | sed -e 's/[\/&]/\\&/g')/g" $3
}

echo $1 $2 $3 $4 $5

rm -rf $3
mkdir $3
cd $3

buildbot create-master master
buildslave create-slave master-slave localhost:$4 master master!
buildslave create-slave dev-slave localhost:$4 dev dev!
cp ../tmpl/master.cfg ./master/

sedeasy BB_SOURCE $1 ./master/master.cfg
sed -i s/BB_GROUP/$2/g ./master/master.cfg
sed -i s/BB_NAME/$3/g ./master/master.cfg
sed -i s/BB_PORT/$4/g ./master/master.cfg
sed -i s/BB_HTPP_PORT/$5/g ./master/master.cfg

buildbot reconfig master

buildbot start master
buildslave start master-slave
buildslave start dev-slave



