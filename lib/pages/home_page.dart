import 'package:api_nasa/controllers/nasa_controller.dart';
import 'package:api_nasa/repositories/nasa_repository_imp.dart';
import 'package:api_nasa/service/dio_service_imp.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NasaController _nasaController = NasaController(NasaRepositoryImp(DioServiceImp()));
  @override
  void initState() {
    super.initState();
    _nasaController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: ValueListenableBuilder(
          valueListenable: _nasaController.pictures,
          builder: (context, value, child) {
            return Text(
              _nasaController.pictures.value?.title ?? '',
              style: const TextStyle(fontSize: 30),
            );
          },
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
          valueListenable: _nasaController.pictures,
          builder: (_, value, __) {
            if (value != null) {
              String explanation = _nasaController.pictures.value!.explanation;
              String data = _nasaController.pictures.value!.date;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(_nasaController.pictures.value?.url ?? ''),
                    const SizedBox(height: 16),
                    Text('Data : $data', style: const TextStyle(fontSize: 25, color: Colors.white)),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text('Explanation : $explanation', style: const TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: RepaintBoundary(child: CircularProgressIndicator()),
              );
            }
          }),
    );
  }
}
