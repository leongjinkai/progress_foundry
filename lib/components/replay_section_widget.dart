import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'replay_section_model.dart';
export 'replay_section_model.dart';

class ReplaySectionWidget extends StatefulWidget {
  const ReplaySectionWidget({super.key});

  @override
  State<ReplaySectionWidget> createState() => _ReplaySectionWidgetState();
}

class _ReplaySectionWidgetState extends State<ReplaySectionWidget> {
  late ReplaySectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReplaySectionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Text(
                            'Adding to 10',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 23.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.5,
                                ),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.55,
                              decoration: const BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/divider.svg',
                                  height: 2.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 1.0,
            ),
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 43.0),
              child: LinearPercentIndicator(
                percent: 0.15,
                lineHeight: 24.0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: const Color(0xFF81E770),
                backgroundColor: const Color(0xFFE0FFDB),
                center: Text(
                  '15%',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Poppins',
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        lineHeight: 1.5,
                      ),
                ),
                barRadius: const Radius.circular(6.0),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 1024.0,
                height: 119.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      color: FlutterFlowTheme.of(context).alternate,
                      offset: const Offset(
                        0.0,
                        5.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(49.0, 0.0, 49.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Single digit addition (5)',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 23.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.5,
                                ),
                          ),
                          RatingBarIndicator(
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_rate_sharp,
                              color: Color(0xFFF6D826),
                            ),
                            direction: Axis.horizontal,
                            rating: 3.0,
                            unratedColor:
                                FlutterFlowTheme.of(context).primaryText,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                            itemSize: 26.0,
                          ),
                        ].divide(const SizedBox(height: 7.0)),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('Landing');
                        },
                        text: 'Replay >',
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 38.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1024.0,
                height: 119.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      color: FlutterFlowTheme.of(context).alternate,
                      offset: const Offset(
                        0.0,
                        5.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(49.0, 0.0, 49.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Single digit addition (5)',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 23.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.5,
                                ),
                          ),
                          RatingBarIndicator(
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_rate_sharp,
                              color: Color(0xFFF6D826),
                            ),
                            direction: Axis.horizontal,
                            rating: 3.0,
                            unratedColor:
                                FlutterFlowTheme.of(context).primaryText,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                            itemSize: 26.0,
                          ),
                        ].divide(const SizedBox(height: 7.0)),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('Landing');
                        },
                        text: 'Replay >',
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 38.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 19.0)),
          ),
        ],
      ),
    );
  }
}
