### Disclaimer

Please note that this is a demo app, so the purpose wasn't to present an app with full
test coverage or so.

### Prerequisites

You should have installed docker at your local.

### Initial setup

In order to bootstrap your dev environment:

    docker-compose up
    docker-compose exec web bash
    rails db:create
    rails db:migrate

After you've done this once, you can just boot your dev environment with
 `docker-compose up`

Then access `http://localhost:3000` and you can create/update/delete/toggle the todos.

### Local test environment

#### To bash into `RAILS_ENV=test`

`docker compose -f docker-compose.test.yml run --rm rspec bash`

### Notes

This app for demo purposes also exposes an API

To hit it you can use Postman and here is how you can use this API

Run the app locally. Then you can use this collection https://documenter.getpostman.com/view/30860829/2sAYXBFzFz or take the queries listed below for simplicity.

`{
  "query": "mutation($input: TodoInput!) { createTodo(input: $input) { todo { id title description completed } errors } }",
  "variables": {
    "input": {
      "title": "Test Todo67",
      "description": "This is a test67",
      "completed": false
    }
  }
}`

`{
  "query": "mutation UpdateTodo($id: ID!, $input: TodoInput!) { updateTodo(id: $id, input: $input) { todo { id title description completed } errors } }",
  "variables": {
    "id": "4",
    "input": {
      "title": "Updated Todo Title",
      "description": "Updated description for the todo item",
      "completed": true
    }
  }
}`

`{
  "query": "mutation DeleteTodo($id: ID!) { deleteTodo(id: $id) { todo { id title description completed } errors } }",
  "variables": {
    "id": "5"
  }
}`

`{
  "query": "mutation ToggleTodo($id: ID!) { toggleTodo(id: $id) { todo { id title description completed } errors } }",
  "variables": {
    "id": "4"
  }
}`
