# Projeto E-comerce

IMG

# Sobre o Projeto
O projeto e-comerce consiste na simualação de um site de vendas de produtos, onde consume duas apis para obter os dados dos produtos para listar em um app web, onde é possível colocar os os produtos escolhidos em um carrinho de compras e salvar os produtos escolhidos em uma api própria junto com os dados do cliente.


# Processo de Criação
Em todo projeto fullstack, prefiro começar pelo back-end. Comecei estudando nodejs pois não conhecia a tecnologia, pensei em como seria o modelo dos dados que criei e finalizei a api rondado em servidor local. Foi escolhido MongoDb Atlas para salvar os dados, por ser um banco de dados online e grátis com fácil integração com o nodejs. Após a api pronta e testada foi a vez da criação da página web e a escolha das cores do site.Foi utilizado o site coolors.co/ para a criação da paleta de cores. 
Ao terminar o header da página web foi feito o consumo das apis para para obtenção de dados e tratamento deles. Com os dados da api recebidos foi feito o tratamento de dados usando o modelo dos objetos passados via json na api. Com os dados recebidos e tratados, o próximo passo foi a criação do layout para visibilidade de cada produto recebedido e listado dentro de uma listView. Com os produtos já listados  foi feito o processo de filtragem dos produtos, para melhor gerenciamento de estados da tela foi utilizado MobX para o gerenciamento. Foi criado duas listas 2 listas de produtos, os que contém todos os produtos e a outra apenas os produtos filtrados, para poder depois mostrar eles na página web. Para criar a lista de categorias fveriricada todas as categorias da lista de produtos e adicionado na lista de categorias para que elas nãos se repetissem na mesma. Para realização da filtragem existe duas formas, pelo campo de pesquisa, onde foi se utiliza regex do nome do produto digitado ou pelas categorias, onde pecorre todos os produtos da lista e verifica o tipo de categoria.
Para ser mais intuitivo a lista de produtos e a escolha deles, ao selecionar o produto para adicionar ao carrinho ocorre a troca de cor do modelo do produto na lista, para isso ocorrer, dentro de modelo do produto tem uma variavel tipo bool onde dependendo dela, faz a alteração de cor e texto do produto.
Com a página principal funcionando e já listando os produtos e realizando a filtragem deles, chegou a vez da criação da da tela do carrinho, onde utiliza a mesma lógica para de listagem dos produtos da tela inicial, onde foi feita pequenas alterações no modelo visivel de cada produto e com opção de retirar o produto do seu carrinho. Para finalizar o projeto foi feita a integração com a api criada com node para salvar os dados. Para o usuário poder acessar sua tela de carrinho é necessário salvar seus dados pessoais para realização do login e liberar a opção de acessar a tela de carrinho. Após realizar o login e adicionar os produtos nos carrinhos e possível finalizar suas compras na tela do carrinho, onde ocorre a atualização do banco de dados.

# Layout Web
IMG

# Teconologias utilizadas

## Back end
 - Node.js
 - MongoDb

## Front end
 - Flutter

# Como executar o projeto

## Back end
```bash
# clonar respositório
git clone https://github.com/biduzilla/e-comerce.git

# entrar na pasta do projeto da api
cd api

# instalar as dependências para rodar a api
npm install

# modificar o arquivo src/config/dbConnect.js e inserir sua conexão com o mongodb
"mongoose.connect("DIGITE AQUI SUA CONEXÃO COM MONGODB")"

# executar a api e esperar a mensagem no console sinalizando a conexão com o banco de dados
npm run dev
```

IMG

## Front end
```bash
# clonar respositório
git clone https://github.com/biduzilla/e-comerce.git

# entrar na pasta do projeto da api
cd e_comerce

# instalar as dependências para rodar o projeto
flutter pub get

# executar o projeto
flutter run -d chrome --web-renderer html
```

# Autor
Luiz Henrique de Carvalho Teles
linkedin.com/in/luiz-henrique-de-carvalho-teles-a5b51b1a7/



