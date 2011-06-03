stage { "pre": before => Stage["main"] }
class python {
    package {
        "build-essential": ensure => "latest";
        "python": ensure => "latest";
        "python-dev": ensure => "latest";
        "python-setuptools": ensure => "latest";
        "git-core": ensure => "latest";
    }
    exec { "pip":
        command => "easy_install pip",
        path => "/usr/local/bin:/usr/bin:/bin",
        refreshonly => true,
        require => [Package["build-essential"], Package["python-setuptools"],
            Package["python"], Package["python-dev"], Package["git-core"]],
        subscribe => Package["python-setuptools"],
    }
}
class { "python": stage => "pre" }

/*

Currently, this does not work, but this is the general idea of how you
would go about it.  I'm going to manually build a box and package it
in the meantime.

The problem related to [#298][] with pip.  Pip seems to behave differently
depending on how it is run.  Until that's worked out, armstrong can't be
installed via pip+puppet.

[#298]: https://github.com/pypa/pip/issues/298

exec { "armstrong":
    command => "/usr/local/bin/pip install -vvv armstrong",
    require => Exec["pip"],
    environment => ["LANG=en_US.UTF-8", "PWD=/tmp/vagrant-puppet/manifests", "SHLVL=1"],
    logoutput => true,
}


class initialize_armstrong {
    file { "/sites":
        ensure => directory,
    }

    exec { "armstrong_init":
        command => "/usr/local/bin/armstrong init armstrong",
        cwd => "/sites",
        require => [Package["armstrong"], File["/sites"]],
    }

    exec { "armstrong_requirements":
        command => "/usr/local/bin/pip install -r requirements/development.txt",
        cwd => "/sites/armstrong",
        require => Exec["armstrong_init"],
    }

    exec { "basic_db":
        command => [
            "sed -i 's/backends\\./backends.sqlite3/' config/development.py",
            "sed -i \"s/NAME': ''/NAME': 'armstrong.db'/\" config/development.py",
        ],
        path => "/bin",
        cwd => "/sites/armstrong",
        require => Exec["armstrong_init"],
    }

    exec { "armstrong_syncdb":
        command => "/usr/local/bin/armstrong syncdb --noinput",
        cwd => "/sites/armstrong",
        require => Exec["armstrong_requirements"],
    }
}

include initialize_armstrong

*/
