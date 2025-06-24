sealed class IntBlocEvent {}

final class IntIncrement extends IntBlocEvent {
  IntIncrement({this.amount = 1});

  final int amount;
}

final class IntError extends IntBlocEvent {}
