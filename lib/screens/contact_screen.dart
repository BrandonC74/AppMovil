import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ContactScreen extends StatefulWidget {
  static const String routeName = '/contact';
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
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
        title: const Text('Contacto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
              themeProvider.toggleTheme(themeProvider.themeMode == ThemeMode.light);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                );
              },
              child: MouseRegion(
                onEnter: (_) => _animationController.forward(),
                onExit: (_) => _animationController.reverse(),
                child: Icon(
                  Icons.contact_mail,
                  size: 60,
                  color: Theme.of(context).brightness == Brightness.dark 
                      ? Colors.white70 
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Contáctanos',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 30),
            _buildInteractiveContactCard(
              context,
              icon: Icons.email,
              title: 'Email',
              subtitle: 'contacto@thebestburger.com',
            ),
            const SizedBox(height: 15),
            _buildInteractiveContactCard(
              context,
              icon: Icons.phone,
              title: 'Teléfono',
              subtitle: '+1 234 567 890',
            ),
            const SizedBox(height: 15),
            _buildInteractiveContactCard(
              context,
              icon: Icons.location_on,
              title: 'Dirección',
              subtitle: 'Calle Principal 123, Ciudad',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return InkWell(
      onTap: () {
        Feedback.forTap(context);
        // Add any additional tap actions here
      },
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 5,
        color: isDarkMode ? Colors.grey[800] : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: isDarkMode ? Colors.white70 : Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : null,
                          ),
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDarkMode ? Colors.white70 : null,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: isDarkMode ? Colors.white70 : Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}