# Meet_Doctor

## Built With

- Ruby on Rails
- PostgreSQL

## Getting Started

To get a local copy up and running follow these simple example steps.

Checkout our database diagram ![here](doctor_uml.png)

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://gorails.com/)

### Setup

- Make sure you have Ruby on Rails set up properly on your computer
- Clone or download this repo on your machine
- Enter project directory

### Development Database

```sh
# Create user
sudo -u postgres createuser -e <user> -s
# Load the schema
rake db:create
# Create database Migration
rails db:migrate
```

### Install

```sh
bundle install
```

### Run

```sh
rails s
```

### Test

```sh
rspec
```

## Authors

👤 **Cédric Kossi**

- GitHub: [@kosher9](https://github.com/kosher9)
- Twitter: [@kosherus](https://twitter.com/kosherus)
- LinkedIn: [LinkedIn](https://linkedin.com/in/lionel-c%C3%A9dric-kossi-323042172)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.
