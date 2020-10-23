# TweetParser

Este projeto implementa a solução do desafio proposto em [Enunciado.md](https://github.com/murilxaraujo/TweetParser/blob/main/Enunciado.md) em Swift através de uma aplicação CLI.

![](https://github.com/murilxaraujo/TweetParser/blob/main/Docs/Screen%20Shot%202020-10-21%20at%2021.34.56.png?raw=true)

## Licença
Este software é licenciado sob MIT License, para mais informações entre em [LICENSE.md](https://github.com/murilxaraujo/TweetParser/blob/main/LICENSE.md)

## Instalação
##### Pasta do projeto
Para rodar o sofware na pasta do projeto clone o projeto usando
`git clone https://github.com/murilxaraujo/TweetParser.git`<br>e entre no diretório usando
`cd TweetParser`<br>
compile o projeto usando o comando `swift build` e rode usando `swift run tweetparser <inputfile.jsonl>`

##### Globalmente
`git clone https://github.com/murilxaraujo/TweetParser.git`<br>e entre no diretório usando
`cd TweetParser`<br>
Para buildar em modo release use o comando `swift build --configuration release`<br>
Copie o binário para sua pasta local
`cp .build/release/tweetparser /usr/bin`<br>
Após copiar você poderá rodar o programa apenas usando `tweetparser <inputfile.jsonl>`

Para debugar e ver erros adicione a flag `--verbose` ao final do comando<br>
Para ajuda `tweetparser --help` ou `tweetparser -h`
