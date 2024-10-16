import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universidad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/carreras': (context) => const CarrerasPage(),
        '/contacto': (context) => const ContactoPage(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/upds_logo-1-1.png', height: 40),
            DropdownButton<String>(
              hint: const Text("Carreras"),
              items: const [
                DropdownMenuItem(value: "Derecho", child: Text("Derecho")),
                DropdownMenuItem(value: "Medicina", child: Text("Medicina")),
                DropdownMenuItem(value: "Psicología", child: Text("Psicología")),
                DropdownMenuItem(value: "Ing. Sistemas", child: Text("Ing. Sistemas")),
                DropdownMenuItem(value: "Ing. Petrolera", child: Text("Ing. Petrolera")),
                DropdownMenuItem(value: "Ing. Civil", child: Text("Ing. Civil")),
                DropdownMenuItem(value: "Arquitectura", child: Text("Arquitectura")),
                DropdownMenuItem(value: "Contaduría", child: Text("Contaduría")),
                DropdownMenuItem(value: "Administración", child: Text("Administración")),
              ],
              onChanged: (value) {

              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carrusel de imágenes
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  Image.asset('assets/portada-web.jpg', fit: BoxFit.cover),
                  Image.asset('assets/portada-web2 (1).jpg', fit: BoxFit.cover),
                  Image.asset('assets/portada-web2.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                _buildCard('assets/estudiantes.jpg', 'Derecho', 'Carrera enfocada en el estudio de leyes, normativa...'),
                _buildCard('assets/Medicina.jpg', 'Medicina', 'Preparación científica para la prevención, diagnós...'),
                _buildCard('assets/Psicologia.jpg', 'Psicología', 'Estudio del comportamiento humano y los procesos...'),
                _buildCard('assets/Sistemas.jpg', 'Ing. Sistemas', 'Desarrollo y gestión de soluciones tecnológicas q...'),
                _buildCard('assets/Petrolera.jpg', 'Ing. Petrolera', 'Carrera que se enfoca en la exploración, extracc...'),
                _buildCard('assets/Civil.jpg', 'Ing. Civil', 'Diseño, construcción y mantenimiento de infraestru...'),
                ],
              ),
            ),
            const SizedBox(height: 18),
            // Footer
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(15.0),
              child: const Center(
                child: Text(
                  'Universidad Privada Domingo Sabio - Sucre',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Carreras'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: 'Contacto'),
        ],
        currentIndex: 0, 
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/carreras');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/contacto');
          }
        },
      ),
    );
  }

  Widget _buildCard(String imagePath, String title, String description) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 160,
        height: 220,
        child: Column(
          children: [
            Image.asset(imagePath, height: 100, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(description, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarrerasPage extends StatelessWidget {
  const CarrerasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carreras'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildCarreraItem('Derecho', 
            'Carrera enfocada en el estudio de leyes, normativas y regulaciones que rigen la convivencia social. '
            'Forma profesionales capaces de defender los derechos de las personas y resolver conflictos en el ámbito legal. '
            'Áreas de estudio incluyen derecho penal, civil, constitucional, empresarial, entre otros.'),
          _buildCarreraItem('Medicina', 
            'Preparación científica para la prevención, diagnóstico y tratamiento de enfermedades. '
            'Los estudiantes de Medicina se forman en ciencias básicas y clínicas, para convertirse en médicos generalistas o especializarse '
            'en áreas como cardiología, pediatría, cirugía, entre otras. Se enfocan en el cuidado integral de la salud.'),
          _buildCarreraItem('Psicología', 
            'Estudio del comportamiento humano y los procesos mentales. Los profesionales en esta área se especializan en terapia, evaluación psicológica '
            'y mejoramiento del bienestar emocional. Ofrece formación en psicología clínica, educativa y organizacional, entre otras ramas.'),
          _buildCarreraItem('Ingeniería de Sistemas', 
            'Desarrollo y gestión de soluciones tecnológicas que incluyen software, hardware y redes. '
            'Los estudiantes se capacitan en programación, bases de datos, ciberseguridad, inteligencia artificial, y más. '
            'Es una carrera clave para el avance tecnológico y la transformación digital.'),
          _buildCarreraItem('Ingeniería Petrolera', 
            'Carrera que se enfoca en la exploración, extracción y producción de hidrocarburos. '
            'Forma ingenieros capaces de manejar recursos energéticos de manera eficiente y sostenible. '
            'Estudiantes aprenden sobre perforación, producción, refinación y gestión ambiental.'),
          _buildCarreraItem('Ingeniería Civil', 
            'Diseño, construcción y mantenimiento de infraestructuras como edificios, puentes y carreteras. '
            'Esta carrera forma ingenieros civiles que son clave en el desarrollo urbano y rural, garantizando estructuras seguras y funcionales. '
            'Los estudiantes también se preparan para gestionar proyectos de construcción y recursos.'),
        ],
      ),
    );
  }

  Widget _buildCarreraItem(String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class ContactoPage extends StatelessWidget {
  const ContactoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacto'),
      ),
      body: const Center(
        child: Text('Página de contacto de la universidad.'),
      ),
    );
  }
}
