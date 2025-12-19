import 'package:flutter/material.dart';

class CustomBottomBarExample extends StatefulWidget {
  @override
  _CustomBottomBarExampleState createState() => _CustomBottomBarExampleState();
}

class _CustomBottomBarExampleState extends State<CustomBottomBarExample> {
  int _selectedIndex = 0;

  // Danh sách icon
  final List<IconData> icons = [Icons.home, Icons.favorite, Icons.search, Icons.person];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Màu nền app
      body: Center(
        child: Text("Selected Index: $_selectedIndex", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      // --- BẮT ĐẦU PHẦN CUSTOM BOTTOM BAR ---
      bottomNavigationBar: Container(
        height: 80, // Chiều cao của thanh bar
        decoration: BoxDecoration(
          color: Colors.white,
          // CUSTOM BORDER: Bo góc trên và thêm bóng đổ
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5))],
          // Viền màu (nếu muốn)
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            bool isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // PHẦN ICON: NHÔ LÊN + PHÓNG TO
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    // Nếu chọn: Đẩy lên cao (-15), nếu không: Về vị trí cũ (0)
                    transform: Matrix4.translationValues(0, isSelected ? -15 : 0, 0),
                    child: Transform.scale(
                      // Nếu chọn: Phóng to 1.3 lần
                      scale: isSelected ? 1.3 : 1.0,
                      child: Icon(
                        icons[index],
                        size: 28,
                        color: isSelected ? Colors.blue : Colors.grey, // Đổi màu khi chọn
                      ),
                    ),
                  ),

                  // Khoảng cách giữa icon và underline
                  SizedBox(height: isSelected ? 10 : 0),

                  // PHẦN UNDERLINE (Gạch chân)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 4,
                    width: isSelected ? 25 : 0, // Nếu chọn thì dài ra, không thì thu về 0
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(2)),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
