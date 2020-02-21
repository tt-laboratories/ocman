# ocman

Ruby gem for file managment and sharing in owncloud

## Installation

### Rails

Add this line to your application's Gemfile:

``` ruby
gem "ocman", :git => 'git@github.com:tt-laboratories/ocman.git'
```

## Configuration

Initialize Ocman with your access credentials somewhere during startup. In a rails application that may be an initializer like `.../initializers/ocman.rb`.

```ruby
Ocman.configure do |config|
  # Required
  config.base_url = 'https://example.org'
  config.user_name = ''
  config.password = ''

  # Optional
  config.dav_base_uri = '/remote.php/webdav/' # Optional - URI of the owncloud installation. Defaults to '/remote.php/webdav/'
end
```

## Usage

### Sharing

#### Share a folder or a file

```ruby
Ocman.share('path/to/folder', 'user_name')
# => #<Hashie::Mash data=nil meta=#<Hashie::Mash message=nil status='ok' statuscode='100'>>

# Share with read-only permissions (default is 'all')
Ocman.share('path/to/folder', 'user_name', Ocman::Permission.read)
# => #<Hashie::Mash data=nil meta=#<Hashie::Mash message=nil status='ok' statuscode='100'>>

# Share with specific set of permissions
Ocman.share('path/to/folder', 'user_name', Ocman::Permission.new([:read, :create, :update]))
# => #<Hashie::Mash data=nil meta=#<Hashie::Mash message=nil status='ok' statuscode='100'>>
```

Valid permissions are:

* `read`
* `create`
* `update`
* `delete`
* `share`
* `all`

#### Delete a share for a folder or a file

```ruby
Ocman.delete_share('path/to/folder', 'user_name')
# #<Hashie::Mash data=nil meta=#<Hashie::Mash message=nil status='ok' statuscode='100'>>
```

### File Management

#### List folder

```ruby
Ocman.list('path/to/folder', options={})
# [#<Hashie::Mash path="Documents" size=0 type="directory">, #<Hashie::Mash path="Test.zip" size=127 type="file">]
```

##### Available options:

* recursive - If true the folder contents will be listed recursively

#### Create folder

```ruby
Ocman.create_folder('path/to/folder')
# => ""
```

#### Upload a file

```ruby
Ocman.put('local/file/path', 'remote/path/to/folder', <options>)
# => nil
```

Available options:

* filename: filename of the file stored in owncloud (defaults to basename of the file)

#### Delete a file or folder

```ruby
Ocman.delete('path/to/file')
# => nil
```

#### Move a file or folder

```ruby
Ocman.move('source_path/of/file', 'destination_path')
# => ""
```

## Contact

Web: [https://www.toptranslation.com](https://www.toptranslation.com), [https://developer.toptranslation.com](https://developer.toptranslation.com)

Github: [https://www.github.com/tt-laboratories](https://www.github.com/tt-laboratories)

Twitter: [@tt_developers](http://www.twitter.com/tt_developers), [@toptranslation](http://www.twitter.com/toptranslation)

Mail: tech@toptranslation.com
