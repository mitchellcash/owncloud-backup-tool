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

Before using aws-cli, you need to tell it about your AWS credentials. You can do this by running the `aws configure` command.

Usage
-----

```
$ curl -fsSL https://raw.githubusercontent.com/mitchellcash/ownup/master/setup.sh | sudo bash
```

License
-------

ownUp is released under the terms of the MIT license. See [LICENSE](https://github.com/mitchellcash/ownup/blob/master/LICENSE) for more information or see https://opensource.org/licenses/MIT.
