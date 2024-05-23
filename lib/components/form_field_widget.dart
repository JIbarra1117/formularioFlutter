// import 'package:flutter/material.dart';
// import '../config/colors.dart';
// import '../config/text_styles.dart';
//
// class CustomTextFormField extends StatelessWidget {
//   final String labelText;
//   // final String hintText;
//   final IconData prefixIcon;
//   final Function(String)? onSaved;
//   final Function(String)?
//       onValueChanged; // Nueva función de devolución de llamada
//
//   const CustomTextFormField({
//     required this.labelText,
//     // required this.hintText,
//     required this.prefixIcon,
//     this.onSaved,
//     this.onValueChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
//         prefixIcon: Padding(
//           padding: EdgeInsetsDirectional.only(top: 20.0),
//           child: Icon(
//             prefixIcon,
//             size: AppColors.iconSize,
//             color: AppColors.secondaryColor,
//           ),
//         ),
//         alignLabelWithHint: true,
//         labelText: labelText,
//         labelStyle: AppTextStyles.bodyLabel1,
//         // hintText: hintText,
//         hintStyle: AppTextStyles.bodyLabel1
//             .copyWith(color: AppColors.secondaryColor.withOpacity(0.5)),
//         floatingLabelStyle: AppTextStyles.bodyLabelFloating2,
//       ),
//       onChanged: onValueChanged,
//     );
//   }
// }
//
// class CustomDropdownFormField extends StatelessWidget {
//   final String labelText;
//   final List<DropdownMenuItem<String>> items;
//   final Function(String?)? onChanged;
//   final Function(String?)? onSaved;
//   final IconData prefixIcon;
//
//   const CustomDropdownFormField({
//     required this.labelText,
//     required this.items,
//     required this.prefixIcon,
//     this.onChanged,
//     this.onSaved,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//         prefixIcon: Padding(
//           padding: EdgeInsetsDirectional.only(top: 20.0),
//           child: Icon(
//             prefixIcon,
//             size: AppColors.iconSize,
//             color: AppColors.secondaryColor,
//           ),
//         ),
//         labelText: labelText,
//         labelStyle: AppTextStyles.bodyLabel1,
//         alignLabelWithHint: true,
//         floatingLabelStyle: AppTextStyles.bodyLabelFloating2,
//       ),
//       items: items,
//       onChanged: onChanged,
//       onSaved: onSaved,
//     );
//   }
// }
//
// // Datetimpicker
//
// class CustomDateFormField extends StatefulWidget {
//   final String labelText;
//   final IconData prefixIcon;
//   final DateTime? initialDate;
//   final DateTime firstDate;
//   final DateTime lastDate;
//   final Function(DateTime?)? onSaved;
//   final Function(DateTime?)? onChanged;
//
//   const CustomDateFormField({
//     Key? key,
//     required this.labelText,
//     required this.prefixIcon,
//     this.initialDate,
//     required this.firstDate,
//     required this.lastDate,
//     this.onSaved,
//     this.onChanged,
//   }) : super(key: key);
//
//   @override
//   _CustomDateFormFieldState createState() => _CustomDateFormFieldState();
// }
//
// class _CustomDateFormFieldState extends State<CustomDateFormField> {
//   late TextEditingController _controller;
//   DateTime? _selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = widget.initialDate;
//     _controller = TextEditingController(
//       text: _selectedDate == null ? '' : _selectedDate!.toLocal().toString().split(' ')[0],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
//         prefixIcon: Padding(
//           padding: const EdgeInsetsDirectional.only(top: 14.0),
//           child: Icon(
//             widget.prefixIcon,
//             size: AppColors.iconSize,
//             color: AppColors.secondaryColor,
//           ),
//         ),
//         labelText: widget.labelText,
//         labelStyle: AppTextStyles.bodyLabel1,
//         alignLabelWithHint: true,
//         floatingLabelStyle: AppTextStyles.bodyLabelFloating2,
//       ),
//       onTap: () async {
//         DateTime? pickedDate = await showDatePicker(
//           context: context,
//           initialDate: widget.initialDate ?? DateTime.now(),
//           firstDate: widget.firstDate,
//           lastDate: widget.lastDate,
//         );
//         if (pickedDate != null && pickedDate != _selectedDate) {
//           setState(() {
//             _selectedDate = pickedDate;
//             _controller.text = _selectedDate!.toLocal().toString().split(' ')[0];
//           });
//           if (widget.onChanged != null) {
//             widget.onChanged!(_selectedDate);
//           }
//         }
//       },
//       readOnly: true,
//       controller: _controller,
//       validator: (value) {
//         if (_selectedDate == null) {
//           return 'Por favor seleccione su fecha de nacimiento';
//         }
//         return null;
//       },
//       onSaved: (value) {
//         if (widget.onSaved != null) {
//           widget.onSaved!(_selectedDate);
//         }
//       },
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../config/text_styles.dart';

/// CustomTextFormField es un campo de texto personalizado que incluye un icono prefix y
/// funciones para manejar cambios y guardado de valores.
class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final Function(String)? onSaved;
  final Function(String)? onValueChanged;

  const CustomTextFormField({
    required this.labelText,
    required this.prefixIcon,
    this.onSaved,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(top: 20.0),
          child: Icon(
            prefixIcon,
            size: AppColors.iconSize,
            color: AppColors.secondaryColor, // Cambiado a gris
          ),
        ),
        alignLabelWithHint: true,
        labelText: labelText,
        labelStyle: AppTextStyles.bodyLabel1,
        hintStyle: AppTextStyles.bodyLabel1
            .copyWith(color: Colors.grey.withOpacity(0.5)), // Cambiado a gris con opacidad
        floatingLabelStyle: AppTextStyles.bodyLabelFloating2,
      ),
      onChanged: onValueChanged,
    );
  }
}

/// CustomDropdownFormField es un campo de selección desplegable personalizado que incluye
/// un icono prefix y funciones para manejar cambios y guardado de valores.
class CustomDropdownFormField extends StatelessWidget {
  final String labelText;
  final List<DropdownMenuItem<String>> items;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final IconData prefixIcon;

  const CustomDropdownFormField({
    required this.labelText,
    required this.items,
    required this.prefixIcon,
    this.onChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(top: 20.0),
          child: Icon(
            prefixIcon,
            size: AppColors.iconSize,
            color: AppColors.secondaryColor, // Cambiado a gris
          ),
        ),
        labelText: labelText,
        labelStyle: AppTextStyles.bodyLabel1,
        alignLabelWithHint: true,
        floatingLabelStyle: AppTextStyles.bodyLabelFloating2,
      ),
      items: items,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}

/// CustomDateFormField es un campo de formulario personalizado que permite seleccionar una fecha,
/// incluye un icono prefix y funciones para manejar cambios y guardado de valores.
class CustomDateFormField extends StatefulWidget {
  final String labelText;
  final IconData prefixIcon;
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime?)? onSaved;
  final Function(DateTime?)? onChanged;

  const CustomDateFormField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomDateFormFieldState createState() => _CustomDateFormFieldState();
}

class _CustomDateFormFieldState extends State<CustomDateFormField> {
  late TextEditingController _controller;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _controller = TextEditingController(
      text: _selectedDate == null ? '' : _selectedDate!.toLocal().toString().split(' ')[0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(top: 14.0),
          child: Icon(
            widget.prefixIcon,
            size: AppColors.iconSize,
            color: AppColors.secondaryColor,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: AppTextStyles.bodyLabel1,
        alignLabelWithHint: true,
        floatingLabelStyle: AppTextStyles.bodyLabelFloating2,
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: widget.initialDate ?? DateTime.now(),
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
        );
        if (pickedDate != null && pickedDate != _selectedDate) {
          setState(() {
            _selectedDate = pickedDate;
            _controller.text = _selectedDate!.toLocal().toString().split(' ')[0];
          });
          if (widget.onChanged != null) {
            widget.onChanged!(_selectedDate);
          }
        }
      },
      readOnly: true,
      controller: _controller,
      validator: (value) {
        if (_selectedDate == null) {
          return 'Por favor seleccione su fecha de nacimiento';
        }
        return null;
      },
      onSaved: (value) {
        if (widget.onSaved != null) {
          widget.onSaved!(_selectedDate);
        }
      },
    );
  }
}
