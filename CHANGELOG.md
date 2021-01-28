<a name="1.4.1"></a>
### 1.4.1 (2021-01-28)

#### Bug Fixes

* use ERB::Util.url_encode instead of CGI.escape	 ([3590197](/../commit/3590197))

#### Maintain

* add .DS_Store to gitignore	 ([9bc59f4](/../commit/9bc59f4))

<a name="1.4.0"></a>
### 1.4.0 (2020-12-22)

#### Features

* add recursive flag to create_folder (#7)	 ([28d76b1](/../commit/28d76b1))

<a name="1.3.1"></a>
### 1.3.1 (2020-02-25)

#### Bug Fixes

* use ERB::Util.url_encode instead of CGI.escape to emulate URI.escape's behaviour

<a name="1.3.0"></a>
### 1.3.0 (2020-02-21)

#### Features

* make share permissions configurable

#### Bug Fixes

* avoid NoMethodError on delete_share when no share was found

#### Maintenance

* use github actions

#### Style

* fix rubocop offenses

<a name="1.2.3"></a>
### 1.2.3 (2020-01-24)

#### Bug Fixes

* escape filename in dav uri

#### maintain

* check in Gemfile and ignore Gemfile.lock

<a name="1.2.2"></a>
### 1.2.2 (2016-12-30)

#### Other

* refactor Ocman::Share
* use multi_json instead of json

<a name="1.2.1"></a>
### 1.2.1 (2016.12.21)

#### Bug Fixes 

* add `OCS-APIRequest: true` header https://github.com/nextcloud/server/issues/2753

<a name="1.1.0"></a>
### 1.1.0 (2016.09.12)

#### Bug Fixes:

* Ocman now handles URI.encode and URI.decode automatically (breaking change)
