stage { "pre": before => Stage["main"] }
class python {
    package {
        "build-essential": ensure => "latest";
        "python": ensure => "latest";
        "python-dev": ensure => "latest";
        "python-setuptools": ensure => "latest";
        "git-core": ensure => "latest";
    }
    exec { "easy_install pip":
        path => "/usr/local/bin:/usr/bin:/bin",
        refreshonly => true,
        require => Package["python-setuptools"],
        subscribe => Package["python-setuptools"],
    }
}
class { "python": stage => "pre" }

package { "fabric":
    provider => pip,
    source => "git://github.com/tswicegood/fabric.git",
}

package { "django":
    provider => pip,
    ensure => latest,
}

package { "gunicorn":
    provider => pip,
    ensure => latest,
    require => Package["django"],
}

file {
    "/sites":
        ensure => directory,
        require => Package["gunicorn"];

    "/sites/armstrong":
        ensure => directory,
        require => File["/sites"];

    "/sites/armstrong/arm_server.py":
        content => template("arm_server.py"),
        ensure => file,
        require => File["/sites/armstrong"];

    "/sites/armstrong/config":
        ensure => directory,
        require => File["/sites/armstrong"];

    "/sites/armstrong/config/__init__.py":
        content => template("config/__init__.py"),
        ensure => file,
        require => File["/sites/armstrong/config"];

    "/sites/armstrong/config/urls.py":
        content => template("config/urls.py"),
        ensure => file,
        require => File["/sites/armstrong/config"];

    "/sites/armstrong/config/development.py":
        content => template("config/development.py"),
        ensure => file,
        require => File["/sites/armstrong/config"];
}

exec{ "gunicorn":
    require => File["/sites/armstrong/config/development.py"],
    command => "/usr/local/bin/gunicorn -D --bind=0.0.0.0:80 arm_server",
    cwd => "/sites/armstrong";
}
