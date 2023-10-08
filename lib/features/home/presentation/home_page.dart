import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiking_nepal/features/home/presentation/cubit/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:hiking_nepal/features/home/presentation/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
  ];

  Widget _navigatePage(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Scaffold(
          body: Center(
            child: Text("This is Profile page"),
          ),
        );
      default:
        return const Scaffold(
          body: Center(
            child: Text("Something went wrong"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    /// this cubit is not in injection container because it doesnt require
    /// access to the respective repo and is simple cubit
    return BlocProvider<BottomNavigationCubit>(
      create: (_) => BottomNavigationCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocBuilder<BottomNavigationCubit, int>(
            builder: (context, state) {
              return _navigatePage(state);
            },
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              items: _bottomNavigationBarItems,
              currentIndex: context.watch<BottomNavigationCubit>().state,
              onTap: (value) {
                context.read<BottomNavigationCubit>().setIndex(value);
              },
            ),
          ),
        );
      }),
    );
  }
}
