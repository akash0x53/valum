using VSGI;

namespace Valum {
	/**
	 * Component for handling cookies conveniently.
	 *
	 * @since 0.2
	 */
	public class Cookies {

		private Request request;

		private Response response;

		private SList<Soup.Cookie> cookies;

		/**
		 * @since 0.2
		 */
		public Cookies (Request req, Response res) {
			this.request  = req;
			this.response = res;
			this.cookies  = req.cookies;
		}

		/**
		 * Remove expired or duplicated cookies.
		 */
		private void clean () {}

		/**
		 * @see Soup.Cookie
		 * @since 0.2
		 *
		 * @param name
		 * @param value
		 * @param secure
		 * @param max_age
		 *
		 * @return builder
		 */
		public Cookies @set (string name, string @value, bool secure = false, int max_age = 0) {
			var uri    = request.uri;
			var cookie = new Soup.Cookie (name, @value, uri.get_host (), uri.get_path (), max_age);

			cookie.set_secure (secure);

			this.cookies.append (cookie);

			return this;
		}

		/**
		 * Write cookies to Response headers.
		 *
		 * @since 0.2
		 */
		public void update () {
			this.response.cookies = this.cookies;
		}
	}
}
