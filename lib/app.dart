import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_s2025/bloc/events.dart';
import 'package:midterm_s2025/bloc/product_bloc.dart';
import 'package:midterm_s2025/categories_page.dart';
import 'package:midterm_s2025/home_page.dart';
import 'package:midterm_s2025/profile_page.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _selectedIndex = 0;
  int _colorMode = 0;

  @override
  void initState() {
    context.read<ProductBloc>().add(LoadProductsEvent());
    super.initState();
  }

  void navigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeColorMode() {
    setState(() {
      _colorMode = _colorMode == 0 ? 1 : 0;
    });
  }

  Widget _getPage() {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return const CategoriesPage();
      case 2:
        return const ProfilePage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorMode == 1 ? Colors.black : Colors.grey[50],
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'E-Shop', 
              style: TextStyle(
                color: _colorMode == 1 ? Colors.white :  Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                _colorMode == 1 ? Icons.light_mode : Icons.dark_mode, 
                color: _colorMode == 1 ? Colors.white : Colors.black,
                size: 20,
              ),
              onPressed: () {
                _changeColorMode();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart, 
                color: _colorMode == 1 ? Colors.white : Colors.black,
                size: 20,
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: _colorMode == 1 ? Colors.black : Colors.white,
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: navigate,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
            activeIcon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color.fromARGB(255, 228, 219, 234),
      ),
    );
  }
}