# mime

Mimetypes for [Crystal](https://github.com/manastech/crystal), based on [node-mime](https://github.com/broofa/node-mime).

## Installation

Add it to `Projectfile`

```crystal
deps do
  github "spalger/crystal-mime"
end
```

## Usage

```crystal
require "mime"
```

This simple module maps mime-types and extensions. Read the map using either the `from_ext` or `to_ext` methods.

### `Mime.from_ext(extension as String) : type as String`
Read the mime-type for an extension. Example:

```crystal
require "mime"
Mime.from_ext("jpg") # "image/jpeg"
Mime.from_ext("js")  # "application/javascript"
```

### `Mime.to_ext(type as String) : ext as String`
Read the first extension registered for a mime-type.

```crystal
require "mime"
Mime.from_ext("image/jpeg") # "jpeg"
Mime.from_ext("application/javascript")  # "js"
```

## Development

Please include tests for any changes

## Contributing

1. Fork it ( https://github.com/spalger/crystal-mime/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [spalger](https://github.com/spalger) Spencer Alger - creator, maintainer
