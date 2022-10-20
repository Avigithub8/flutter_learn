import 'bloc.dart';
import 'package:flutter/widgets.dart';

class BlocBuilder extends StatelessWidget {
  final Widget Function() builder;
  final Bloc bloc;

  const BlocBuilder({
    super.key,
    required this.builder,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.strem,
      initialData: bloc.strem,
      builder: (context, snapshot) {
        return builder();
      },
    );
  }
}
