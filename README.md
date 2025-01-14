# To-Do App

Este projeto é uma aplicação Rails para ajudar os usuários a gerenciar suas tarefas diárias. A aplicação permite criar, visualizar, editar e excluir listas de tarefas. Além disso, possui autenticação de usuários com Devise e perfis personalizados.

---

## **Funcionalidades**

- Cadastro e login de usuários
- Edição de perfil com upload de avatar
- Criação, visualização, edição e exclusão de tarefas
- Layout responsivo com Bootstrap 5
- Navegação usando Turbo para evitar múltiplas recargas de página

---

## **Tecnologias Utilizadas**

- **Ruby on Rails** (versão 7 ou superior)
- **Devise** para autenticação
- **Bootstrap 5** para estilos
- **SQLite3** como banco de dados padrão
- **Active Storage** para upload de imagens (avatar de perfil)
- **Turbo** para navegação dinâmica

---

## **Instalação**

1. Clone o repositório:
   ```bash
   git clone <seu-repositorio-url>
   cd seu-repositorio
   ```

2. Instale as dependências:
   ```bash
   bundle install
   yarn install
   ```

3. Configure o banco de dados:
   ```bash
   rails db:setup
   ```

4. Inicie o servidor:
   ```bash
   bin/dev
   ```

---

## **Rotas Principais**

- **Home:** `/` (Página inicial com informações e opções de login/cadastro)
- **Sign Up:** `/users/sign_up` (Página de cadastro de usuário)
- **Login:** `/users/sign_in` (Página de login de usuário)
- **Editar Perfil:** `/profiles/:id/edit` (Página para edição de perfil com upload de avatar)
- **Listas de Tarefas:** `/todos` (Página com todas as listas de tarefas do usuário)

---

## **Como Personalizar**

- **Configurar o título:** Modifique o arquivo `app/views/layouts/application.html.erb` para alterar o título da aplicação.
- **Trocar imagens e ícones:** Substitua os arquivos em `app/assets/images`.
- **Estilo personalizado:** Edite os arquivos em `app/assets/stylesheets` para customizar os estilos CSS.

---

## **Comandos Úteis**

- Criar banco de dados: `rails db:create`
- Rodar migrações: `rails db:migrate`
- Reiniciar o servidor: `bin/dev`

---

## **Contribuição**

Sinta-se à vontade para contribuir com melhorias no projeto. Faça um fork, crie uma nova branch com sua feature ou correção, e envie um Pull Request.

---

## **Licença**

Não há licenciamento para este projeto.

---

**Autor:** [Ygor Nogueira](https://github.com/YgorNogueira)

