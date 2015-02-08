using Libmemcached;

namespace Valum {
	/**
	 * Memcached implementation of Cache interface.
	 *
	 * @since 0.2
	 */
	public class MemcachedCache : GLib.Object, Cache {

		/**
		 * Memcached client for low-level access.
		 */
		public Memcached client = new Memcached ();

		public MemcachedCache (string host, uint16 port = 11211) {
			this.client = new Memcached ();
			this.client.server_push (Memcached.servers_parse ("%s:%u".printf (host, port)));
		}

		public bool has_key (string key) {
			uint32 flags;
			Memcached.Return rc;

			this.client.get (key.data, out flags, out rc);

			if (rc == Memcached.Return.SUCCESS)
				return true;

			if (rc == Memcached.Return.NOTFOUND)
				return false;

			error("%d: could not get from memcached", rc);
		}

		public new string @get (string key, string? @default = null) {
			uint32 flags;
			Memcached.Return rc;

			var str = this.client.get (key.data, out flags, out rc);

			if (rc == Memcached.Return.SUCCESS)
				return (string) str;

			error("%d: could not get from memcached", rc);
		}

		public new Cache @set (string key, string @value, uint max_age = Cache.DEFAULT) {
			var rc = this.client.set (key.data, value.data, 0, 0);

			if (rc == Memcached.Return.SUCCESS)
				return this;

			error ("%d: could not set to memcached", rc);
		}

		public Cache @delete (string key) {
			var rc = this.client.delete (key.data, Cache.DEFAULT);

			if (rc == Memcached.Return.SUCCESS)
				return this;

			error ("%d: could not set to memcached", rc);
		}
	}
}
