## Sobre este projeto 
Automação completa de API e Web usando Ruby 

## Meu Perfil no Linkedin
<br/>
<br/>
<a href="https://www.linkedin.com/in/alan-victor-222617205/">
    <img src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" height="25"/>
  </a>
</div>
<br/>

## Tecnologias Utilizadas
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

## 🛠️ Passo a Passo para configuracao do ambiente 

**#Tenha certeza que voce tem o Ruby Instalado**

ruby -v

**#Tenha certeza que voce tem o Docker Instalado e monte o ambiente**

docker -v

cd infra
cd rocklov-dc
docker-compose up -d
<br/>

**#Para testar WEB**

cd web
bundle install
rake local_seeds
<br/>

**#Para testar API**

cd api
bundle install
rspec
<br/>

Usuário Windows: vá até "**C:\WIndows\System32\drivers\etc**" e adicione a segunte configuracao no arquivo hosts

127.0.0.1 rocklov-db
<br/>
127.0.0.1 rocklov-api
<br/>
127.0.0.1 rocklov-web
<br/>

**#Caso voce use o Jenkins (Opcional)**
<br/>
127.0.0.1 jenkins
<br/>

**#Para executar o Jenkins**

Use o tutorial: [https://medium.com/qaninja/rodando-o-jenkins-em-um-container-docker-4772986eb801](https://medium.com/qaninja/rodando-o-jenkins-em-um-container-docker-4772986eb801)

<br/>

#DockerFile
Docker File esta em cd infra/ruby-web-agent
<br/>

**#Links de acesso apos configuracao do arquivo Hosts**
<br/>
Web: http://rocklov-web:3000
<br/>
Documentacao: http://rocklov-api:3333/api-docs


