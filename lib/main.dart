import 'package:flutter/material.dart';

void main() => runApp(MyStudentApp());

class MyStudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Student App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent.withOpacity(0.8),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

// หน้าแรก
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าแรก', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(Color(0xFFF8BBD0), Color(0xFFF06292), _animation.value)!,
                  Color.lerp(Color(0xFFFCE4EC), Color(0xFFD81B60), _animation.value)!,
                  Color.lerp(Color(0xFFF48FB1), Color(0xFFE91E63), _animation.value)!,
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 16),
              child: ListView(
                children: [
                  Text(
                    'ยินดีต้อนรับสู่แอปโปรไฟล์นักศึกษา',
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  _buildAnimatedButton(
                    'ดูผลการเรียน เทอม 1',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermPage(term: 1))),
                  ),
                  _buildAnimatedButton(
                    'ดูผลการเรียน เทอม 2',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermPage(term: 2))),
                  ),
                  _buildAnimatedButton(
                    'ดูผลการเรียน เทอม 3',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermPage(term: 3))),
                  ),
                  _buildAnimatedButton(
                    'ดูผลการเรียน เทอม 4',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermPage(term: 4))),
                  ),
                  _buildAnimatedButton(
                    'ดูผลการเรียน เทอม 5',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermPage(term: 5))),
                  ),
                  _buildAnimatedButton(
                    'ผลลัพธ์การเรียนรู้',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => LearningOutcomePage())),
                  ),
                  _buildAnimatedButton(
                    'ข้อมูลส่วนตัว',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage())),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedButton(String text, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.2),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 8,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

// หน้าผลการเรียน (ใช้ร่วมกันได้ทุกเทอม)
class TermPage extends StatelessWidget {
  final int term;
  TermPage({required this.term});

  final Map<int, List<Map<String, String>>> termData = {
    1: [
      {'วิชา': 'แก่นวิศวกรรมซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'วิศวกรรมซอฟต์แวร์เบื้องต้น','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การสื่อสารข้อมูลและเครือข่าย','หน่วยกิต': '3', 'เกรด': 'A'},
    ],
    2: [
      {'วิชา': 'ระบบปฏิบัติการและการจัดโครงแบบเครื่องแม่ข่าย','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การประมวลผลภาพดิจิทัล และการมองเห็นโดยคอมพิวเตอร์','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'คอมพิวเตอร์ช่วยในงานวิศวกรรมและการผลิต','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'ภาษาอังกฤษเชิงวิชาการ','หน่วยกิต': '3', 'เกรด': 'C+'},
      {'วิชา': 'การเขียนโปรแกรมสำหรับวิศวกรซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'โครงสร้างและสถาปัตยกรรมคอมพิวเตอร์','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การกำหนดความต้องการและการออกแบบทางซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'A'},
    ],
    3: [
      {'วิชา': 'คณิตศาสตร์ดิสครีต','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'ความน่าจะเป็นและสถิติในงานวิศวกรรม','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การเขียนโปรแกรมเชิงวัตถุ','หน่วยกิต': '3', 'เกรด': 'B'},
      {'วิชา': 'กระบวนการซอฟต์แวร์และการประกันคุณภาพ','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'สถาปัตยกรรมซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'ระบบฝังตัวและระบบอินเทอร์เน็ตในทุกสิ่ง','หน่วยกิต': '3', 'เกรด': 'A'},
    ],
    4: [
      {'วิชา': 'พีชคณิตเชิงเส้นสำหรับวิศวกรรม','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การวิเคราะห์และออกแบบระบบ','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การจัดการโครงการซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'สัมมนาทางวิศวกรรมซอฟต์แวร์','หน่วยกิต': '1', 'เกรด': 'A'},
      {'วิชา': 'คลังข้อมูลและเหมืองข้อมูล','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'วิวัฒนาการซอฟต์แวร์และการบำรุงรักษา','หน่วยกิต': '3', 'เกรด': 'A'},
    ],
    5: [
      {'วิชา': 'โครงงานทางวิศวกรรมซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'การออกแบบกราฟิกเพื่อการนำเสนอ','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'วิศวกรรมเทคโนโลยีสื่อประสมและแอนิเมชัน','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'การเตรียมสหกิจศึกษาและฝึกงานด้านวิศวกรรมซอฟต์แวร์','หน่วยกิต': '1', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'ความมั่นคงปลอดภัยทางไซเบอร์เบื้องต้น','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'ปัญญาประดิษฐ์และการเรียนรู้ของเครื่อง','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'ธุรกิจสตาร์อัพด้านซอฟต์แวร์','หน่วยกิต': '2', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'การออกแบบและพัฒนาโปรแกรมประยุกต์สำหรับอุปกรณ์เคลี่อนที่','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final subjects = termData[term] ?? [];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('ผลการเรียน เทอม $term', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF8BBD0), Color(0xFFF06292)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 24),
              Card(
                elevation: 12,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                color: Color(0xFFFCE4EC),
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.menu_book, color: Color(0xFFF06292)),
                          SizedBox(width: 8),
                          Text('จำนวนวิชา:', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD81B60))),
                          SizedBox(width: 4),
                          Text('${subjects.length}', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF06292))),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.calculate, color: Color(0xFFF06292)),
                          SizedBox(width: 8),
                          Text('หน่วยกิตรวม:', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD81B60))),
                          SizedBox(width: 4),
                          Text('${_calculateTotalCredits(subjects)}', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF06292))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    final subject = subjects[index];
                    return Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      color: Color(0xFFF8BBD0),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFF06292),
                          child: Icon(Icons.school, color: Colors.white),
                        ),
                        title: Text(subject['วิชา']!, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD81B60))),
                        subtitle: Row(
                          children: [
                            Icon(Icons.credit_score, color: Color(0xFFF06292), size: 18),
                            SizedBox(width: 4),
                            Text('หน่วยกิต: ${subject['หน่วยกิต']}', style: TextStyle(fontSize: 14, color: Color(0xFFAD1457))),
                          ],
                        ),
                        trailing: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: _getGradeColor(subject['เกรด']!),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            subject['เกรด']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A':
        return Colors.green;
      case 'B+':
        return Colors.lightGreen;
      case 'B':
        return Colors.orange;
      case 'C+':
        return Colors.deepOrange;
      case 'C':
        return Colors.red;
      case 'D':
        return Colors.red[700]!;
      case 'F':
        return Colors.red[900]!;
      default:
        return Colors.grey;
    }
  }

  int _calculateTotalCredits(List<Map<String, String>> subjects) {
    int total = 0;
    for (var subject in subjects) {
      if (subject['เกรด'] != 'ไม่ระบุ') {
        total += int.parse(subject['หน่วยกิต']!);
      }
    }
    return total;
  }
}

// หน้าแสดงผลลัพธ์การเรียนรู้
class LearningOutcomePage extends StatelessWidget {
  final List<Map<String, String>> outcomes = [
    {
      'ปี': 'ปี 1',
      'ผลลัพธ์': 'ได้เรียนรู้พื้นฐานสำคัญที่เกี่ยวข้องกับการเขียนโปรแกรมเบื้องต้น การวิเคราะห์และออกแบบซอฟต์แวร์ รวมถึงหลักการของโครงสร้างข้อมูลและอัลกอริธึม นอกจากนี้ยังเข้าใจองค์ประกอบของระบบคอมพิวเตอร์ การสื่อสารข้อมูลและเครือข่าย การประมวลผลภาพดิจิทัล การมองเห็นของคอมพิวเตอร์ และเทคโนโลยีการผลิตในภาคอุตสาหกรรม ทั้งยังได้ฝึกการสื่อสารภาษาอังกฤษเชิงวิชาการเพื่อเตรียมความพร้อมในการทำงานระดับสากล'
    },
    {
      'ปี': 'ปี 2',
      'ผลลัพธ์': 'ได้เรียนรู้การเขียนโปรแกรมเชิงวัตถุ การวิเคราะห์และออกแบบระบบ รวมถึงการจัดการโครงการซอฟต์แวร์ในรูปแบบที่เป็นระบบมากขึ้น พร้อมทั้งเข้าใจแนวคิดสถาปัตยกรรมซอฟต์แวร์ และกระบวนการพัฒนาซอฟต์แวร์ที่มีคุณภาพตามมาตรฐานอุตสาหกรรม ได้ศึกษาเทคโนโลยี Embedded Systems และ Internet of Things (IoT) ซึ่งเป็นแนวโน้มสำคัญในยุคปัจจุบัน รวมถึงทักษะในการวิเคราะห์ข้อมูลด้วย Data Mining และ Data Warehousing นอกจากนี้ยังได้เรียนคณิตศาสตร์ด้านพีชคณิตเชิงเส้นและคณิตศาสตร์ดิสครีต ตลอดจนความน่าจะเป็นและสถิติ ซึ่งเป็นพื้นฐานสำคัญของการคิดเชิงวิเคราะห์ และยังได้เรียนรู้การพัฒนาซอฟต์แวร์อย่างต่อเนื่องผ่านการบำรุงรักษาและปรับปรุงระบบในระยะยาว'
    },
    {
      'ปี': 'ปี 3',
      'ผลลัพธ์': 'กำลังศึกษาอยู่'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('ผลลัพธ์การเรียนรู้', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFF8BBD0), Color(0xFFF06292)],
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            itemCount: outcomes.length,
            itemBuilder: (context, index) {
              final item = outcomes[index];
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                color: Color(0xFFFCE4EC),
                margin: EdgeInsets.symmetric(vertical: 12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timeline, color: Color(0xFFF06292), size: 28),
                          SizedBox(width: 10),
                          Text(item['ปี']!, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFD81B60))),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.check_circle, color: Color(0xFFF06292)),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item['ผลลัพธ์']!,
                              style: TextStyle(fontSize: 16, color: Color(0xFFAD1457)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// หน้าโปรไฟล์
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF8BBD0), Color(0xFFF06292)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withOpacity(0.2),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/mypicture.png'),
                  ),
                ),
                SizedBox(height: 24),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Color(0xFFFCE4EC),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, color: Color(0xFFF06292), size: 32),
                            SizedBox(width: 12),
                            Text('น.ส.ชวัลลักษณ์ ไพบูลย์ชมพู', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFD81B60))),
                          ],
                        ),
                        SizedBox(height: 18),
                        Row(
                          children: [
                            Icon(Icons.badge, color: Color(0xFFF06292)),
                            SizedBox(width: 12),
                            Text('รหัสนักศึกษา: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFD81B60))),
                            Text('66543210009-7', style: TextStyle(fontSize: 18, color: Color(0xFFAD1457))),
                          ],
                        ),
                        SizedBox(height: 18),
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.pinkAccent),
                            SizedBox(width: 12),
                            Text('ความชอบ: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFD81B60))),
                            Flexible(child: Text('เกม, ดนตรี และอะไรใหม่ๆ', style: TextStyle(fontSize: 18, color: Color(0xFFAD1457)))),
                          ],
                        ),
                        SizedBox(height: 18),
                        Row(
                          children: [
                            Icon(Icons.code, color: Color(0xFFE91E63)),
                            SizedBox(width: 12),
                            Text('ความถนัด: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFD81B60))),
                            Flexible(child: Text('Python', style: TextStyle(fontSize: 18, color: Color(0xFFAD1457)))),
                          ],
                        ),
                        SizedBox(height: 18),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 12),
                            Text('ความสามารถพิเศษ: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFD81B60))),
                            Flexible(child: Text('ร้องเพลง', style: TextStyle(fontSize: 18, color: Color(0xFFAD1457)))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
