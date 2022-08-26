class CommentModel {
  String? msg;
  int? code;
  Data? data;

  CommentModel({msg, code, data});

  CommentModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? total;
  List<OneComment>? list;
  int? pageNum;
  int? pageSize;
  int? size;
  int? startRow;
  int? endRow;
  int? pages;
  int? prePage;
  int? nextPage;
  bool? isFirstPage;
  bool? isLastPage;
  bool? hasPreviousPage;
  bool? hasNextPage;
  int? navigatePages;
  List<int>? navigatepageNums;
  int? navigateFirstPage;
  int? navigateLastPage;

  Data(
      {total,
        list,
        pageNum,
        pageSize,
        size,
        startRow,
        endRow,
        pages,
        prePage,
        nextPage,
        isFirstPage,
        isLastPage,
        hasPreviousPage,
        hasNextPage,
        navigatePages,
        navigatepageNums,
        navigateFirstPage,
        navigateLastPage});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['list'] != null) {
      list = <OneComment>[];
      json['list'].forEach((v) {
        list!.add(OneComment.fromJson(v));
      });
    }
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    size = json['size'];
    startRow = json['startRow'];
    endRow = json['endRow'];
    pages = json['pages'];
    prePage = json['prePage'];
    nextPage = json['nextPage'];
    isFirstPage = json['isFirstPage'];
    isLastPage = json['isLastPage'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    navigatePages = json['navigatePages'];
    navigatepageNums = json['navigatepageNums'].cast<int>();
    navigateFirstPage = json['navigateFirstPage'];
    navigateLastPage = json['navigateLastPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    data['pageNum'] = pageNum;
    data['pageSize'] = pageSize;
    data['size'] = size;
    data['startRow'] = startRow;
    data['endRow'] = endRow;
    data['pages'] = pages;
    data['prePage'] = prePage;
    data['nextPage'] = nextPage;
    data['isFirstPage'] = isFirstPage;
    data['isLastPage'] = isLastPage;
    data['hasPreviousPage'] = hasPreviousPage;
    data['hasNextPage'] = hasNextPage;
    data['navigatePages'] = navigatePages;
    data['navigatepageNums'] = navigatepageNums;
    data['navigateFirstPage'] = navigateFirstPage;
    data['navigateLastPage'] = navigateLastPage;
    return data;
  }
}

class OneComment {
  String? searchValue;
  String? createBy;
  String? createTime="";
  String? updateBy;
  String? updateTime;
  String? remark;
  int? id;
  int? pId;
  int? secondHandId;
  int? userId;
  String? userName="";
  String? content="";
  List<OneComment>? commentList;
  String? currentPage;
  String? pageSize;
  String? pidList;

  OneComment(
      {searchValue,
        createBy,
        createTime,
        updateBy,
        updateTime,
        remark,
        id,
        pId,
        secondHandId,
        userId,
        userName,
        content,
        commentList,
        currentPage,
        pageSize,
        pidList});

  OneComment.fromJson(Map<String, dynamic> json) {
    searchValue = json['searchValue'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    remark = json['remark'];
    id = json['id'];
    pId = json['pId'];
    secondHandId = json['secondHandId'];
    userId = json['userId'];
    userName = json['userName'];
    content = json['content'];
    if (json['commentList'] != null) {
      commentList = <OneComment>[];
      json['commentList'].forEach((v) {
        commentList!.add(OneComment.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    pageSize = json['pageSize'];
    pidList = json['pidList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['searchValue'] = searchValue;
    data['createBy'] = createBy;
    data['createTime'] = createTime;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['remark'] = remark;
    data['id'] = id;
    data['pId'] = pId;
    data['secondHandId'] = secondHandId;
    data['userId'] = userId;
    data['userName'] = userName;
    data['content'] = content;
    if (commentList != null) {
      data['commentList'] = commentList!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['pageSize'] = pageSize;
    data['pidList'] = pidList;
    return data;
  }
}

// class CommentList {
//   String? searchValue;
//   String? createBy;
//   String? createTime;
//   String? updateBy;
//   String? updateTime;
//   String? remark;
//   int? id;
//   int? pId;
//   int? secondHandId;
//   int? userId;
//   String? userName;
//   String? content;
//   String? currentPage;
//   String? pageSize;
//   String? pidList;
//
//   CommentList(
//       {searchValue,
//         createBy,
//         createTime,
//         updateBy,
//         updateTime,
//         remark,
//         id,
//         pId,
//         secondHandId,
//         userId,
//         userName,
//         content,
//         commentList,
//         currentPage,
//         pageSize,
//         pidList});
//
//   CommentList.fromJson(Map<String, dynamic> json) {
//     searchValue = json['searchValue'];
//     createBy = json['createBy'];
//     createTime = json['createTime'];
//     updateBy = json['updateBy'];
//     updateTime = json['updateTime'];
//     remark = json['remark'];
//     id = json['id'];
//     pId = json['pId'];
//     secondHandId = json['secondHandId'];
//     userId = json['userId'];
//     userName = json['userName'];
//     content = json['content'];
//     currentPage = json['currentPage'];
//     pageSize = json['pageSize'];
//     pidList = json['pidList'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  <String, dynamic>{};
//     data['searchValue'] = searchValue;
//     data['createBy'] = createBy;
//     data['createTime'] = createTime;
//     data['updateBy'] = updateBy;
//     data['updateTime'] = updateTime;
//     data['remark'] = remark;
//     data['id'] = id;
//     data['pId'] = pId;
//     data['secondHandId'] = secondHandId;
//     data['userId'] = userId;
//     data['userName'] = userName;
//     data['content'] = content;
//     data['currentPage'] = currentPage;
//     data['pageSize'] = pageSize;
//     data['pidList'] = pidList;
//     return data;
//   }
// }