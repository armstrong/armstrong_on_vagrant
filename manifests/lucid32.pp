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

