# vagrant_thoughtworks
##The current setup problems

-The artifacts publish method is unknow. 

-The best way for me is a packaging (.deb or .rpm). This will allow to provide a version control.

But if we are not sure about the success of the first release we can publish Java artifacts via http-server 

http://example.com/example.war

CSS-files and images have to be delivered by Puppet module.

-There is no information about app-server. I suggest to use Tomcat.

-Prevayler will not allow to scale our system. To store persists data is not a good idea for  a reliability as well. We need to think about the RDBMS

-Separated application code and static part can be lead to trouble without integration.

-Two environments are not enough for a high code quality. We need four ones at least (Acceptance, Unite, Rehearse, Production)

##The assumptions
The developers familiar with Vagrant and Puppet.

Developers have been testing and running application on Tomcat.  

##Technology stack

AWS - cloud provider

Ubuntu - OS. 

Vagrant - provisioner with multi-machine configuration. Popular among developers. Works with different providers (VBox, EC2, docker, etc)

Puppet - configuration manager. There are production ready modules for a deployment.

Nginx - web server for static files. Fast and universal.

Tomcat 7 - app server. 

##Environment preparation.

1. Create AWS account.
2. AWS access key
3. AWS secret key
4. SSH keypair name
5. SSH private key file (.pem extension)
6. Make sure the your security group enables SSH (port 22) and HTTP (port 80) access from anywhere
7. AWS credential settings for Vagrant
8. Download Vagrantfile and Puppet modules. https://github.com/gnkaytaz/vagrant_thoughtworks
9. Change the puppet-manifests (app.pp, web.pp)
10. vagrant up 

##Production readiness.

It is not ready yet because:

There is no a monitoring solution

There are not backup/disaster recovery plans

There is no security policy

There is no nginx configuration

##The scale ideas

Migrate to RDBMS ( RDS for example)

Implementing Puppet-masters

Balancers implementation (Based on nginx or ELB)

Or

CDN (CloudFlare)
