# PopMe

Open sites in browser through the terminal.

[![Code Climate](https://codeclimate.com/github/eavgerinos/popme.png)](https://codeclimate.com/github/eavgerinos/popme)
[![Build Status](https://travis-ci.org/eavgerinos/popme.png)](https://travis-ci.org/eavgerinos/popme)
[![Coverage Status](https://coveralls.io/repos/eavgerinos/popme/badge.png?branch=master)](https://coveralls.io/r/eavgerinos/popme)


## Installation

    gem install popme

## Usage

Just a simple gem.

It stores a file (`~/.popme`) with key-value pairs like this:

```JSON
{
  "google": "http://google.com",
  "ghapirails": "https://api.github.com/repos/rails/rails"
}
```

It comes with the "google" pair by default.

### Open

You can open a site that exists in your file like this:

```
pop google
```

### Add

You can add a site in the file like this:

```
pop add <key> <value>
```

For example:

```
pop add facebook http://facebook.com
```

### Remove

You can remove a site like this:

```
pop rm <key>
```

For example:

```
pop rm google
```

### Backup

You can keep backup of your site list in a nice private anonymous gist like this

```
pop backup
```

Or

```
pop -b
```

### List

You can see the list of your key-value pairs by doing:

```
pop list
```

Or

```
pop -l
```

### Help

To view the help menu just do:

```
pop help
```

Or

```
pop -h
```

Or

```
pop
```

## Tests

To run the tests simply do

```
rake
```
