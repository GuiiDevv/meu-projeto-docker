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


## 6. Integração Contínua (GitHub Actions)


1. [valida o compose]

2. [builda a imagem]

3. [sobe a stack]

4. [aguarda a app responder e testa criar uma tarefa via API]

5. [derruba a stack]

![alt text](/docs/images/image-11.png)


## 7. Quebra proposital do CI

O que eu quebrei: [alterei o /items por /item no curl do CRUD] 

Erro que apareceu no log:[Run curl -sf -X POST http://localhost:3000/item \Error: Process completed with exit code 22.]

Como o CI reagiu: [SMOKE TEST DO CRUD] 

Como eu corrigi: [modifiquei o /item por /items novamente]

link do pull request: [https://github.com/GuiiDevv/meu-projeto-docker/pull/new/quebra-proposital]

![alt text](/docs/images/image-12.png)


## 8. Estrutura do projeto

meu-projeto-docker/
├── .github/
│   └── workflows/
│       └── ci.yml
├── docs/
│   └── images/
├── spec/
│   ├── persistence/
│   │   └── sqlite.spec.js
│   └── routes/
│       ├── addItem.spec.js
│       ├── deleteItem.spec.js
│       ├── getItems.spec.js
│       └── updateItem.spec.js
├── src/
│   ├── persistence/
│   │   ├── index.js
│   │   ├── mysql.js
│   │   └── sqlite.js
│   ├── routes/
│   │   ├── addItem.js
│   │   ├── deleteItem.js
│   │   ├── getItems.js
│   │   └── updateItem.js
│   ├── static/
│   │   ├── css/
│   │   │   ├── bootstrap.min.css
│   │   │   ├── styles.css
│   │   │   └── font-awesome/
│   │   ├── js/
│   │   │   ├── app.js
│   │   │   ├── babel.min.js
│   │   │   ├── react-bootstrap.js
│   │   │   ├── react-dom.production.min.js
│   │   │   └── react.production.min.js
│   │   └── index.html
│   └── index.js
├── .dockerignore
├── .env.example
├── .gitignore
├── compose.yaml
├── Dockerfile
├── package-lock.json
├── package.json
└── README.md

