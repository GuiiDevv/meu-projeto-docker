# Projeto Docker Compose + ci - DevOps

## Aluno

Nome: Guilherme Cavalcante

Turma: Vespertino

Data: 28/07

Aplicacao usada: [docker/getting-started-app — To-Do em Node.js]


## 1. COMO EXECUTAR ESSE PROJETO


git clone [https://github.com/GuiiDevv/meu-projeto-docker.git]

cd [meu-projeto-docker]

cp .env.example. .env

docker compose up -d --build

depois acesse: htpp://localhost:3000


## 2. IMAGEM E DOCKER


Imagem criada com sucesso utilizando Dockerfile multi-stage.

Print 1 - Build da imagem

Comando: docker build -t todo-app:v1 .

         docker images   

![alt text](/docs/images/image.png)

Print 2 - aplicacao rodando com tarefas cadastradas:

Comando: docker run -d -p 3000:3000 --name todo todo-app:v1

![alt text](/docs/images/image-3.png)


## 3. VOLUME E PERSISTENCIA


3.1 - sem volume: os dados nao persistiam depois de detruir o container "docker rm -f todo"

![alt text](/docs/images/image-5.png)

![alt text](/docs/images/image-4.png)

3.2 - com volume:

![alt text](/docs/images/image-7.png)

![alt text](/docs/images/image-6.png)

![alt text](/docs/images/image-8.png)

Diferenca entre "docker compose down" e "docker compose down -v" ?

Enquanto o primeiro para e apaga o container o segundo faz a mesma coisa com container e os volumes juntos;


## 4. REDE


Rede criada: [todo-net] 

Serviços conectados: [app e db] 

A porta do banco está exposta ao host? [Não — seria exposto se eu rodasse o mysql com o -p especificando as portas de host e container;]

![alt text](/docs/images/image-9.png)

![alt text](/docs/images/imagee.png)


## 5. DOCKER COMPOSE 


Serviços: [app e db]

Rede: [todo-net]

Volume: [todo-mysql-data]

Healthcheck em: [db]

depends_on com: [condition: service_healthy]

Variáveis sensíveis: carregadas via .env, não versionado

Modelo em: [.env.example]

![alt text](/docs/images/image-10.png)