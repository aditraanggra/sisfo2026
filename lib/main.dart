import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth/custom_auth/auth_util.dart';
import 'auth/custom_auth/custom_auth_user_provider.dart';

import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  // Load environment variables
  await dotenv.load(fileName: '.env');

  await SupaFlow.initialize();

  await FlutterFlowTheme.initialize();

  await authManager.initialize();

  ApiManager.onUnauthenticatedResponse = () => authManager.signOut();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<SisfoAuthUser> userStream;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = sisfoAuthUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });

    Future.delayed(
      Duration(milliseconds: isWeb ? 0 : 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SISFO',
      scrollBehavior: MyAppScrollBehavior(),
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('id'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({
    Key? key,
    this.initialPage,
    this.page,
    this.disableResizeToAvoidBottomInset = false,
  }) : super(key: key);

  final String? initialPage;
  final Widget? page;
  final bool disableResizeToAvoidBottomInset;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home': HomeWidget(),
      'Laporan': LaporanWidget(),
      'HistoriTransaksi': HistoriTransaksiWidget(),
      'ProfileResponsive': ProfileResponsiveWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          desktop: false,
        ),
        // Requirements: 8.1, 8.2, 8.3, 8.4, 8.5, 8.6
        // Modern bottom navigation with subtle top shadow and safe area padding
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // Requirements: 8.1 - Subtle top shadow
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          // Requirements: 8.6 - Safe area padding for devices with home indicator
          child: SafeArea(
            top: false,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (i) => safeSetState(() {
                _currentPage = null;
                _currentPageName = tabs.keys.toList()[i];
              }),
              // Requirements: 8.1 - White background
              backgroundColor: Colors.white,
              elevation: 0, // Remove default elevation, using custom shadow
              // Requirements: 8.4 - Primary dark color for active state
              selectedItemColor: ModernColors.primaryDark,
              // Requirements: 8.3 - Secondary text color for inactive state
              unselectedItemColor: ModernColors.textSecondary,
              // Requirements: 8.5 - Text labels below icons
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  // Requirements: 8.3, 8.4 - Outlined icons for inactive, filled for active
                  icon: FaIcon(
                    FontAwesomeIcons.house,
                    size: 20.0,
                  ),
                  activeIcon: FaIcon(
                    FontAwesomeIcons.house,
                    size: 20.0,
                  ),
                  label: 'Beranda',
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FFIcons.kchartPie,
                    size: 20.0,
                  ),
                  activeIcon: Icon(
                    FFIcons.kchartPie,
                    size: 20.0,
                  ),
                  label: 'Laporan',
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.view_list_outlined,
                    size: 22.0,
                  ),
                  activeIcon: Icon(
                    Icons.view_list_rounded,
                    size: 22.0,
                  ),
                  label: 'Transaksi',
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_rounded,
                    size: 24.0,
                  ),
                  activeIcon: Icon(
                    Icons.person_rounded,
                    size: 24.0,
                  ),
                  label: 'Profil',
                  tooltip: '',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
