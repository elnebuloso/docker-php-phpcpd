#/bin/bash

case "$1" in
    create)
        docker build -t docker-php-phpcpd --rm --pull -f Dockerfile .
    ;;

    verify)
        docker run -it --rm docker-php-phpcpd --version
    ;;

    help)
        docker run -it --rm docker-php-phpcpd --help
    ;;

    test)
        rm -rf test/report
        mkdir -p test/report
        git clone https://github.com/symfony/asset.git test/symfony-asset > /dev/null 2>&1

        docker run --rm -w $(pwd) -v $(pwd):$(pwd) docker-php-phpcpd \
            --log-pmd=$(pwd)/test/report/report.xml \
            $(pwd)/test/symfony-asset/
    ;;

    *)
        echo " - create  create container"
        echo " - verify  verify container"
        echo " - help    help container"
        echo " - test    collect metrics from test"
    ;;
esac