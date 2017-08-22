include:
  - jenkins.nginx

add_repository_key:
  pkgrepo.managed:
     - humanname: Jenkins Repository
     - name: deb http://pkg.jenkins.io/debian-stable binary/
     - key_url: https://pkg.jenkins.io/debian/jenkins-ci.org.key
     - file: /etc/apt/sources.list.d/jenkins.list
     - refresh_db: true

install_jenkins:
  pkg.installed:
    - name: jenkins
    - skip_verify: True

ensure_jenkins_running:
  service.running:
    - name: jenkins
    - enable: True

install_curl:
  pkg.installed:
    - name: curl
