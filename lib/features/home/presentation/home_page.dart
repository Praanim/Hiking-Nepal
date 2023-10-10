import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:hiking_nepal/core/routes/route_constants.dart';
import 'package:hiking_nepal/features/home/presentation/cubit/bottom_navigation/bottom_navigation_cubit.dart';

class BottomNavigatorPage extends StatefulWidget {
  final Widget child;
  const BottomNavigatorPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<BottomNavigatorPage> createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
  ];

  void _navigatePage(int index) {
    switch (index) {
      case 0:
        context.goNamed(RouteConstants.home);
      case 1:
        context.goNamed(RouteConstants.profile);

      default:
        context.goNamed(RouteConstants.home);
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
          body: widget.child,
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
                _navigatePage(context.read<BottomNavigationCubit>().state);
              },
            ),
          ),
        );
      }),
    );
  }
}
