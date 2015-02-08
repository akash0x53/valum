using Valum;

public static void test_cache_memcached () {
	var cache = new MemcachedCache ("127.0.0.1", 11211);

	assert (cache.set ("key", "value") == cache);

	assert (cache.has_key ("key"));

	assert (cache.delete ("key") == cache);

	assert (cache.has_key ("key") == false);
}
