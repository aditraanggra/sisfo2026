import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  SisfoAuthUser? initialUser;
  SisfoAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(SisfoAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: RegisterWidget.routeName,
          path: RegisterWidget.routePath,
          builder: (context, params) => RegisterWidget(),
        ),
        FFRoute(
          name: LengkapiProfileWidget.routeName,
          path: LengkapiProfileWidget.routePath,
          builder: (context, params) => LengkapiProfileWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Home')
              : HomeWidget(
                  userName: params.getParam(
                    'userName',
                    ParamType.String,
                  ),
                ),
        ),
        FFRoute(
          name: ProfileResponsiveWidget.routeName,
          path: ProfileResponsiveWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ProfileResponsive')
              : ProfileResponsiveWidget(),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(
            namaOperator: params.getParam(
              'namaOperator',
              ParamType.String,
            ),
            noTelp: params.getParam(
              'noTelp',
              ParamType.String,
            ),
            fotoProfil: params.getParam(
              'fotoProfil',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: KalkulatorZakatWidget.routeName,
          path: KalkulatorZakatWidget.routePath,
          builder: (context, params) => KalkulatorZakatWidget(),
        ),
        FFRoute(
          name: ZakatFitrahWidget.routeName,
          path: ZakatFitrahWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ZakatFitrahWidget(),
        ),
        FFRoute(
          name: ZakatMalWidget.routeName,
          path: ZakatMalWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ZakatMalWidget(),
        ),
        FFRoute(
          name: InfakWidget.routeName,
          path: InfakWidget.routePath,
          requireAuth: true,
          builder: (context, params) => InfakWidget(
            tglTransaksi: params.getParam(
              'tglTransaksi',
              ParamType.DateTime,
            ),
            namaMuzakki: params.getParam(
              'namaMuzakki',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: KotakAmalWidget.routeName,
          path: KotakAmalWidget.routePath,
          requireAuth: true,
          builder: (context, params) => KotakAmalWidget(
            namaUpz: params.getParam(
              'namaUpz',
              ParamType.String,
            ),
            alamatUpz: params.getParam(
              'alamatUpz',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HistoriTransaksiWidget.routeName,
          path: HistoriTransaksiWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HistoriTransaksi')
              : HistoriTransaksiWidget(),
        ),
        FFRoute(
          name: DetailsTransaksiWidget.routeName,
          path: DetailsTransaksiWidget.routePath,
          builder: (context, params) => DetailsTransaksiWidget(
            tglTransaksi: params.getParam(
              'tglTransaksi',
              ParamType.DateTime,
            ),
            namaMuzakki: params.getParam(
              'namaMuzakki',
              ParamType.String,
            ),
            jmlMuzakki: params.getParam(
              'jmlMuzakki',
              ParamType.int,
            ),
            jmlBeras: params.getParam(
              'jmlBeras',
              ParamType.double,
            ),
            hargaBeras: params.getParam(
              'hargaBeras',
              ParamType.int,
            ),
            jmlUang: params.getParam(
              'jmlUang',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ProfilUPZWidget.routeName,
          path: ProfilUPZWidget.routePath,
          builder: (context, params) => ProfilUPZWidget(
            katUpz: params.getParam(
              'katUpz',
              ParamType.String,
            ),
            namaUpz: params.getParam(
              'namaUpz',
              ParamType.String,
            ),
            alamatUpz: params.getParam(
              'alamatUpz',
              ParamType.String,
            ),
            registerUpz: params.getParam(
              'registerUpz',
              ParamType.String,
            ),
            ketua: params.getParam(
              'ketua',
              ParamType.String,
            ),
            sekretaris: params.getParam(
              'sekretaris',
              ParamType.String,
            ),
            bendahara: params.getParam(
              'bendahara',
              ParamType.String,
            ),
            desa: params.getParam(
              'desa',
              ParamType.String,
            ),
            kecamatan: params.getParam(
              'kecamatan',
              ParamType.String,
            ),
            operator: params.getParam(
              'operator',
              ParamType.String,
            ),
            noSk: params.getParam(
              'noSk',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: QurbanWidget.routeName,
          path: QurbanWidget.routePath,
          requireAuth: true,
          builder: (context, params) => QurbanWidget(),
        ),
        FFRoute(
          name: FidyahWidget.routeName,
          path: FidyahWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FidyahWidget(),
        ),
        FFRoute(
          name: PendistribusianWidget.routeName,
          path: PendistribusianWidget.routePath,
          builder: (context, params) => PendistribusianWidget(
            sisaDanaZf: params.getParam(
              'sisaDanaZf',
              ParamType.int,
            ),
            sisaDanaZm: params.getParam(
              'sisaDanaZm',
              ParamType.int,
            ),
            sisaDanaIfs: params.getParam(
              'sisaDanaIfs',
              ParamType.int,
            ),
            sisaBerasZf: params.getParam(
              'sisaBerasZf',
              ParamType.double,
            ),
            sisaUangZf: params.getParam(
              'sisaUangZf',
              ParamType.int,
            ),
            sisaSaldoAmil: params.getParam(
              'sisaSaldoAmil',
              ParamType.int,
            ),
            sisaAmilZfBeras: params.getParam(
              'sisaAmilZfBeras',
              ParamType.double,
            ),
            sisaAmilZfUang: params.getParam(
              'sisaAmilZfUang',
              ParamType.int,
            ),
            sisaAmilZm: params.getParam(
              'sisaAmilZm',
              ParamType.int,
            ),
            sisaAmilIfs: params.getParam(
              'sisaAmilIfs',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: SettingZFWidget.routeName,
          path: SettingZFWidget.routePath,
          builder: (context, params) => SettingZFWidget(
            hargaBeras: params.getParam(
              'hargaBeras',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: SetorZisWidget.routeName,
          path: SetorZisWidget.routePath,
          builder: (context, params) => SetorZisWidget(),
        ),
        FFRoute(
          name: ListDkmWidget.routeName,
          path: ListDkmWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ListDkmWidget(),
        ),
        FFRoute(
          name: LaporanWidget.routeName,
          path: LaporanWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Laporan')
              : LaporanWidget(),
        ),
        FFRoute(
          name: PenyerapanHakAmilWidget.routeName,
          path: PenyerapanHakAmilWidget.routePath,
          builder: (context, params) => PenyerapanHakAmilWidget(
            sisaSaldoAmil: params.getParam(
              'sisaSaldoAmil',
              ParamType.int,
            ),
            sisaAmilZfBeras: params.getParam(
              'sisaAmilZfBeras',
              ParamType.double,
            ),
            sisaAmilZfUang: params.getParam(
              'sisaAmilZfUang',
              ParamType.int,
            ),
            sisaAmilZm: params.getParam(
              'sisaAmilZm',
              ParamType.int,
            ),
            sisaAmilIfs: params.getParam(
              'sisaAmilIfs',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: RegistrationTypeWidget.routeName,
          path: RegistrationTypeWidget.routePath,
          builder: (context, params) => RegistrationTypeWidget(),
        ),
        FFRoute(
          name: LengkapiProfileSDWidget.routeName,
          path: LengkapiProfileSDWidget.routePath,
          builder: (context, params) => LengkapiProfileSDWidget(),
        ),
        FFRoute(
          name: ProfilUPZCopyWidget.routeName,
          path: ProfilUPZCopyWidget.routePath,
          builder: (context, params) => ProfilUPZCopyWidget(
            katUpz: params.getParam(
              'katUpz',
              ParamType.String,
            ),
            namaUpz: params.getParam(
              'namaUpz',
              ParamType.String,
            ),
            alamatUpz: params.getParam(
              'alamatUpz',
              ParamType.String,
            ),
            registerUpz: params.getParam(
              'registerUpz',
              ParamType.String,
            ),
            ketua: params.getParam(
              'ketua',
              ParamType.String,
            ),
            sekretaris: params.getParam(
              'sekretaris',
              ParamType.String,
            ),
            bendahara: params.getParam(
              'bendahara',
              ParamType.String,
            ),
            skUpz: params.getParam(
              'skUpz',
              ParamType.String,
            ),
            desa: params.getParam(
              'desa',
              ParamType.String,
            ),
            kecamatan: params.getParam(
              'kecamatan',
              ParamType.String,
            ),
            operator: params.getParam(
              'operator',
              ParamType.String,
            ),
            noSk: params.getParam(
              'noSk',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RegulasiPageWidget.routeName,
          path: RegulasiPageWidget.routePath,
          builder: (context, params) => RegulasiPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/images/splash.gif',
                        fit: BoxFit.scaleDown,
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
