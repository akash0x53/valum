namespace Valum {

	/**
	 * Session
	 *
	 * @since 0.2
	 */
	public interface Session {

		/**
		 * Tells if the session contains the given key.
		 *
		 * @since 0.2
		 *
		 * @param string key
		 */
		public abstract bool has_key (string key);

		/**
		 * Obtain the value associated to the given key.
		 *
		 * @since 0.2
		 */
		public abstract string? @get (string key, string? @default = null);

		/**
		 * @since 0.2
		 *
		 * @param key
		 * @param value
		 * @return builder
		 */
		public abstract Session @set (string key, string @value);

		/**
		 * Merge the given table into the session.
		 *
		 * Existing key are overwritten and missing are added.
		 *
		 * @param session session table to be merged into this session.
		 * @return builder
		 */
		public abstract Session merge (HashTable<string, string> session);

		/**
		 * Remove a session key and its associated value.
		 *
		 * @since 0.2
		 *
		 * @param name
		 */
		public abstract Session remove (string name);

		/**
		 * Write-back changes to the session map.
		 *
		 * @since 0.2
		 */
		public abstract void update ();

		/**
		 * Delete the session.
		 *
		 * @since 0.2
		 */
		public abstract void @delete ();
	}
}
