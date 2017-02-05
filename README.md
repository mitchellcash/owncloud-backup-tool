ownUp
=====

ownUp is an ownCloud backup tool to backup your ownCloud database as well as config/ and data/ directories to Amazon s3.

ownUp currently only supports Ubuntu.

Requirements
------------

* [pip](https://pypi.python.org/pypi/pip)

```
$ curl -s -o- https://bootstrap.pypa.io/get-pip.py | python get-pip.py
```

* [aws-cli](https://github.com/aws/aws-cli)

```
$ pip install awscli
```

Usage
-----

```
$ curl -fsSL https://raw.githubusercontent.com/mitchellcash/ownup/master/setup.sh | sudo sh
```

License
-------

ownUp is released under the terms of the MIT license. See [LICENSE](https://github.com/mitchellcash/ownUp/blob/master/LICENSE) for more information or see https://opensource.org/licenses/MIT.
