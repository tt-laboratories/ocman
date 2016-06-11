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
  config.base_url = 'https://example.org'
  config.user_name = ''
  config.password = ''
end
```

Optional configuration options

```ruby
  config.dav_base_uri = '/remote.php/webdav/' # Optional - URI of the owncloud installation. Defaults to '/remote.php/webdav/'
```

## Usage

### Sharing

#### Share a folder or a file

```ruby
>> Ocman.share('path/to/folder', 'user_name')
=> #<Hashie::Mash data=nil meta=#<Hashie::Mash message=nil status='ok' statuscode='100'>>
```

#### Delete a share for a folder or a file

```ruby
# delete a share
>> Ocman.delete_share('path/to/folder', 'user_name')
=> #<Hashie::Mash data=nil meta=#<Hashie::Mash message=nil status='ok' statuscode='100'>>
```

### Filemanagement

#### List folder

```ruby
>> Ocman.list('path/to/folder')
=> [#<Hashie::Mash path="Documents" size=0 type="directory">, #<Hashie::Mash path="Test.zip" size=127 type="file">]
```

#### Create folder

```ruby
>> Ocman.create_folder('path/to/folder')
=> ""
```

#### Upload a file

```ruby
>> Ocman.put('local/file/path', 'remote/path/to/folder')
=> nil
```

## Contact
Web: [https://www.toptranslation.com](https://www.toptranslation.com)

Github: [https://www.github.com/tt-laboratories](https://www.github.com/tt-laboratories)

Twitter: [@tt_developers](http://www.twitter.com/tt_developers), [@toptranslation](http://www.twitter.com/toptranslation) 

Mail: tech@toptranslation.com
