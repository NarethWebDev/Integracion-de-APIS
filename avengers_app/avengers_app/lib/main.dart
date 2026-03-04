import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
  const MaterialApp(home: DisneyApp(), debugShowCheckedModeBanner: false),
);

class DisneyApp extends StatefulWidget {
  const DisneyApp({super.key});

  @override
  State<DisneyApp> createState() => _DisneyAppState();
}

class _DisneyAppState extends State<DisneyApp> {
  String nombre = "Cargando...";
  String imagenUrl = "";
  String webUrl = "";

  @override
  void initState() {
    super.initState();
    traerDatos();
  }

  Future<void> traerDatos() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.disneyapi.dev/character'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final personaje = data['data'][0];

        setState(() {
          nombre = personaje['name'] ?? "Sin nombre";
          imagenUrl = personaje['imageUrl'] ?? "";
          webUrl = personaje['sourceUrl'] ?? "https://www.disney.com";
        });
      }
    } catch (e) {
      setState(() {
        nombre = "Error de conexión";
      });
    }
  }

  Future<void> _abrirPagina() async {
    if (webUrl.isNotEmpty) {
      final Uri url = Uri.parse(webUrl);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint('No se pudo abrir el link: $webUrl');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disney Clickeable"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imagenUrl.isEmpty
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onTap: _abrirPagina,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              imagenUrl,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            nombre,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Pica la imagen para ir a su Wiki",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: traerDatos,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
