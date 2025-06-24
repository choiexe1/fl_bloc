sealed class IntBlocEvent {}

final class IntIncrement extends IntBlocEvent {
  IntIncrement({this.amount = 1}) {
    if (amount < 1) {
      throw Exception('IntIncrement 이벤트의 amount는 1보다 낮을 수 없음');
    }
  }

  final int amount;
}

final class IntError extends IntBlocEvent {}
