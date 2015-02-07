namespace Valum {
	public interface Cache {

		public abstract void @get (string key, string? @default = null);

		public abstract void @set (string key, string @value);

		public abstract void @delete (string key);
	}
}
