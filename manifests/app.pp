class app {
  tomcat::install { '/opt/tomcat':
    source_url => 'http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.72/bin/apache-tomcat-7.0.72.tar.gz',
  }
  tomcat::instance { 'default':
    catalina_home => '/opt/tomcat',
  }
  tomcat::war { 'sample.war':
    catalina_base => '/opt/tomcat8/first',
    war_source    => 'http://mirrors.jenkins-ci.org/war/latest/jenkins.war',
  }
}

class {"apt":} ->
class {"java":} ->
class {"app":}
