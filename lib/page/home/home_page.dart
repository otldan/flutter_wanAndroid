import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/page/search/search_page.dart';
import 'package:flutter_app/page/todo/todo_main.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/res/strings.dart';
import 'package:flutter_app/utils/display_util.dart';
import 'package:flutter_app/utils/screen_utils.dart';
import 'package:flutter_app/views/serach_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
import 'bloc/project_page.dart';
import 'entity/bmob_user_entity.dart';

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

class _HomePage extends State<HomePage> with TickerProviderStateMixin{
  BuildContext innerContext;
  HomeBloc homeBloc = HomeBloc();
  bool isLogin = false;
  bool isSearchWXArticle = false;
  String userName;
  BmobUserEntity bmobUserEntity;
  TabController _tabController;

  TextEditingController _searchTextContriller;
  static List<PageStorageKey<String>> keys =[
    PageStorageKey<String>('1'),
    PageStorageKey<String>('2'),
    PageStorageKey<String>('3'),

  ];
  ScrollController _scrollController;
  Map<String, Widget> tabs = {
    res.project: ProjectSubPage(keys[0]),
    res.article: ProjectSubPage(keys[1]),
    res.vxArticle: ProjectSubPage(keys[2]),
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener((){
      if (_tabController.index == 2){
        setState(() {
          isSearchWXArticle = true;
        });
      }
      else {
        setState(() {
          isSearchWXArticle = false;
        });
      }

    });
    _scrollController = ScrollController();
    _searchTextContriller = TextEditingController();
    homeBloc.dispatch(LoadHome());
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<HomeBloc>(
          builder: (context) => homeBloc,
        ),
      ],
      child: BlocListener(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeLoadError) {
            if (innerContext != null) {
              DisplayUtil.showMsg(innerContext, exception: state.exception);
            }
          }

          if (state is HomeLoaded) {
            isLogin = state.isLogin;
            userName = state.userName;
          }

          if (state is HomeSearchStarted) {
            if (!state.isSearchWXArticle) {
              Navigator.pushNamed(context, SearchPage.ROUTER_NAME,
                      arguments: _searchTextContriller.text)
                  .then((_) {
                if (!isLogin) {
                  homeBloc.dispatch(LoadHome());
                }
              });
            }
          }
          if (state is HomeBmobLoaded) {
            bmobUserEntity = state.bmobUserEntity;
          }
        },
        child: BlocBuilder<HomeEvent, HomeState>(
            bloc: homeBloc,
            builder: (context, state) {
              return Stack(
                children: <Widget>[
                  new Scaffold(
                    body: Builder(builder: (cotext) {
                      innerContext = context;
                      return Stack(
                        children: <Widget>[
                          DecoratedBox(
                            decoration: _themeGradientDecoration(),
                            child: SafeArea(
                                child: NestedScrollView(
                                    controller: null,
                                    headerSliverBuilder: (BuildContext context,
                                        bool innerBoxIsScrolled) {
                                      return <Widget>[
                                        SliverToBoxAdapter(
                                          child: Container(
                                            decoration:
                                                _themeGradientDecoration(),
                                            child: appBarHeader(),
                                          ),
                                        ),
                                      ];
                                    },
                                    body: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.circular(pt(10)),
                                                topRight: Radius.circular(
                                                    pt(10))))
                                    ,child: TabBarView(children: tabs.values.map((page) => page).toList(),controller: _tabController,),))),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              );
            }),
      ),
    );
  }

  /**
   * 头部标题栏
   */
  Widget appBarHeader() {
    return Container(
      height: pt(60),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Scaffold.of(innerContext).openDrawer();
            },
            child: Container(
              width: pt(34),
              height: pt(34),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: pt(12)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(pt(17)),
                  child: isLogin
                      ? Image.asset(
                          'images/user_icon',
                          fit: BoxFit.cover,
                          width: pt(34),
                          height: pt(34),
                        )
                      : Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: pt(34),
                        )),
            ),
          ),
          Expanded(
              child: Hero(
                  tag: 'searchBar',
                  child: Material(
                    type: MaterialType.transparency,
                    child: SearchBar(
                        height: pt(30),
                        color: Colors.grey[50],
                        child: TextField(
                          controller: _searchTextContriller,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (text) {
                            if (_searchTextContriller.text != null) {
                              homeBloc.dispatch(StartSearchEvent(
                                  isSearchWXArticle,
                                  _searchTextContriller.text));
                            }
                          },
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                              hintText: isSearchWXArticle
                                  ? res.searchWXArticleTips
                                  : res.searchTips,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(),
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: isSearchWXArticle
                                      ? WColors.wechat_green
                                      : WColors.hint_color_dark)),
                        ),
                        iconColor: isSearchWXArticle
                            ? WColors.wechat_green
                            : WColors.hint_color_dark,
                        icon: isSearchWXArticle
                            ? Image.asset(
                                'images/wechat.png',
                                width: 24,
                                height: 24,
                              )
                            : null),
                  ))),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, TodoPage.ROUTER_NAME).then((_) {
                if (!isLogin) {}
                homeBloc.dispatch(LoadHome());
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: pt(12), right: pt(12)),
              child: Icon(
                Icons.assignment,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Decoration _themeGradientDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(colors: [
      WColors.theme_color,
      WColors.theme_color_light,
    ], begin: Alignment.centerLeft, end: Alignment.centerRight));
  }
}
