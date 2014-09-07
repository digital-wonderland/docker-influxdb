## About:

[Docker](http://www.docker.com/) image based on [digitalwonderland/base](https://registry.hub.docker.com/u/digitalwonderland/base/)

## Additional Software:

* [Influxdb](http://influxdb.com/)

## Usage:

The image ist clusterable with a [Graphite](http://graphite.wikidot.com/) input listening on port ```2003```.

To start a new instance

```docker run -d --name influxdb -p 2003:2003 -p 2003:2003/udp -p 8083:8083 -p 8086:8086 -p 8090:8090 -p 8099:8099 digitalwonderland/influxdb```

To start new instances for an existing cluster just pass the ips (including port) as arguments (they get used for the ```seed-servers``` option). 

**NOTE:** If the containers ip is not routable between machines you must configure a public ip via the ```PUBLIC_IP``` environment variable, which will get used with ```-hostname```.
