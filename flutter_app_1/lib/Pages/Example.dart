import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:intl/intl.dart';

class ExmaplePage extends StatefulWidget {
  const ExmaplePage({super.key});

  static const String route = "/Example";
  @override
  State<ExmaplePage> createState() => _ExmaplePageState();
}

Uint8List _stringToUint8List(String data) {
  List<int> codeUnits = data.codeUnits;
  Uint8List uint8list = Uint8List.fromList(codeUnits);
  return uint8list;
}

//! Definicion de varaibles auxiliares para el envio de datos
DateTime now = DateTime.now();
String utcHour = DateFormat("HHmmssSS").format(now);
String pitchSymbol = '+100';
String rollSymbol = '+500';
String heading = '50';
String airspeed = '1500';
String altitude = '12000';
String rateTurnSymbol = '+500';
String accelSymbol = '+99';
String aoa = '00';
String vSpeed = '+500';
String temp = '+88';
String altSetting = '200';

//! Uso de Serial port
List<String> availablePorts =
    SerialPort.availablePorts; //* Determina los puertos disponibles

//***********************************************************************************
class _ExmaplePageState extends State<ExmaplePage> {
  String message =
      "=11$utcHour$pitchSymbol$rollSymbol${heading.toString().padLeft(3, '0')}${airspeed.toString().padLeft(4, '0')}+${altitude.toString().padLeft(5, '0')}$rateTurnSymbol$accelSymbol$accelSymbol$aoa$vSpeed$temp${altSetting.toString().padLeft(3, '0')}";

  @override
  Widget build(BuildContext context) {
//***********************************************
    List<int> dataSet1 = ascii.encode(message);
    String checkSum = (dataSet1.fold<int>(0, (a, b) => a + b) & 0xFF)
        .toRadixString(16)
        .toUpperCase();
    if (checkSum.length == 1) checkSum = '0$checkSum';

    String message2 = '$message$checkSum\r\n';
    Uint8List dataSet_ = ascii.encode(message2);

//***********************************************
    //! Uso de Serial port
    print("Puertos: $availablePorts"); //* Imprimir lista de puertos
    // SerialPort port1 = SerialPort(
    //     availablePorts.first); //* Crear objeto del puerto selccionado
    // port1.openReadWrite(); //* Abrir puerto para lectura y escritura
    // try {
    //   port1.write(dataSet_); //Todo - Enviar mensaje completo
    //   //SerialPortReader msg = SerialPortReader(port1); //Todo - Leer mensajes
    //   //Stream<String> upcomming = msg.stream.map((data) {
    //   //  return String.fromCharCodes(data); //* Transformar a String
    //   //});
    //   //upcomming.listen((data) {
    //   //  print('Read Data:$data');
    //   //});
    // } on SerialPortError catch (err, _) {
    //   //! En caso de error
    //   print(SerialPort.lastError);
    //   port1.close();
    // }
//***********************************************************************************
    return Scaffold(
      appBar: // Generated code for this AppBar Widget...
          AppBar(
        backgroundColor: const Color(0xF04B39EF),
        automaticallyImplyLeading: false,
        title: const Text(
          'Prueba de Comunicacion',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      body: // Generated code for this Column Widget...
          Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'Demo control HUD',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
                child: SizedBox(
                  width: 50,
                ),
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: const Color(0xF0373737),
                  ),
                ),
                alignment: const AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            //ToDo - Crear función del botón
                          },
                          minWidth: 130,
                          height: 40,
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: const Color(0xF04B39EF),
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
