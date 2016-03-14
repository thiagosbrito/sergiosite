# Sergio Righini's website

Para rodar o site em versão de desenvolvimento abra um bash command prompt

Se você não tiver um, baixe em [Git Bash for Windows](https://git-for-windows.github.io/)

Instale também o [NodeJs](https://nodejs.org/en/)

Coisas importantes para serem instaladas após o NodeJs

### Bower 

```$ npm install -g bower```
Necessário permissão de adminstrador, caso aja conflito de permissão use 

```$ sudo npm install -g bower```

### Gulp

```$ npm install -g gulp```
Necessário permissão de adminstrador, caso aja conflito de permissão use 
```sudo npm install -g gulp```

### Pronto, vamos ao que interessa

Faça um clone do repositório em sua máquina, em qualquer diretório, aconselho a usar o Desktop mesmo
```$ git clone https://github.com/thiagosbrito/sergiosite.git```

No terminal, vá até a pasta onde você fez o clone e digite

```$ npm install --save && bower install --save```

Após instaladas todas as dependências do projeto rode

```$ gulp serve```

Voilà


### Gerando build

Para gerar o build execute o comando

```$ gulp build````

Os arquivos estarão disponíveis na pasta ```/dist``` dentro da pasta do projeto

