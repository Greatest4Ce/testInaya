// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    required String itemId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            itemId: itemId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return DetailsPage(
        itemId: args.itemId,
        key: args.key,
      );
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    required this.itemId,
    this.key,
  });

  final String itemId;

  final Key? key;

  @override
  String toString() {
    return 'DetailsRouteArgs{itemId: $itemId, key: $key}';
  }
}

/// generated route for
/// [MyHomePage]
class MyHomeRoute extends PageRouteInfo<void> {
  const MyHomeRoute({List<PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyHomePage();
    },
  );
}
