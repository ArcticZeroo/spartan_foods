abstract class ISerializable<T> {
  String serialize(T value);
  T deserialize(String value);
}