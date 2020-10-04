# Deploy a WordPress site on AWS with CloudFormation and Ansible #

 - Environment is limited to t2.micro and t2.small instance types (could be extended)
 - RDS MariaDB instance is used for the database.
 - No domain name is required. The WordPress site is accessed using the Public DNS address of the ELB AWS.

### Usage ###
 - Download the WPCloudformation.yaml from the GIT repository.
 - Open the AWS console, go to CloudFormation, upload the WPCloudformation.yaml file, provide the requested parameters and create the stack.
 - Once the stack is created WordPress URL can be found in the output section.

### How it works ###
- CloudFormation template accepts user inputs as parameters required for setting up the infrastracture and setting up the WordPress site.  (Ex: DBClass, InstanceType, Subnet CIDRs, Usernames, Passwords and etc).
- Creates two security groups for Web and RDS DB instances. Web security group only allows inbound http traffic from the internet and ssh traffic from the IP/Subnet defined in the SSHLocation user input parameter.
Security Group for RDS DB instance only allows ingress traffic for TCP port 3306 (MySQL/MariaDB) from the Web server security group.
- Creates a RDS for MariaDB instance on the private subnet group. 
- Creates an EC2 instance on public subnet and install ansible.
- Then the following command on the CloudFormation template executes the ansible-pull comamnd and pass the variables reqruied for the Ansible playbook.
- It pulls the playbook from the GIT repo, and run the playbook.

``````

           01_run_ansible_playbook:
              command: !Join 
                - ''
                - - >-
                    ansible-pull -U https://github.com/hasith4/Candidate-27wCSgiY0b.git
                    local.yaml -e
                  - ' ''wordpress_db_host='
                  - !GetAtt
                    - DBInstance
                    - Endpoint.Address
                  - ' wordpress_db_name='
                  - !Ref DBName
                  - ' wordpress_db_user='
                  - !Ref DBUser
                  - ' wordpress_db_pass='
                  - !Ref DBPassword
                  - ' wordpress_site_title='
                  - !Ref WPSiteTitle
                  - ' wordpress_admin_user='
                  - !Ref WPAdminUser
                  - ' wordpress_admin_pass='
                  - !Ref WPAdminPass
                  - ' wordpress_admin_email='
                  - !Ref WPAdminEmail
                  - ''''

``````

- Ansible playbook installs the required dependancies and install and setup a WordPress site on the EC2 instance.
- Once hte installation is complete, the Public DNS address address of the EC2 instace is dispalyed on the CloudFormation Output section.

