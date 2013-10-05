# PopMe

Open websites in browser through the terminal.

[![Gem Version](https://badge.fury.io/rb/popme.png)][rubygems]
[![Build Status](https://secure.travis-ci.org/eavgerinos/popme.png?branch=master)][travis]
[![Coverage Status](https://coveralls.io/repos/eavgerinos/popme/badge.png?branch=master)][coveralls]
[![Code Climate](https://codeclimate.com/github/eavgerinos/popme.png)][codeclimate]


## Installation

```sh
gem install popme
```

## Usage

PopMe stores a website to the file (`~/.popme`) with key-value pairs like this:

```JSON
{
  "google": "http://google.com",
  "ghapirails": "https://api.github.com/repos/rails/rails"
}
```
> It comes with the "google" website by default.

### Open a website

You can open a site that exists in your file like this:

```sh
pop google
```

You can open a site that does not exists in your file using a URL like this:

```sh
pop www.google.com
```

### Add a website

You can add a website to the list like this:

```sh
pop add facebook http://facebook.com
```

### Remove a website
You can remove a website from the list like this:

```sh
pop rm facebook
```

### List all websites

You can view the list of your stored websites

```sh
pop list # Alias command: pop -l
```

### Backup website list

You can keep backup of your websites list in a private gist like this

```sh
pop backup # Alias command: pop -b
```

### Open help menu

To open the help menu write a command

```sh
pop # Alias command: pop -h, pop help
```

## Copyright
Copyright (c) 2013 Angel Avgerinos.
See [LICENSE][] for details.

[rubygems]: https://rubygems.org/gems/popme
[travis]: http://travis-ci.org/eavgerinos/popme
[coveralls]: https://coveralls.io/r/eavgerinos/popme
[codeclimate]: https://codeclimate.com/github/eavgerinos/popme

[license]: LICENSE.txt
