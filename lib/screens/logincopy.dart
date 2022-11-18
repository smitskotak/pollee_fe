import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class SegmentedWidget extends StatefulWidget {
  const SegmentedWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SegmentedWidgetState createState() => _SegmentedWidgetState();
}

class _SegmentedWidgetState extends State<SegmentedWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: Colors.blue[900],
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        indicatorColor: Theme.of(context).colorScheme.secondary,
                        //selectedLabelColor: Theme.of(context).colorScheme.primary,
                        unselectedLabelColor: Theme.of(context).colorScheme.primary,
                        //borderColor: Theme.of(context).colorScheme.primary,
                        //pressedColor: Theme.of(context).colorScheme.primary,
                        tabs: const [
                          Tab(
                            text: 'Login',
                          ),
                          Tab(
                            text: 'Register',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Enter your Name',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 30,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                      child: TextFormField(
                                        controller: textController1,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 20,
                                        ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Text(
                                        'Enter your Email Id',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.blue,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                      child: TextFormField(
                                        controller: textController2,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 20,
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                    const Align(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Text(
                                          'Enter your Password',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.blue,
                                            fontSize: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                      child: TextFormField(
                                        controller: textController3,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 20,
                                        ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Enter your Email Id',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                    child: TextFormField(
                                      controller: textController4,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFFF0000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFFF0000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 20,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  Align(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                      child: Text(
                                        'Enter your Password',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                    child: TextFormField(
                                      controller: textController5,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFFF0000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFFF0000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 20,
                                      ),
                                      keyboardType: TextInputType.name,
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
              SizedBox(
                height: 50,
                width: 220,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {},
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Lets Go',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),

                  //   color: Theme.of(context).primaryColor,
                  //   textStyle: Theme.of(context).textTheme.subtitle2(
                  //           fontFamily: 'Roboto',
                  //           color: Colors.white,
                  //         ),
                  //     borderSide: const BorderSide(
                  //       color: Colors.transparent,
                  //       width: 1,
                  //     ),
                  //     borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 20)
              // options : ElevatedButton(
              //     width: 130,
              //     height: 40,
              //     color: Theme.of(context).primaryColor,
              //     textStyle: Theme.of(context).textTheme.subtitle2(
              //           fontFamily: 'Roboto',
              //           color: Colors.white,
              //         ),
              //     borderSide: const BorderSide(
              //       color: Colors.transparent,
              //       width: 1,
              //     ),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
