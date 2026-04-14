# Task-website

A small Ruby on Rails task tracker with a CRUD interface for tasks. It uses
Hotwire (Turbo + Stimulus) for fast UI updates and SQLite for local data.

## Features

- Create, edit, and delete tasks
- Turbo Stream updates for create, update, and delete actions
- Stimulus controllers for UI behaviors

## How it works

- The `Task` model stores task data (including description).
- `TasksController` handles CRUD and renders Turbo Stream responses.
- Views under `app/views/tasks` render the list and update partials.
- The default dev database is SQLite (`storage/development.sqlite3`).

## Requirements

- Ruby (see `Gemfile` for the target version)
- Bundler
- SQLite

## Setup

```bash
bundle install
bin/rails db:setup
```

## Run the app

```bash
bin/rails server
```

Then visit `http://localhost:3000`.


## Useful commands

```bash
bin/rails db:migrate
bin/rails db:seed
```
