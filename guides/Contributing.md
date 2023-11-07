# Contributing

`cd` to project directory.

```sh
git clone https://github.com/pghero/pghero.git
git clone https://github.com/pghero/pghero.git pghero-dev
cd pghero-dev
rails new . # choose 'a' for overwrite
echo "gem 'pghero', path: '..'" >> Gemfile
echo "gem 'pg'" >> Gemfile
sed -i '' '3s/$/  mount PgHero::Engine, at: "pghero"/' config/routes.rb
git checkout -b dev
dropdb --if-exists pghero_dev
createdb pghero_dev
export DATABASE_URL=postgres:///pghero_dev
bundle install
bin/rails generate pghero:query_stats
bin/rails generate pghero:space_stats
bin/rails db:migrate
bin/rails server
```

And visit [http://localhost:3000](http://localhost:3000)
