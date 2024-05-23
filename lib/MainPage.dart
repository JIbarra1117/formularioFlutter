import 'package:flutter/material.dart';
import 'config/colors.dart';
import 'config/text_styles.dart';
import 'components/form_field_widget.dart';

/// MainPage es el punto de entrada de la aplicación, donde se inicia la pantalla de registro.
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          prefixIconColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.focused)) {
              return Colors.grey;
            }
            return AppColors.secondaryColor;
          }),
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Colors.grey),
          focusColor: Colors.grey,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Registro de nuevo paciente'),
          foregroundColor: AppColors.tittleColor,
          backgroundColor: AppColors.backgroundColor,
        ),
        body: RegistroPacienteForm(),
      ),
    );
  }
}

/// RegistroPacienteForm es un formulario para registrar nuevos pacientes.
class RegistroPacienteForm extends StatefulWidget {
  @override
  _RegistroPacienteFormState createState() => _RegistroPacienteFormState();
}

class _RegistroPacienteFormState extends State<RegistroPacienteForm> {
  final _formKey = GlobalKey<FormState>();

  String _nombre = '';
  String _tipoDocumento = '';
  String _numeroDocumento = '';
  DateTime? _fechaNacimiento;
  String _genero = '';
  String _provincia = '';

  /// Lista de provincias de Ecuador.
  final List<String> provincias = [
    'Azuay', 'Bolívar', 'Cañar', 'Carchi', 'Chimborazo', 'Cotopaxi', 'El Oro',
    'Esmeraldas', 'Galápagos', 'Guayas', 'Imbabura', 'Loja', 'Los Ríos',
    'Manabí', 'Morona Santiago', 'Napo', 'Orellana', 'Pastaza', 'Pichincha',
    'Santa Elena', 'Santo Domingo de los Tsáchilas', 'Sucumbíos', 'Tungurahua',
    'Zamora Chinchipe'
  ];

  /// Genera una lista de DropdownMenuItem<String> a partir de la lista de provincias.
  List<DropdownMenuItem<String>> getDropdownItems() {
    return provincias.map((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                prefixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(top: 20.0),
                  child: Icon(
                    Icons.person,
                    size: AppColors.iconSize,
                    color: AppColors.secondaryColor,
                  ),
                ),
                alignLabelWithHint: true,
                labelText: 'Nombres y Apellidos',
                labelStyle: AppTextStyles.bodyLabel1,
                floatingLabelStyle: AppTextStyles.bodyLabelFloating2,
              ),
              onSaved: (value) {
                _nombre = value!;
              },
            ),
            const SizedBox(height: 20),
            CustomDropdownFormField(
              prefixIcon: Icons.credit_card,
              labelText: 'Tipo de documento',
              items: const [
                DropdownMenuItem(
                  value: 'Cédula',
                  child: Text('Cédula'),
                ),
                DropdownMenuItem(
                  value: 'RUC',
                  child: Text('RUC'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _tipoDocumento = value!;
                });
              },
              onSaved: (value) {
                _tipoDocumento = value!;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              labelText: 'Número de documento',
              prefixIcon: Icons.credit_card,
              onValueChanged: (value) {
                setState(() {
                  _numeroDocumento = value;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomDateFormField(
              labelText: 'Fecha de nacimiento',
              prefixIcon: Icons.cake,
              firstDate: DateTime(1900),
              lastDate: DateTime(2101),
              onSaved: (value) {
                _fechaNacimiento = value;
              },
              onChanged: (value) {
                setState(() {
                  _fechaNacimiento = value;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomDropdownFormField(
              prefixIcon: Icons.person_outline,
              labelText: 'Género',
              items: const [
                DropdownMenuItem(
                  value: 'Masculino',
                  child: Text('Masculino'),
                ),
                DropdownMenuItem(
                  value: 'Femenino',
                  child: Text('Femenino'),
                ),
                DropdownMenuItem(
                  value: 'Otro',
                  child: Text('Otro'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _genero = value!;
                });
              },
              onSaved: (value) {
                _genero = value!;
              },
            ),
            const SizedBox(height: 20),
            CustomDropdownFormField(
              labelText: 'Provincia',
              prefixIcon: Icons.location_on,
              items: getDropdownItems(),
              onChanged: (value) {
                setState(() {
                  _provincia = value!;
                });
              },
              onSaved: (value) {
                _provincia = value!;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print('Nombre: $_nombre');
                  print('Tipo de documento: $_tipoDocumento');
                  print('Número de documento: $_numeroDocumento');
                  print('Fecha de nacimiento: $_fechaNacimiento');
                  print('Género: $_genero');
                  print('Provincia: $_provincia');
                }
              },
              child: const Text(
                'Registrar',
                style: AppTextStyles.bodyLabelFloating2,)
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MainPage());
}
