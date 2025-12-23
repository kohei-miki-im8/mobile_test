import 'package:flutter/material.dart';

class InfiniteScrollList<T> extends StatefulWidget {
  const InfiniteScrollList({
    required this.initialItems,
    required this.nextCursorId,
    required this.scrollDirection,
    required this.fetchMoreData,
    required this.itemBuilder,
    required this.loadingBuilder,
    required this.errorBuilder,
    this.enablePullToRefresh = false,
    this.reverse = false,
    this.padding,
    this.separatorBuilder,
    this.loadThreshold = 0.7,
    this.controller,
    super.key,
  });

  final List<T> initialItems;
  final String? nextCursorId;
  final Axis scrollDirection;
  final Future<void> Function(String? cursorId) fetchMoreData;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget Function(BuildContext context) loadingBuilder;
  final Widget Function(BuildContext context, Object error, VoidCallback onRetry) errorBuilder;
  final bool enablePullToRefresh;
  final bool reverse;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final double loadThreshold;
  final ScrollController? controller;

  @override
  State<InfiniteScrollList<T>> createState() => _InfiniteScrollListState<T>();
}

class _InfiniteScrollListState<T> extends State<InfiniteScrollList<T>> {
  late ScrollController _scrollController;
  bool _ownsController = false;
  late List<T> _items;
  String? _nextCursorId;
  bool _isLoading = false;
  bool _hasReachedEnd = false;
  Object? _error;
  String? _lastFetchedCursorId;
  bool _requestedTopRefresh = false;

  @override
  void initState() {
    super.initState();
    _items = List<T>.from(widget.initialItems);
    _nextCursorId = widget.nextCursorId;
    _hasReachedEnd = _nextCursorId == null;
    // setup controller
    if (widget.controller != null) {
      _scrollController = widget.controller!;
      _ownsController = false;
    } else {
      _scrollController = ScrollController();
      _ownsController = true;
    }
    _scrollController.addListener(_onScroll);

    if (!_hasReachedEnd) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (_scrollController.hasClients && _scrollController.position.maxScrollExtent <= 0) {
          _loadMoreData();
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant InfiniteScrollList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!mounted) return;

    if (widget.initialItems != oldWidget.initialItems) {
      setState(() {
        _items = List<T>.from(widget.initialItems);
      });
    }
    if (widget.nextCursorId != oldWidget.nextCursorId) {
      setState(() {
        _nextCursorId = widget.nextCursorId;
        _hasReachedEnd = _nextCursorId == null || _nextCursorId!.isEmpty;
        // 次のカーソルが更新されたら、同一カーソルの二重リクエスト防止フラグをリセット
        _requestedTopRefresh = false;
      });
    }

    // Controller changed
    if (oldWidget.controller != widget.controller) {
      _scrollController.removeListener(_onScroll);
      if (_ownsController) {
        _scrollController.dispose();
      }
      if (widget.controller != null) {
        _scrollController = widget.controller!;
        _ownsController = false;
      } else {
        _scrollController = ScrollController();
        _ownsController = true;
      }
      _scrollController.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    if (_ownsController) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  Future<void> _loadMoreData() async {
    if (_isLoading || _hasReachedEnd) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    final usedCursorId = _nextCursorId;

    try {
      // 同一カーソルでの二重リクエストを防止
      if (_nextCursorId == null) {
        if (_requestedTopRefresh) {
          if (mounted) {
            setState(() => _isLoading = false);
          }
          return;
        }
      } else {
        if (_lastFetchedCursorId == usedCursorId) {
          if (mounted) {
            setState(() => _isLoading = false);
          }
          return;
        }
      }

      await widget.fetchMoreData(_nextCursorId);

      if (mounted) {
        setState(() {
          if(usedCursorId == null) {
            _requestedTopRefresh = true;
          } else {
            _lastFetchedCursorId = usedCursorId;
          }
          _isLoading = false;
        });
      }
    } on Exception catch (e) {
      if (mounted) {
        setState(() {
          _error = e;
          _isLoading = false;
          if(usedCursorId == null) {
            _requestedTopRefresh = false;
          }
        });
      }
    }
  }

  void _onScroll() {
    if (_hasReachedEnd || !_scrollController.hasClients) return;

    final threshold = widget.loadThreshold * _scrollController.position.maxScrollExtent;
    if (_scrollController.position.pixels > threshold) {
      _loadMoreData();
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _isLoading = true;
      _error = null;
      _nextCursorId = null;
      _hasReachedEnd = false;
    });
    await widget.fetchMoreData(null);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null && _items.isEmpty) {
      return widget.errorBuilder(context, _error!, _refresh);
    }

    final listView = ListView.separated(
      controller: _scrollController,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      padding: widget.padding,
      itemCount: _items.length + ((_isLoading || _error != null) ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _items.length) {
          if (_error != null) {
            return widget.errorBuilder(context, _error!, _loadMoreData);
          }
          return widget.loadingBuilder(context);
        }
        return widget.itemBuilder(context, _items[index], index);
      },
      separatorBuilder: widget.separatorBuilder ?? (context, index) => const SizedBox.shrink(),
    );

    if (widget.enablePullToRefresh && widget.scrollDirection == Axis.vertical) {
      return RefreshIndicator(
        onRefresh: _refresh,
        color: const Color(0xFFD097DB),
        backgroundColor: Colors.white,
        strokeWidth: 3,
        child: listView,
      );
    }

    return listView;
  }
}
