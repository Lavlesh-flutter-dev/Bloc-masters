import 'package:bloc_master_app/features/home/ui/home.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // Define events
//  abstract class UnlikeEvent {}

// class IconTapEvent extends UnlikeEvent {}

// // Define the Bloc
// class CounterBloc extends Bloc<UnlikeEvent, bool> {
//   CounterBloc() : super(true) {
//     on<IconTapEvent>((event, emit) {
//       emit(!state);
//     });
//   }
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: BlocProvider(create: (_) => CounterBloc(), child: CounterPage()),
//     );
//   }
// }

// class CounterPage extends StatelessWidget {
//   const CounterPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     debugPrint('refreshing all');
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter Page')),
//       body: Center(
//         child: ListTile(
//           title: Text('This is Lavlesh'),
//           trailing: BlocBuilder<CounterBloc, bool>(
//             builder: (context, isHeart) {
//               return InkWell(
//                 onTap: () {
//                   context.read<CounterBloc>().add(IconTapEvent());
//                 },
//                 child: isHeart
//                     ? Icon(Icons.heart_broken)
//                     : Icon(Icons.heart_broken_outlined),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home()
    );
  }
}
