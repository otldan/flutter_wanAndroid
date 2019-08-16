
import 'package:flutter_app/res/string_zh.dart';
Strings _res = StringsZh();

Strings get res => _res;

/**
 * 语言集接口。方便统一管理字符串。也为未来多语言做准备
 */
abstract class Strings{

  //'get'关键字可加可不加。加上的话能够快速跳转具体实现：快捷键option + command + 左键
  get appName;

  get username;

  get password;

  get regist;

  get login;

  get netConnectFailed;

  get rePassword;

  get todo;

  get createNew;

  get allEmpty;

  get work;

  get life;

  get play;

  get all;

  get important;

  get normal;

  get relaxed;

  get orderByCreateTime;

  get orderByFinishTime;

  get isLoading;

  get create;

  get title;

  get detail;

  get finishTime;

  get planFinishTime;

  get noTemplate;

  get getExpress;

  get repay;

  get readbook;

  get getExpressDetail;

  get repayDetail;

  get readbookDetail;

  get editor;

  get isBottomst;

  get confirm;

  get cancel;

  get ensureDelete;

  get markDone;

  get markUndo;

  get todoTips;

  get pullToRefresh;

  get pullToRetry;

  get searchTips;

  get project;

  get ensureLogout;

  get logout;

  get newestProject;

  get article;

  get vxArticle;

  get navigation;

  get collect;

  get typeLevel1;

  get typeLevel2;

  get newestArticle;

  get author;

  get time;

  get QA;

  get New;

  get undone;

  get done;

  get openBrowser;

  get about;

  get feedback;

  get supportAuthor;

  get searchWXArticleTips;

  get checkUpdate;

  get initSignature;

  get signin;

  get signined;

  get rank;

  get levelRank;

  get feedbackTips;

  get peopleAreSearching;

  get stickTop;

  get longPressToCopyUrl;

  get hasCopied;

  get collectWeb;

  get enterWebName;

  get enterWebLink;

  get enterTitle;

  get enterAuthor;

  get enterLink;

  get add;

  get noEmpty;

  get collectArticle;

  get type;

  get finish;

  get loginFirst;

  get isNewestVersion;

  get go;
}


abstract class BaseStrings implements Strings{
  @override
  get appName => "玩儿Android";
}