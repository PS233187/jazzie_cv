import 'package:flutter/material.dart';
import 'package:jazzies_cv/pages/about_me.dart';
import 'package:jazzies_cv/pages/my_exams.dart';
import '../componenten/custom_tiles.dart';
import 'my_experience.dart';
import 'my_projects.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _leftAnimation;
  late Animation<Offset> _rightAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _leftAnimation = Tween<Offset>(
      begin: const Offset(-2.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _rightAnimation = Tween<Offset>(
      begin: const Offset(2.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF000000),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
            // Aangepaste schaduw
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),  // Verander de offset indien nodig
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Jazzies',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Aovel Sans Rounded',
                fontSize: 40,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(5),
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'CV app',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Ink Free',
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Navigate through my profile and programming journey in my CV app!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(35),
                  children: [
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return SlideTransition(
                          position: _leftAnimation,
                          child: CustomTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const MyExperiencePage()),
                              );
                            },
                            imagePath: 'assets/images/experience.jpg',
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return SlideTransition(
                          position: _rightAnimation,
                          child: CustomTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const MyProjectsPage()),
                              );
                            },
                            imagePath: 'assets/images/project.png',
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return SlideTransition(
                          position: _leftAnimation,
                          child: CustomTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const MyAboutmePage()),
                              );
                            },
                            imagePath: 'assets/images/aboutme.jpg',
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return SlideTransition(
                          position: _rightAnimation,
                          child: CustomTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyExamsPage()),
                              );
                            },
                            imagePath: 'assets/images/exams.png',
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/welcome.png',
                    width: 200,
                    height: 150,
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
