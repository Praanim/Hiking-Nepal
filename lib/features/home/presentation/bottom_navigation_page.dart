import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:hiking_nepal/core/routes/route_constants.dart';
import 'package:hiking_nepal/features/home/presentation/cubit/bottom_navigation/bottom_navigation_cubit.dart';

class BottomNavigatorPage extends StatelessWidget {
  final Widget child;
  BottomNavigatorPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.post_add), label: "Add Post"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  void _navigatePage(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(RouteConstants.home);
        break;
      case 1:
        context.goNamed(RouteConstants.addPost);
        break;
      case 2:
        context.goNamed(RouteConstants.profile);
        break;
      default:
        context.goNamed(RouteConstants.home);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// this cubit is not in injection container because it doesnt require
    /// access to the respective repo and is simple cubit
    return BlocProvider<BottomNavigationCubit>(
      create: (_) => BottomNavigationCubit(),
      child: Scaffold(
        body: child,
        bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BlocBuilder<BottomNavigationCubit, int>(
              builder: (context, state) {
                return BottomNavigationBar(
                  items: _bottomNavigationBarItems,
                  currentIndex: state,
                  onTap: (value) {
                    context.read<BottomNavigationCubit>().setIndex(value);
                    _navigatePage(value, context);
                  },
                );
              },
            )),
      ),
    );
  }
}
