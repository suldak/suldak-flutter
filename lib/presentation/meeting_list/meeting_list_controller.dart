import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../model/meeting.dart';

class MeetingListController extends GetxController {
  // Variable ▼ ------------------------------------------------------

  Rx<String> title = ('meeting'.tr).obs;

  Rx<String> emptyText = ('empty'.tr).obs;

  final Rx<PagingController<int, Meeting>> pagingController =
      PagingController<int, Meeting>(firstPageKey: 0).obs;

  Future<List<Meeting>> Function(int pageKey)? pagination;

  // Functions ▼ ------------------------------------------------------

  Future<void> fetchPage(int pageKey) async {
    if (pagination == null) return;

    final list = await pagination!(pageKey);
    final isLastPage = list.length < 10;
    if (isLastPage) {
      pagingController.value.appendLastPage(list);
    } else {
      final nextPageKey = pageKey + 1;
      pagingController.value.appendPage(list, nextPageKey);
    }
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    final titleArg = Get.arguments['title'];
    final emptyTextArg = Get.arguments['emptyText'];
    final Future<List<Meeting>> Function(int pageKey)? paginationArg = Get
        .arguments['pagination'];

    if (titleArg != null && titleArg is String) {
      title.value = titleArg;
    }

    if (emptyTextArg != null && emptyTextArg is String) {
      emptyText.value = emptyTextArg;
    }

    if (paginationArg != null) {
      pagination = paginationArg;

      pagingController.value.addPageRequestListener((pageKey) async {
        fetchPage(pageKey);
      });
    }
  }
}