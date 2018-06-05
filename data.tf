data "template_file" "buildspec" {
  template 	= <<EOF
version: 0.2
phases:
  pre_build:
    commands:
      - wget -N https://raw.githubusercontent.com/traveloka/aws-sudo/master/aws-sudo.sh
      - chmod +x aws-sudo.sh
      - sed -i -e 's/^local[ ]*all[ ]*all[ ]*peer/local   all             all                                     md5/g' $POSTGRES_HBA_CONFIG
      - service postgresql start
      - /./create_user.py
      - sed -i -e '/^local[ ]*all[ ]*postgres[ ]*peer/i local   all             docker                                  trust' $POSTGRES_HBA_CONFIG
      - service postgresql restart
  build:
    commands: 
      - su docker -c 'mkdir /home/docker/app'
      - cp -r . /home/docker/app
      - cd /home/docker/app
      - "chown -R docker: ."
      - su docker -c 'chmod -R +x .'
      - $(./aws-sudo.sh -d 3600 $${assumed_role_arn} | sed s/AWS_/BEIARTF_/g)
      - su docker -c './gradlew :$${project_path}:initDBEnv'
      - su docker -c './deploy_library.sh $${project_path} -r'
EOF

  vars {
    assumed_role_arn  = "${var.assumed_role_arn}"
    project_path      = "${replace(var.project_path, "/", ":")}"
  }
}

data "aws_iam_role" "code_build_service_role" {
  name = "${var.service_role}" 
}
