using VSGI;

namespace Valum {

	/**
	 * Session implementation based on native server session.
	 *
	 * VSGI provides native session access, so this component is only gently
	 * wrapping it.
	 *
	 * @see VSGI.Request.session
	 * @since 0.2
	 */
	public class NativeSession : GLib.Object, Session {

		private Request request;

		private HashTable<string, string> session;

		public NativeSession (Request request) {
			this.request = request;
			this.session = request.session;

			// automatically creates it
			if (this.session == null)
				this.session = new HashTable<string, string> (str_hash, str_equal);
		}

		public bool has_key (string key) {
			return this.session.contains (key);
		}

		public new string? @get (string key, string? @default = null) {
			return this.session.contains (key) ? this.session[key] : @default;
		}

		public new Session @set (string key, string @value) {
			this.session[key] = @value;
			return this;
		}

		public Session merge (HashTable<string, string> ses) {

			ses.foreach ((k, v) => {
				this.session[k] = v;
			});

			return this;
		}

		public Session remove (string key) {
			this.session.remove (key);
			return this;
		}

		public void update () {
			this.request.session = this.session;
		}

		public void delete () {
			this.session = new HashTable<string, string> (str_hash, str_equal);
			this.request.session = null;
		}
	}
}
