# ocman
Ruby gem for file managment and sharing in owncloud

# Getting Started

## Install
### Rails
Add this line to your application's Gemfile:
``` ruby
gem "ocman", :git => 'git@github.com:tt-laboratories/ocman.git'
```


## Configuration
### Rails
Initialize Ocman with your access credentials somewhere during startup:
`.../initializers/ocman.rb`
```ruby
Ocman.configure do |config|
  config.base_url = 'https://example.org'
  config.user_name = ''
  config.password = ''
end
```

## Usage
```ruby
>> Ocman.share("path/to/folder", "evel.knievel")
=> #<Hashie::Mash data=nil meta=#<Hashie::Mash message=nil status="ok" statuscode="100">>

# delete a share
>> Ocman.delete_share("path/to/folder", "evel.knievel")
=> #<Hashie::Mash data=nil meta=#<Hashie::Mash message=nil status="ok" statuscode="100">>
```
