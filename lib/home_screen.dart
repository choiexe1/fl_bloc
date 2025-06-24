import 'package:fl_bloc/blocs/int_bloc.dart';
import 'package:fl_bloc/blocs/int_bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final intBloc = context.read<IntBloc>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<IntBloc, int>(
                /// 제네릭 타입 지정 필수, 타입 지정 하지 않을 경우 부모인 [BlocProvider]로 제공된 블록이 하나이더라도 찾지 못함
                /// 굳이 다음처럼 bloc을 명시하지 않아도 됨, 제네릭 타입만 지정
                /// [BuildContext]에서 접근하지 못할 경우 bloc 옵션을 사용하고 그 외의 일반적인 케이스에서는 지정하지 않고 사용하는 것을 권장
                /// bloc: context.read<ExampleBloc>(),
                builder: (context, state) => GestureDetector(
                  onTap: () => intBloc.add(IntIncrement(amount: 1)),
                  child: Text('$state', style: TextStyle(fontSize: 48)),
                ),

                /// [buildWhen] 옵션을 통해 필요한 조건일때만 렌더링하도록 명시적으로 선언 가능
                /// 기본값은 Bloc의 상태에 대해 true 반환임
                // buildWhen: (previous, current) {
                //   return previous == current;
                // },
              ),
              BlocBuilder<IntBloc, int>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => intBloc.add(IntError()),
                    child: Text('에러 발생 시키기', style: TextStyle(fontSize: 48)),
                  );
                },
              ),
              BlocListener<IntBloc, int>(
                listener: (context, state) {
                  if (state > 10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('상태가 10을 초과, $state')),
                    );
                  }
                },
                child: const Text(
                  '블록 리스너 하위 위젯',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
