namespace Valum {
	/**
	 * Cache interface
	 *
	 * @since 0.2
	 */
	public interface Cache : GLib.Object {

		/**
		 * Entry expiration fallbacks to backend implementation.
		 *
		 * @since 0.2
		 */
		public const uint DEFAULT = 0;
		public const uint MINUTE  = 60;
		public const uint HOUR    = 60 * MINUTE;
		public const uint DAY     = 24 * HOUR;
		public const uint WEEK    = 7  * DAY;
		public const uint MONTH   = 31 * DAY;
		public const uint YEAR    = 12 * MONTH;

		/**
		 * Check if the cache engine has an entry identified by a given key.
		 *
		 * @since 0.2
		 *
		 * @param key key of the cached entry
		 */
		public abstract bool has_key (string key);

		/**
		 * Obtain the value of a cached entry identified by a key.
		 *
		 * @since 0.2
		 *
		 * @param default
		 */
		public abstract new string @get (string key, string? @default = null);

		/**
		 * Add a new cached entry identified by a key.
		 *
		 * @since 0.2
		 *
		 * @param key     key of the cached entry
		 * @param value   value of the cached entry
		 * @param max_age duration of the cached entry in seconds
		 * @return builder syntax
		 */
		public abstract Cache @set (string key, string @value, uint max_age = Cache.DEFAULT);

		/**
		 * Delete an existing cached entry.
		 *
		 * @since 0.2
		 *
		 * @param key key of the cached entry to delete
		 * @return builder syntax
		 */
		public abstract Cache @delete (string key);
	}
}
