import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_responsive_model.dart';
export 'profile_responsive_model.dart';

class ProfileResponsiveWidget extends StatefulWidget {
  const ProfileResponsiveWidget({super.key});

  static String routeName = 'ProfileResponsive';
  static String routePath = '/profileResponsive';

  @override
  State<ProfileResponsiveWidget> createState() =>
      _ProfileResponsiveWidgetState();
}

class _ProfileResponsiveWidgetState extends State<ProfileResponsiveWidget> {
  late ProfileResponsiveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileResponsiveModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Header Profile Section
              _buildProfileHeader(),

              SizedBox(height: 24.0),

              // Menu Sections
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Informasi UPZ Section
                    _buildSectionTitle('Informasi UPZ'),
                    SizedBox(height: 12.0),
                    _buildMenuItem(
                      icon: Icons.grid_view_rounded,
                      iconColor: Color(0xFF259148),
                      title: 'Profil UPZ',
                      subtitle: 'Informasi lengkap UPZ',
                      onTap: () {
                        context.pushNamed(ProfilUPZWidget.routeName);
                      },
                    ),
                    SizedBox(height: 12.0),
                    _buildMenuItem(
                      icon: Icons.people_outline_rounded,
                      iconColor: Color(0xFF259148),
                      title: 'Pengurus',
                      subtitle: 'Daftar pengurus UPZ',
                      onTap: () {
                        context.pushNamed(ListDkmWidget.routeName);
                      },
                    ),

                    SizedBox(height: 24.0),

                    // Pengaturan Section
                    _buildSectionTitle('Pengaturan'),
                    SizedBox(height: 12.0),
                    _buildMenuItem(
                      icon: Icons.person_outline_rounded,
                      iconColor: Color(0xFF259148),
                      title: 'Akun Saya',
                      subtitle: 'Ubah informasi akun',
                      onTap: () {
                        context.pushNamed(EditProfileWidget.routeName);
                      },
                    ),
                    SizedBox(height: 12.0),
                    _buildMenuItem(
                      icon: Icons.lock_outline_rounded,
                      iconColor: Color(0xFF259148),
                      title: 'Ubah Password',
                      subtitle: 'Ganti password akun',
                      onTap: () {
                        // Handle change password
                      },
                    ),
                    SizedBox(height: 12.0),
                    _buildMenuItem(
                      icon: Icons.calendar_today_rounded,
                      iconColor: Color(0xFF259148),
                      title: 'Tahun Pengelolaan ZIS',
                      subtitle: 'Atur tahun data ZIS',
                      onTap: () {
                        context.pushNamed(TahunPengelolaanWidget.routeName);
                      },
                    ),
                    SizedBox(height: 12.0),
                    _buildMenuItem(
                      icon: Icons.notifications_outlined,
                      iconColor: Color(0xFF259148),
                      title: 'Notifikasi',
                      subtitle: 'Pengaturan notifikasi',
                      onTap: () {
                        // Handle notifications
                      },
                    ),

                    SizedBox(height: 24.0),

                    // Bantuan Section
                    _buildSectionTitle('Bantuan'),
                    SizedBox(height: 12.0),
                    _buildMenuItem(
                      icon: Icons.help_outline_rounded,
                      iconColor: Color(0xFF259148),
                      title: 'Panduan Aplikasi',
                      subtitle: 'Cara menggunakan aplikasi',
                      onTap: () {
                        // Handle app guide
                      },
                    ),
                    SizedBox(height: 12.0),
                    _buildMenuItem(
                      icon: Icons.info_outline_rounded,
                      iconColor: Color(0xFF259148),
                      title: 'Tentang Aplikasi',
                      subtitle: 'Versi 1.0.0',
                      onTap: () {
                        // Handle about app
                      },
                    ),

                    SizedBox(height: 32.0),

                    // Logout Button
                    _buildLogoutButton(),

                    SizedBox(height: 32.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A3C34), Color(0xFF259148)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _getInitials(currentUserData?.name ?? 'U'),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          // Name and Role
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentUserData?.name ?? 'User',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.0),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    'Admin UPZ',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        color: Color(0xFF1A1A1A),
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Color(0xFFE5E7EB),
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            // Icon Container
            Container(
              width: 44.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 22.0,
              ),
            ),
            SizedBox(width: 16.0),
            // Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      color: Color(0xFF1A1A1A),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      color: Color(0xFF9CA3AF),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Arrow
            Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF9CA3AF),
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return InkWell(
      onTap: () async {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();
        context.goNamedAuth(LoginWidget.routeName, context.mounted);
      },
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: Color(0xFFFEE2E2),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout_rounded,
              color: Color(0xFFEF4444),
              size: 20.0,
            ),
            SizedBox(width: 8.0),
            Text(
              'Keluar',
              style: GoogleFonts.inter(
                color: Color(0xFFEF4444),
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return 'U';
    List<String> parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }
}
