import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/component/enhanced_empty_state/enhanced_empty_state_widget.dart';
import '/component/skeleton_loader/skeleton_loader_widget.dart';
import '/component/modern_transaction_item/modern_transaction_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import '/index.dart';
import '/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'histori_transaksi_model.dart';
export 'histori_transaksi_model.dart';

class HistoriTransaksiWidget extends StatefulWidget {
  const HistoriTransaksiWidget({super.key});

  static String routeName = 'HistoriTransaksi';
  static String routePath = '/historiTransaksi';

  @override
  State<HistoriTransaksiWidget> createState() => _HistoriTransaksiWidgetState();
}

class _HistoriTransaksiWidgetState extends State<HistoriTransaksiWidget>
    with TickerProviderStateMixin {
  late HistoriTransaksiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoriTransaksiModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ModernColors
            .backgroundPrimary, // Updated to off-white (#F5F7F5) - Req 6.6
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor:
                    ModernColors.primaryDark, // Updated to dark green (#1A3C34)
                automaticallyImplyLeading: false,
                title: Text(
                  'Histori Transaksi',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        isScrollable: true,
                        labelColor: ModernColors.primaryDark,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.notoSans(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        unselectedLabelStyle: TextStyle(),
                        indicatorColor: ModernColors.primaryDark,
                        indicatorWeight: 4.0,
                        padding: EdgeInsets.all(4.0),
                        tabs: [
                          Tab(
                            text: 'Zakat Fitrah',
                            icon: Icon(
                              Icons.brightness_4_rounded,
                              color: ModernColors.primaryAccent,
                              size: 20.0,
                            ),
                          ),
                          Tab(
                            text: 'Infak Sedekah',
                            icon: Icon(
                              Icons.account_balance_wallet_rounded,
                              color: ModernColors.primaryAccent,
                              size: 24.0,
                            ),
                          ),
                          Tab(
                            text: 'Zakat Mal',
                            icon: Icon(
                              Icons.work_outlined,
                              color: ModernColors.primaryAccent,
                              size: 24.0,
                            ),
                          ),
                          Tab(
                            text: 'Kotak Amal',
                            icon: Icon(
                              Icons.mosque_rounded,
                              color: ModernColors.primaryAccent,
                              size: 24.0,
                            ),
                          ),
                          Tab(
                            text: 'Pendistribusian',
                            icon: Icon(
                              Icons.local_florist_rounded,
                              color: ModernColors.primaryAccent,
                              size: 28.0,
                            ),
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {}
                          ][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: AuthEndPointGroup.getZakatFitrahCall.call(
                                token: currentAuthenticationToken,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return SkeletonLoaderWidget(
                                    type: SkeletonType.listItem,
                                    itemCount: 5,
                                  );
                                }
                                final listViewZfGetZakatFitrahResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final listZakatFitrah =
                                        AuthEndPointGroup.getZakatFitrahCall
                                                .dataListZf(
                                                  listViewZfGetZakatFitrahResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                    if (listZakatFitrah.isEmpty) {
                                      return EnhancedEmptyStateWidget(
                                        title:
                                            'Belum Ada Transaksi Zakat Fitrah',
                                        description:
                                            'Anda belum memiliki transaksi zakat fitrah. Mulai catat transaksi zakat fitrah dari muzakki.',
                                        icon: Icons.brightness_4_rounded,
                                        iconColor: ModernColors.primaryAccent,
                                        actionButtonText: 'Tambah Zakat Fitrah',
                                        onActionPressed: () {
                                          context.pushNamed(
                                              ZakatFitrahWidget.routeName);
                                        },
                                        tips: [
                                          'Zakat fitrah wajib dikeluarkan sebelum shalat Idul Fitri',
                                          'Besaran zakat fitrah adalah 2.5 kg atau 3.5 liter beras per jiwa',
                                          'Dapat dibayarkan dalam bentuk beras atau uang senilai beras',
                                        ],
                                      );
                                    }

                                    return ListView.builder(
                                      padding: EdgeInsets.all(ModernSpacing.sm),
                                      scrollDirection: Axis.vertical,
                                      itemCount: listZakatFitrah.length,
                                      itemBuilder:
                                          (context, listZakatFitrahIndex) {
                                        final listZakatFitrahItem =
                                            listZakatFitrah[
                                                listZakatFitrahIndex];
                                        final zfData =
                                            DataZfStruct.maybeFromMap(
                                                listZakatFitrahItem);
                                        final amount = zfData?.zfRice != null &&
                                                zfData!.zfRice > 0.0
                                            ? zfData.zfRice.toInt()
                                            : zfData?.zfAmount ?? 0;
                                        final isRice = zfData?.zfRice != null &&
                                            zfData!.zfRice > 0.0;

                                        return Padding(
                                          padding: EdgeInsets.only(
                                              bottom: ModernSpacing.sm),
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.5,
                                              children: [
                                                SlidableAction(
                                                  label: 'Hapus',
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                  icon: Icons
                                                      .delete_sweep_outlined,
                                                  onPressed: (_) async {
                                                    // Show confirmation dialog BEFORE API call using DialogService
                                                    var confirmDialogResponse =
                                                        await DialogService
                                                            .showDeleteConfirmation(
                                                      context: context,
                                                      itemName:
                                                          'Transaksi Zakat Fitrah',
                                                      itemId: DataZfStruct
                                                              .maybeFromMap(
                                                                  listZakatFitrahItem)
                                                          ?.id
                                                          .toString(),
                                                    );

                                                    // Only call delete API if user confirmed
                                                    if (confirmDialogResponse) {
                                                      _model.apiResultads =
                                                          await AuthEndPointGroup
                                                              .deleteZakatFitrahCall
                                                              .call(
                                                        token:
                                                            currentAuthenticationToken,
                                                        id: DataZfStruct
                                                                .maybeFromMap(
                                                                    listZakatFitrahItem)
                                                            ?.id,
                                                      );

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Data transaksi ${DataZfStruct.maybeFromMap(listZakatFitrahItem)?.id.toString()} berhasil dihapus',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );

                                                      safeSetState(() {});
                                                    }
                                                  },
                                                ),
                                                SlidableAction(
                                                  label: 'Edit',
                                                  backgroundColor:
                                                      Color(0xFF3311D2),
                                                  icon: Icons.edit_rounded,
                                                  onPressed: (_) async {
                                                    context.pushNamed(
                                                      ZakatFitrahWidget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .bottomToTop,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: _buildModernTransactionItem(
                                              context: context,
                                              title: 'Zakat Fitrah',
                                              subtitle:
                                                  '${zfData?.muzakkiName ?? ''} - #${zfData?.id ?? 0}',
                                              amount: amount,
                                              dateString: zfData?.trxDate ?? '',
                                              type: TransactionType.income,
                                              iconData:
                                                  Icons.brightness_4_rounded,
                                              isRice: isRice,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 8.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: TransactionEndPointGroup
                                        .getSedekahCall
                                        .call(
                                      token: currentAuthenticationToken,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return SkeletonLoaderWidget(
                                          type: SkeletonType.listItem,
                                          itemCount: 5,
                                        );
                                      }
                                      final listViewIfsGetSedekahResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final listTrxInfak =
                                              TransactionEndPointGroup
                                                      .getSedekahCall
                                                      .dataTrxInfak(
                                                        listViewIfsGetSedekahResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [];
                                          if (listTrxInfak.isEmpty) {
                                            return EnhancedEmptyStateWidget(
                                              title:
                                                  'Belum Ada Transaksi Infak/Sedekah',
                                              description:
                                                  'Anda belum memiliki transaksi infak atau sedekah. Mulai catat transaksi infak dari munfiq.',
                                              icon: Icons
                                                  .account_balance_wallet_rounded,
                                              iconColor:
                                                  ModernColors.primaryAccent,
                                              actionButtonText:
                                                  'Tambah Infak/Sedekah',
                                              onActionPressed: () {
                                                context.pushNamed(
                                                    InfakWidget.routeName);
                                              },
                                              tips: [
                                                'Infak adalah pengeluaran harta di jalan Allah tanpa batasan jumlah',
                                                'Sedekah dapat berupa harta maupun non-harta (senyum, tenaga, dll)',
                                                'Infak dan sedekah dapat diberikan kapan saja sepanjang tahun',
                                              ],
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.all(
                                                ModernSpacing.sm),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listTrxInfak.length,
                                            itemBuilder:
                                                (context, listTrxInfakIndex) {
                                              final listTrxInfakItem =
                                                  listTrxInfak[
                                                      listTrxInfakIndex];
                                              final ifsData =
                                                  DataIfsStruct.maybeFromMap(
                                                      listTrxInfakItem);

                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: ModernSpacing.sm),
                                                child: Slidable(
                                                  endActionPane: ActionPane(
                                                    motion:
                                                        const ScrollMotion(),
                                                    extentRatio: 0.5,
                                                    children: [
                                                      SlidableAction(
                                                        label: 'Hapus',
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        icon: Icons
                                                            .delete_sweep_outlined,
                                                        onPressed: (_) async {
                                                          // Show confirmation dialog BEFORE API call using DialogService
                                                          var confirmDialogResponse =
                                                              await DialogService
                                                                  .showDeleteConfirmation(
                                                            context: context,
                                                            itemName:
                                                                'Transaksi Infak/Sedekah',
                                                            itemId: DataIfsStruct
                                                                    .maybeFromMap(
                                                                        listTrxInfakItem)
                                                                ?.id
                                                                .toString(),
                                                          );

                                                          // Only call delete API if user confirmed
                                                          if (confirmDialogResponse) {
                                                            _model.apiResultadsCopy2 =
                                                                await TransactionEndPointGroup
                                                                    .deleteSedekahCall
                                                                    .call(
                                                              token:
                                                                  currentAuthenticationToken,
                                                              id: DataIfsStruct
                                                                      .maybeFromMap(
                                                                          listTrxInfakItem)
                                                                  ?.id,
                                                            );

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Data transaksi ${DataIfsStruct.maybeFromMap(listTrxInfakItem)?.id.toString()} berhasil dihapus',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                              ),
                                                            );

                                                            safeSetState(() {});
                                                          }
                                                        },
                                                      ),
                                                      SlidableAction(
                                                        label: 'Edit',
                                                        backgroundColor:
                                                            Color(0xFF3311D2),
                                                        icon: Icons.edit,
                                                        onPressed: (_) {
                                                          print(
                                                              'SlidableActionWidget pressed ...');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  child:
                                                      _buildModernTransactionItem(
                                                    context: context,
                                                    title: 'Infak/Sedekah',
                                                    subtitle:
                                                        '${ifsData?.munfiqName ?? ''} - #${ifsData?.id ?? 0}',
                                                    amount:
                                                        ifsData?.amount ?? 0,
                                                    dateString:
                                                        ifsData?.trxDate ?? '',
                                                    type:
                                                        TransactionType.income,
                                                    iconData: Icons
                                                        .account_balance_wallet_rounded,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 8.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: TransactionEndPointGroup
                                        .getZakatMaalCall
                                        .call(
                                      token: currentAuthenticationToken,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return SkeletonLoaderWidget(
                                          type: SkeletonType.listItem,
                                          itemCount: 5,
                                        );
                                      }
                                      final listViewZmGetZakatMaalResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final listTrxZm =
                                              TransactionEndPointGroup
                                                      .getZakatMaalCall
                                                      .dataTrxZakatMal(
                                                        listViewZmGetZakatMaalResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [];
                                          if (listTrxZm.isEmpty) {
                                            return EnhancedEmptyStateWidget(
                                              title:
                                                  'Belum Ada Transaksi Zakat Mal',
                                              description:
                                                  'Anda belum memiliki transaksi zakat mal. Mulai catat transaksi zakat mal dari muzakki.',
                                              icon: Icons.work_outlined,
                                              iconColor:
                                                  ModernColors.primaryAccent,
                                              actionButtonText:
                                                  'Tambah Zakat Mal',
                                              onActionPressed: () {
                                                context.pushNamed(
                                                    ZakatMalWidget.routeName);
                                              },
                                              tips: [
                                                'Zakat mal wajib jika harta mencapai nisab dan haul (1 tahun)',
                                                'Nisab zakat mal setara dengan 85 gram emas',
                                                'Besaran zakat mal adalah 2.5% dari total harta',
                                              ],
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.all(
                                                ModernSpacing.sm),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listTrxZm.length,
                                            itemBuilder:
                                                (context, listTrxZmIndex) {
                                              final listTrxZmItem =
                                                  listTrxZm[listTrxZmIndex];
                                              final zmData =
                                                  DataZmStruct.maybeFromMap(
                                                      listTrxZmItem);

                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: ModernSpacing.sm),
                                                child: Slidable(
                                                  endActionPane: ActionPane(
                                                    motion:
                                                        const ScrollMotion(),
                                                    extentRatio: 0.5,
                                                    children: [
                                                      SlidableAction(
                                                        label: 'Hapus',
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        icon: Icons
                                                            .delete_sweep_outlined,
                                                        onPressed: (_) async {
                                                          // Show confirmation dialog BEFORE API call using DialogService
                                                          var confirmDialogResponse =
                                                              await DialogService
                                                                  .showDeleteConfirmation(
                                                            context: context,
                                                            itemName:
                                                                'Transaksi Zakat Mal',
                                                            itemId: DataZmStruct
                                                                    .maybeFromMap(
                                                                        listTrxZmItem)
                                                                ?.id
                                                                .toString(),
                                                          );

                                                          // Only call delete API if user confirmed
                                                          if (confirmDialogResponse) {
                                                            _model.apiResultadsCopy =
                                                                await TransactionEndPointGroup
                                                                    .deleteZakatMalCall
                                                                    .call(
                                                              token:
                                                                  currentAuthenticationToken,
                                                              id: DataZmStruct
                                                                      .maybeFromMap(
                                                                          listTrxZmItem)
                                                                  ?.id,
                                                            );

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Data transaksi ${DataZmStruct.maybeFromMap(listTrxZmItem)?.id.toString()} berhasil dihapus',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                              ),
                                                            );

                                                            safeSetState(() {});
                                                          }
                                                        },
                                                      ),
                                                      SlidableAction(
                                                        label: 'Edit',
                                                        backgroundColor:
                                                            Color(0xFF3311D2),
                                                        icon: Icons.edit,
                                                        onPressed: (_) {
                                                          print(
                                                              'SlidableActionWidget pressed ...');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  child:
                                                      _buildModernTransactionItem(
                                                    context: context,
                                                    title:
                                                        'Zakat Mal - ${zmData?.categoryMaal ?? ''}',
                                                    subtitle:
                                                        '${zmData?.muzakkiName ?? ''} - #${zmData?.id ?? 0}',
                                                    amount: zmData?.amount ?? 0,
                                                    dateString:
                                                        zmData?.trxDate ?? '',
                                                    type:
                                                        TransactionType.income,
                                                    iconData:
                                                        Icons.work_outlined,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 8.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: TransactionEndPointGroup
                                        .getKotakAmalCall
                                        .call(
                                      token: currentAuthenticationToken,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return SkeletonLoaderWidget(
                                          type: SkeletonType.listItem,
                                          itemCount: 5,
                                        );
                                      }
                                      final listViewKaGetKotakAmalResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final listTrxKomal =
                                              TransactionEndPointGroup
                                                      .getKotakAmalCall
                                                      .dataListKomal(
                                                        listViewKaGetKotakAmalResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [];
                                          if (listTrxKomal.isEmpty) {
                                            return EnhancedEmptyStateWidget(
                                              title:
                                                  'Belum Ada Transaksi Kotak Amal',
                                              description:
                                                  'Anda belum memiliki transaksi kotak amal. Mulai catat hasil pengumpulan kotak amal.',
                                              icon: Icons.mosque_rounded,
                                              iconColor:
                                                  ModernColors.primaryAccent,
                                              actionButtonText:
                                                  'Tambah Kotak Amal',
                                              onActionPressed: () {
                                                context.pushNamed(
                                                    KotakAmalWidget.routeName);
                                              },
                                              tips: [
                                                'Kotak amal biasanya dikumpulkan setiap hari Jumat',
                                                'Catat hasil pengumpulan secara rutin untuk laporan yang akurat',
                                                'Pastikan jumlah yang dicatat sesuai dengan hasil penghitungan',
                                              ],
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.all(
                                                ModernSpacing.sm),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listTrxKomal.length,
                                            itemBuilder:
                                                (context, listTrxKomalIndex) {
                                              final listTrxKomalItem =
                                                  listTrxKomal[
                                                      listTrxKomalIndex];
                                              final komalData =
                                                  DataKomalStruct.maybeFromMap(
                                                      listTrxKomalItem);

                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: ModernSpacing.sm),
                                                child: Slidable(
                                                  endActionPane: ActionPane(
                                                    motion:
                                                        const ScrollMotion(),
                                                    extentRatio: 0.5,
                                                    children: [
                                                      SlidableAction(
                                                        label: 'Hapus',
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        icon: Icons
                                                            .delete_sweep_outlined,
                                                        onPressed: (_) async {
                                                          // Show confirmation dialog BEFORE API call using DialogService
                                                          var confirmDialogResponse =
                                                              await DialogService
                                                                  .showDeleteConfirmation(
                                                            context: context,
                                                            itemName:
                                                                'Transaksi Kotak Amal',
                                                            itemId: DataKomalStruct
                                                                    .maybeFromMap(
                                                                        listTrxKomalItem)
                                                                ?.id
                                                                .toString(),
                                                          );

                                                          // Only call delete API if user confirmed
                                                          if (confirmDialogResponse) {
                                                            _model.apiResultadsCopy3 =
                                                                await TransactionEndPointGroup
                                                                    .deleteKotakAmalCall
                                                                    .call(
                                                              token:
                                                                  currentAuthenticationToken,
                                                              id: DataKomalStruct
                                                                      .maybeFromMap(
                                                                          listTrxKomalItem)
                                                                  ?.id,
                                                            );

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Data transaksi ${DataKomalStruct.maybeFromMap(listTrxKomalItem)?.id.toString()} berhasil dihapus',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                              ),
                                                            );

                                                            safeSetState(() {});
                                                          }
                                                        },
                                                      ),
                                                      SlidableAction(
                                                        label: 'Edit',
                                                        backgroundColor:
                                                            Color(0xFF3311D2),
                                                        icon: Icons.edit,
                                                        onPressed: (_) {
                                                          print(
                                                              'SlidableActionWidget pressed ...');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  child:
                                                      _buildModernTransactionItem(
                                                    context: context,
                                                    title: 'Kotak Amal',
                                                    subtitle:
                                                        '${FFAppState().profileUPZ.unitName} - #${komalData?.id ?? 0}',
                                                    amount:
                                                        komalData?.amount ?? 0,
                                                    dateString:
                                                        komalData?.trxDate ??
                                                            '',
                                                    type:
                                                        TransactionType.income,
                                                    iconData:
                                                        Icons.mosque_rounded,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: TransactionEndPointGroup
                                          .getPendistribusianCall
                                          .call(
                                        token: currentAuthenticationToken,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return SkeletonLoaderWidget(
                                            type: SkeletonType.listItem,
                                            itemCount: 5,
                                          );
                                        }
                                        final listViewPendisGetPendistribusianResponse =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            final listTrxPendis =
                                                TransactionEndPointGroup
                                                        .getPendistribusianCall
                                                        .dataListPendis(
                                                          listViewPendisGetPendistribusianResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];
                                            if (listTrxPendis.isEmpty) {
                                              return EnhancedEmptyStateWidget(
                                                title:
                                                    'Belum Ada Transaksi Pendistribusian',
                                                description:
                                                    'Anda belum memiliki transaksi pendistribusian. Mulai catat penyaluran ZIS kepada mustahik.',
                                                icon:
                                                    Icons.local_florist_rounded,
                                                iconColor:
                                                    ModernColors.primaryAccent,
                                                actionButtonText:
                                                    'Tambah Pendistribusian',
                                                onActionPressed: () {
                                                  context.pushNamed(
                                                      PendistribusianWidget
                                                          .routeName);
                                                },
                                                tips: [
                                                  'Pendistribusian ZIS harus tepat sasaran kepada 8 asnaf',
                                                  'Dokumentasikan setiap penyaluran dengan bukti yang valid',
                                                  'Prioritaskan mustahik yang paling membutuhkan',
                                                ],
                                              );
                                            }

                                            return ListView.builder(
                                              padding: EdgeInsets.all(ModernSpacing.sm),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: listTrxPendis.length,
                                              itemBuilder: (context,
                                                  listTrxPendisIndex) {
                                                final listTrxPendisItem =
                                                    listTrxPendis[
                                                        listTrxPendisIndex];
                                                final pendisData = DataPendisStruct.maybeFromMap(listTrxPendisItem);
                                                final amount = pendisData?.totalRice != null && pendisData!.totalRice > 0.0
                                                    ? pendisData.totalRice.toInt()
                                                    : pendisData?.totalAmount ?? 0;
                                                final isRice = pendisData?.totalRice != null && pendisData!.totalRice > 0.0;
                                                
                                                return Padding(
                                                  padding: EdgeInsets.only(bottom: ModernSpacing.sm),
                                                  child: Slidable(
                                                      endActionPane: ActionPane(
                                                        motion:
                                                            const ScrollMotion(),
                                                        extentRatio: 0.5,
                                                        children: [
                                                          SlidableAction(
                                                            label: 'Hapus',
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            icon: Icons
                                                                .delete_sweep_outlined,
                                                            onPressed:
                                                                (_) async {
                                                              // Show confirmation dialog BEFORE API call using DialogService
                                                              var confirmDialogResponse =
                                                                  await DialogService
                                                                      .showDeleteConfirmation(
                                                                context:
                                                                    context,
                                                                itemName:
                                                                    'Transaksi Pendistribusian',
                                                                itemId: DataPendisStruct
                                                                        .maybeFromMap(
                                                                            listTrxPendisItem)
                                                                    ?.id
                                                                    .toString(),
                                                              );

                                                              // Only call delete API if user confirmed
                                                              if (confirmDialogResponse) {
                                                                _model.apiResultadsCopy3Copy =
                                                                    await TransactionEndPointGroup
                                                                        .deletePendistribusianCall
                                                                        .call(
                                                                  token:
                                                                      currentAuthenticationToken,
                                                                  id: DataPendisStruct
                                                                          .maybeFromMap(
                                                                              listTrxPendisItem)
                                                                      ?.id,
                                                                );

                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Data transaksi ${DataPendisStruct.maybeFromMap(listTrxPendisItem)?.id.toString()} berhasil dihapus',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                  ),
                                                                );

                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                          ),
                                                          SlidableAction(
                                                            label: 'Edit',
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF3311D2),
                                                            icon: Icons.edit,
                                                            onPressed: (_) {
                                                              print(
                                                                  'SlidableActionWidget pressed ...');
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      child: _buildModernTransactionItem(
                                                        context: context,
                                                        title: 'Pendistribusian - ${pendisData?.asnaf ?? ''}',
                                                        subtitle: '${pendisData?.mustahikName ?? ''} - #${pendisData?.id ?? 0}',
                                                        amount: amount,
                                                        dateString: pendisData?.trxDate ?? '',
                                                        type: TransactionType.expense, // Pendistribusian is expense (outgoing)
                                                        iconData: Icons.local_florist_rounded,
                                                        isRice: isRice,
                                                      ),
                                                    ),
                                                );
                                              },
                                            );
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper method to build modern transaction item widget
  /// Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.7
  Widget _buildModernTransactionItem({
    required BuildContext context,
    required String title,
    required String subtitle,
    required int amount,
    required String dateString,
    required TransactionType type,
    required IconData iconData,
    bool isRice = false,
  }) {
    final theme = FlutterFlowTheme.of(context);

    // Parse date string to DateTime
    DateTime dateTime;
    try {
      dateTime = DateTime.parse(dateString);
    } catch (e) {
      dateTime = DateTime.now();
    }

    // Get colors based on transaction type
    final amountColor = type == TransactionType.income
        ? ModernColors.incomeGreen
        : ModernColors.expenseRed;
    final iconBgColor = type == TransactionType.income
        ? ModernColors.incomeGreen.withOpacity(0.1)
        : ModernColors.expenseRed.withOpacity(0.1);
    final iconColor = type == TransactionType.income
        ? ModernColors.incomeGreen
        : ModernColors.expenseRed;

    // Format amount
    String formattedAmount;
    if (isRice) {
      formattedAmount = '${formatNumber(
        amount.toDouble(),
        formatType: FormatType.custom,
        format: '###.###',
        locale: 'ID',
      )} Kg';
    } else {
      final prefix = type == TransactionType.income ? '+' : '-';
      formattedAmount = '$prefix Rp ${formatNumber(
        amount,
        formatType: FormatType.decimal,
        decimalType: DecimalType.periodDecimal,
      )}';
    }

    // Format time
    final formattedTime = dateTimeFormat('HH:mm', dateTime);

    // Requirements: 6.1 - Card format with white background
    return Container(
      decoration: BoxDecoration(
        color: ModernColors.backgroundCard,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        // Requirements: 6.7 - Subtle spacing
        padding: const EdgeInsets.all(ModernSpacing.md),
        child: Row(
          children: [
            // Requirements: 6.2 - Icon on left with rounded background
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(ModernRadius.md),
              ),
              child: Center(
                child: Icon(
                  iconData,
                  color: iconColor,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: ModernSpacing.md),
            // Requirements: 6.3 - Title and subtitle in middle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: theme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ModernColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: ModernSpacing.xs),
                  Text(
                    subtitle,
                    style: theme.bodySmall.copyWith(
                      color: ModernColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Requirements: 6.4, 6.5 - Amount and time on right with color coding
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formattedAmount,
                  style: theme.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: amountColor,
                  ),
                ),
                const SizedBox(height: ModernSpacing.xs),
                Text(
                  formattedTime,
                  style: theme.bodySmall.copyWith(
                    color: ModernColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
