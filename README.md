ownUp
=====

ownUp is an ownCloud backup tool to backup your ownCloud database as well as config/ and data/ directories to Amazon s3.

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
$ wget -O - https://raw.githubusercontent.com/mitchellcash/ownUp/master/ownUp/ownup.sh | sh
```
