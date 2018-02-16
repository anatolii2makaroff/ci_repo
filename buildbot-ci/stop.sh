
ls -ld ./*/|awk '{print "buildbot stop " $9 "master" }'|grep -v tmpl|xargs -I {} sh -c '{}'
ls -ld ./*/|awk '{print "buildslave stop " $9 "master-slave" }'|grep -v tmpl|xargs -I {} sh -c '{}'

ls -ld ./*/|awk '{print "buildslave stop " $9 "dev-slave" }'|grep -v tmpl|xargs -I {} sh -c '{}'

