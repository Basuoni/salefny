import 'package:salefny/app/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class CustomPagination<Model> extends StatelessWidget {
  const CustomPagination({
    super.key,
    this.limit = Constants.limitPagination4,
    this.firstPageKey = 1,
    this.pullToRefresh = true,
    this.enableInfiniteScroll = true,
    this.loadingScrollDirection = Axis.vertical,
    this.invisibleItemsThreshold,
    this.noMoreItemsIndicatorBuilder,
    this.noItemsFoundIndicatorBuilder,
    this.newPageErrorIndicatorBuilder,
    this.firstPageErrorIndicatorBuilder,
    this.newPageProgressIndicatorBuilder,
    this.firstPageProgressIndicatorBuilder,
    required this.provider,
    required this.itemBuilder,
    this.pagedBuilder,
    required this.loadingBuilder,
  });

  final InfiniteScrollProvider<int, Model> provider;
  final Widget Function(BuildContext, Model, int) itemBuilder;
  final Widget Function(BuildContext, PagingController<dynamic, dynamic>)
      loadingBuilder;
  final Axis loadingScrollDirection;

  final int firstPageKey;
  final int limit;
  final bool pullToRefresh;
  final bool enableInfiniteScroll;
  final int? invisibleItemsThreshold;
  final PagedBuilder<int, Model>? pagedBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      firstPageErrorIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      firstPageProgressIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      noItemsFoundIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      newPageErrorIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      newPageProgressIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      noMoreItemsIndicatorBuilder;

  @override
  Widget build(BuildContext context) {
    return RiverPagedBuilder<int, Model>(
      firstPageKey: firstPageKey,
      pullToRefresh: pullToRefresh,
      provider: provider,
      limit: limit,
      pagedBuilder: pagedBuilder ??
          (controller, builder) => PagedListView(
                builderDelegate: builder,
                pagingController: controller,
              ),
      itemBuilder: itemBuilder,
      firstPageProgressIndicatorBuilder: loadingBuilder,
      newPageProgressIndicatorBuilder: newPageProgressIndicatorBuilder ??
          (context, controller) {
            return const SizedBox(
              width: double.infinity,
              height: 50,
              child: CupertinoActivityIndicator(),
              // Lottie.asset(AssetsManger.loadingMorPaginationItemPath),
            );
          },
      enableInfiniteScroll: enableInfiniteScroll,
      firstPageErrorIndicatorBuilder: firstPageErrorIndicatorBuilder,
      invisibleItemsThreshold: invisibleItemsThreshold,
      newPageErrorIndicatorBuilder: newPageErrorIndicatorBuilder,
      noItemsFoundIndicatorBuilder: noItemsFoundIndicatorBuilder,
      noMoreItemsIndicatorBuilder: noMoreItemsIndicatorBuilder,
    );
  }
}
