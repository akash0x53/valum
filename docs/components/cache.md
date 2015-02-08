Valum provides a `Cache` interface and a backend implementation for
[memcached](http://memcached.org/).

There are two ways of using cache and more generally components: per request or
per process.

One cache connection per request:
```java
app.get ("", (req, res) => {
    var cache = new MemcachedCache ("127.0.0.1:11211");
    var value = cache.get ("key")
});
```

One cache connection for the whole process time:
```java
var cache = new MemcachedCache ("127.0.0.1:11211");

app.get ("", (req, res) => {
    var value = cache.get ("key")
});
```

Memcached supports gargebage collection (LRU algorithm), so that yo do not need
to worry about cleaning up expired entries.

Obtaining an entry
------------------

```java
var value = cache.get ("key");
```

Setting an entry
----------------

Cache entry have a `max_age` defaulting to a `Cache.DEFAULT`, which will match
the backend default expiration policy.

```java
cache.set ("key", "value").set ("key2", "value2", Cache.DAY);
```

Additionnal constants are providen for:

 - `MINUTE`
 - `HOUR`
 - `DAY`
 - `WEEK`
 - `MONTH`
 - `YEAR`

Deleting an entry
-----------------

```java
cache.delete ("key")
```
