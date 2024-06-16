import 'package:flutter/material.dart';
import 'package:jazzies_cv/pages/about_me.dart';
import 'package:jazzies_cv/pages/my_exams.dart';
import '../componenten/custom_tiles.dart';
import 'my_experience.dart';
import 'my_projects.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _leftAnimation;
  late Animation<Offset> _rightAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _leftAnimation = Tween<Offset>(
      begin: Offset(-2.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _rightAnimation = Tween<Offset>(
      begin: Offset(2.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the page is first loaded
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    // Wait for 2 seconds (you can replace this with your own refresh logic)
    await Future.delayed(Duration(seconds: 2));

    // Reset and start the animations again
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jazzies',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Aovel Sans Rounded',
                fontSize: 45,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'CV app',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Aovel Sans Rounded',
                    fontSize: 30,

                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welkom!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Vind hier meer informatie '
                        'over wie ik ben en mijn ervaring in programmeren!',
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
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(35),
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return SlideTransition(
                      position: _leftAnimation,
                      child: GestureDetector(

                        child: CustomTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyExperiencePage()),
                            );
                          },
                          imagePath: 'assets/images/experience.jpg',

                        ),
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
                            MaterialPageRoute(builder: (context) => MyProjectsPage()),
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
                            MaterialPageRoute(builder: (context) => MyAboutmePage()),
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
                            MaterialPageRoute(builder: (context) => MyExamsPage()),
                          );
                        },
                        imagePath: 'assets/images/exams.png',
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
