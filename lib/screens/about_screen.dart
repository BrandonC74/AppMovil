import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = '/about';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre Nosotros'),
        backgroundColor: isDark ? null : Colors.deepOrange[800],
        foregroundColor: isDark ? null : Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark
              ? null
              : LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepOrange.shade100,
                    Colors.white,
                  ],
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restaurant,
                size: 60,
                color: isDark ? Theme.of(context).iconTheme.color : Colors.deepOrange,
              ),
              const SizedBox(height: 20),
              Text(
                'The Best Burger',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDark ? null : Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Versión 1.0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? null : Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Somos una aplicación dedicada a ofrecer las mejores hamburguesas de la ciudad. Nuestro objetivo es brindar una experiencia única a nuestros clientes.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),
              _buildTeamMember(
                name: 'Equipo de Desarrollo',
                role: 'Desarrolladores Flutter: Brandon Cartagena',
                isDark: isDark,
              ),
              const SizedBox(height: 20),
              _buildTeamMember(
                name: 'Chef Principal',
                role: 'Especialista en Hamburguesas: Brandon Cartagena',
                isDark: isDark,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMember({
    required String name,
    required String role,
    required bool isDark,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: isDark ? null : Colors.deepOrange,
              child: Icon(
                Icons.person,
                size: 30,
                color: isDark ? null : Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              role,
              style: TextStyle(
                fontSize: 16,
                color: isDark ? null : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
