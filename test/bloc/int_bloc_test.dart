import 'package:bloc_test/bloc_test.dart';
import 'package:fl_bloc/blocs/int_bloc.dart';
import 'package:fl_bloc/blocs/int_bloc_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(IntBloc, () {
    late IntBloc intBloc;

    setUp(() {
      intBloc = IntBloc();
    });

    test('초기 값은 0이어야 한다.', () {
      expect(intBloc.state, 0);
    });

    blocTest(
      'IncrementEvent가 추가되면 amount만큼 더해져야한다.',
      build: () => intBloc,
      act: (bloc) => bloc.add(IntIncrement(amount: 10)),
      // Expect는 블록의 변화하는 상태
      expect: () => [10],
    );

    blocTest(
      'IncrementEvent의 amount가 1보다 낮을 경우 에러가 발생해야한다.',
      build: () => intBloc,
      act: (bloc) => bloc.add(IntIncrement(amount: 0)),
      // 생성자에서 발생하는 에러를 errors로 체크
      errors: () => [isA<Exception>()],
    );
  });
}
