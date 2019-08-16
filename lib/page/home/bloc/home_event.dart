import 'package:equatable/equatable.dart';
import 'package:flutter_app/page/home/entity/bmob_user_entity.dart';

abstract class HomeEvent extends Equatable{
  HomeEvent([List props = const []])  : super(props);
}

/**
 * 加载主页数据
 */
class LoadHome extends HomeEvent{
  @override
  String toString() {
    // TODO: implement toString
    return "LoadHome";
  }
}

class LogoutHome extends HomeEvent{
  @override
  String toString() {
    // TODO: implement toString
    return "LogoutHome";
  }
}

class StartSearchEvent extends HomeEvent{
  bool isSearchWXArticle;
  String searchKey;

  StartSearchEvent(this.isSearchWXArticle,this.searchKey) :super([isSearchWXArticle,searchKey]);

  @override
  String toString() {
    // TODO: implement toString
    return 'StartSearchEvent{isSearchWXArticle: $isSearchWXArticle, searchKey: $searchKey}';

  }
}

class LoadBmobInfo extends HomeEvent {
  String userName;

  LoadBmobInfo (this.userName) : super([userName]);

  @override
  String toString() {
    // TODO: implement toString
    return 'LoadBmobInfo{userName: $userName}';
  }
}

class UpdateBmobInfo extends HomeEvent{

  BmobUserEntity bmobUserEntity;
  UpdateBmobInfo(this.bmobUserEntity) :super([bmobUserEntity]);

  @override
  String toString() {
    // TODO: implement toString
    return 'UpdateBmobInfo{bmobUserEntity: $bmobUserEntity}';
  }
}