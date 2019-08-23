import 'package:equatable/equatable.dart';
import 'package:flutter_app/page/home/entity/project_entity.dart';

abstract class ProjectEvent extends Equatable {
  ProjectEvent([List props = const []]) : super(props);
}

///加载全部
class LoadProject extends ProjectEvent {
  @override
  String toString() {
    return 'LoadProject{}';
  }
}

///加载更多项目
class LoadMoreProjectDatas extends ProjectEvent {
  List<ProjectEntity> originDatas;
  int page;

  LoadMoreProjectDatas(this.originDatas, this.page)
      : super([originDatas, page]);

  @override
  String toString() {
    return 'LoadMoreProjectDatas{originDatas: ${originDatas?.length}, page: $page}';
  }
}

///收藏、取消收藏
class CollectProject extends ProjectEvent {
  int id;
  bool collect;

  CollectProject(this.id, this.collect) : super([id, collect]);

  @override
  String toString() {
    return 'CollectProject{id: $id, collect: $collect}';
  }
}
