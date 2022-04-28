<div align="center"><img src="https://raw.githubusercontent.com/asilvadev/QA-automacao-RockLov/70fb6de966dc12f2dc958246079b5a452aba6846/_/logo.9ba1ab0c.svg" title="jenkins" alt="jenkins" width="250" height="150" />

<br/>
<br/>
<a href="https://www.linkedin.com/in/alan-victor-222617205/">
    <img src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" height="25"/>
  </a>
</div>
<br/>


## 👨🏽‍💻 Technologies
<p align="left">
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/85ec92b476b9e9ef1d1e18cb42f894b6124cee88/icons/ruby.svg" title="ruby" alt="ruby" width="25" height="25" />
<br/>
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/85ec92b476b9e9ef1d1e18cb42f894b6124cee88/icons/cucumber.svg" title="cucumber" alt="cucumber" width="25" height="25" />
<img src="https://avatars.githubusercontent.com/u/983927?s=200&v=4" title="selenium" alt="selenium" width="24" height="24" />
<img src="https://img.stackshare.io/service/2595/capybara.png" title="capybara" alt="capybara" width="24" height="24" />
<img src="https://raw.githubusercontent.com/vscode-icons/vscode-icons/1120bad531c928642d2ee49942be079a9fb0519b/icons/file_type_rspec.svg" title="rspec" alt="rspec" width="25" height="25" />
<br/>
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/85ec92b476b9e9ef1d1e18cb42f894b6124cee88/icons/docker.svg" title="docker" alt="docker" width="25" height="25" />
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/85ec92b476b9e9ef1d1e18cb42f894b6124cee88/icons/database.svg" title="database" alt="database" width="25" height="25" />
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/85ec92b476b9e9ef1d1e18cb42f894b6124cee88/icons/gemfile.svg" title="gemfile" alt="gemfile" width="25" height="25" />
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/85ec92b476b9e9ef1d1e18cb42f894b6124cee88/icons/yaml.svg" title="yaml" alt="yaml" width="25" height="25" />
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/85ec92b476b9e9ef1d1e18cb42f894b6124cee88/icons/jenkins.svg" title="jenkins" alt="jenkins" width="25" height="25" />
</P>
<br/>

## 🛠️ Steps
#Tenha certeza que voce tem o Ruby Instalado 
ruby -v 


#Tenha certeza que voce tem o Docker Instalado e monte o ambiente 

docker -v 
cd infra 
cd rocklov-dc
docker-compose up -d


#Para testar WEB
cd web
bundle install
rake local_seeds


#Para testar API 
cd api
bundle install
rspec


# Usuário Windows: vá até "C:\WIndows\System32\drivers\etc" e adicione a segunte configuracao no arquivo hosts
127.0.0.1 rocklov-db
127.0.0.1 rocklov-api
127.0.0.1 rocklov-web

#Caso voce use o Jenkins (Opcional)
127.0.0.1 jenkins


#Para executar o Jenkins
Use o tutorial: https://medium.com/qaninja/rodando-o-jenkins-em-um-container-docker-4772986eb801



#DockerFile
Docker File esta em cd infra/ruby-web-agent

<br/>
