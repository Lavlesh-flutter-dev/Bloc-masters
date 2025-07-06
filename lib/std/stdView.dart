import 'package:bloc_master_app/features/cart/ui/cart.dart';
import 'package:bloc_master_app/std/bloc/std_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StdView extends StatefulWidget {
  const StdView({super.key});

  @override
  State<StdView> createState() => _StdViewState();
}

class _StdViewState extends State<StdView> {
  final StdBloc stdBloc = StdBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('STD')),
      body: BlocConsumer<StdBloc, StdState>(
        bloc: stdBloc,
        listenWhen: (previous, current) => current is StdActionState,
        buildWhen: (previous, current) => current is! StdActionState,
        listener: (context, state) {
          if (state is StdActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            );
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Favorte is Added')));
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  stdBloc.add(StdNavigationEvent());
                },
                child: Text('Elevated BTN'),
              ),
              ListTile(
                title: Text('Lavlesh title'),
                trailing: InkWell(
                  onTap: () {
                    stdBloc.add(StdClickHeartEvent());
                  },
                  child: (state is StdHeartState && state.isFilled)
                      ? Icon(Icons.heart_broken)
                      : Icon(Icons.heart_broken_outlined),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
