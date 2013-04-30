# Popme

Open pages in browser through terminal

## Installation

    $ gem install popme

## Usage

Just a simple gem.

It stores a file (~/.popme) with key-value pairs like this

```
{
  "google": "http://google.com",
  "ghapirails": "https://api.github.com/repos/rails/rails"
}
```

It comes with the "google" pair by default

### Open

You can open a page that exists in your file like this

```
$ pop google
```

### Add

You can add a page in the file like this

```
pop add <key> <value>
```

for example

```
$ pop add facebook http://facebook.com
```

### List

You can see the list of your key-value pairs by giving

```
$ pop list
```

### Help

To view the help menu just give

```
pop
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
