import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

/**
 * 主页
 */
class HomePage extends StatefulWidget {
  static const ROUTER_NAME = '/HomePage';

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProviderTree(
        blocProviders: [BlocProvider<HomeBloc>(
          builder: (context) => homeBloc,
        ),
        ],
        child: BlocListener(bloc: homeBloc, listener: (context,state){

    }),);
  }

}