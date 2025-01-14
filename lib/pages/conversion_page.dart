import 'package:flutter/material.dart';

class ConversionPage extends StatefulWidget {
  final String category;

  const ConversionPage({required this.category});

  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  final TextEditingController _inputController = TextEditingController();
  String _result = '';
  String _selectedFromUnit = '';
  String _selectedToUnit = '';

  // Dummy units for demonstration
  final List<String> _lengthUnits = ['Meters', 'Kilometers', 'Miles'];
  final List<String> _temperatureUnits = ['Celsius', 'Fahrenheit', 'Kelvin'];
  final List<String> _massUnits = ['Grams', 'Kilograms', 'Pounds'];

  // Initialize the units based on the category
  List<String> _getUnits() {
    switch (widget.category) {
      case 'Length':
        return _lengthUnits;
      case 'Temperature':
        return _temperatureUnits;
      case 'Mass':
        return _massUnits;
      default:
        return [];
    }
  }

  // Function to perform the conversion based on the selected category and units
  void _convert() {
    setState(() {
      double input = double.tryParse(_inputController.text) ?? 0;

      // Length Conversion
      if (widget.category == 'Length') {
        if (_selectedFromUnit == 'Meters' && _selectedToUnit == 'Kilometers') {
          _result = (input / 1000).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Kilometers' && _selectedToUnit == 'Meters') {
          _result = (input * 1000).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Meters' && _selectedToUnit == 'Miles') {
          _result = (input * 0.000621371).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Miles' && _selectedToUnit == 'Meters') {
          _result = (input / 0.000621371).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Kilometers' && _selectedToUnit == 'Miles') {
          _result = (input * 0.621371).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Miles' && _selectedToUnit == 'Kilometers') {
          _result = (input / 0.621371).toStringAsFixed(2);
        } else {
          _result = 'Conversion not supported!';
        }
      }
      // Temperature Conversion
      else if (widget.category == 'Temperature') {
        if (_selectedFromUnit == 'Celsius' && _selectedToUnit == 'Fahrenheit') {
          _result = ((input * 9 / 5) + 32).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Fahrenheit' && _selectedToUnit == 'Celsius') {
          _result = ((input - 32) * 5 / 9).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Celsius' && _selectedToUnit == 'Kelvin') {
          _result = (input + 273.15).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Kelvin' && _selectedToUnit == 'Celsius') {
          _result = (input - 273.15).toStringAsFixed(2);
        } else {
          _result = 'Conversion not supported!';
        }
      }
      // Mass Conversion
      else if (widget.category == 'Mass') {
        if (_selectedFromUnit == 'Grams' && _selectedToUnit == 'Kilograms') {
          _result = (input / 1000).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Kilograms' && _selectedToUnit == 'Grams') {
          _result = (input * 1000).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Grams' && _selectedToUnit == 'Pounds') {
          _result = (input * 0.00220462).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Pounds' && _selectedToUnit == 'Grams') {
          _result = (input / 0.00220462).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Kilograms' && _selectedToUnit == 'Pounds') {
          _result = (input * 2.20462).toStringAsFixed(2);
        } else if (_selectedFromUnit == 'Pounds' && _selectedToUnit == 'Kilograms') {
          _result = (input / 2.20462).toStringAsFixed(2);
        } else {
          _result = 'Conversion not supported!';
        }
      }
      // Unsupported Category
      else {
        _result = 'Category not supported!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Conversion'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isLandscape = constraints.maxWidth > constraints.maxHeight;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Value:',
                  style: TextStyle(fontSize: isLandscape ? 22 : 18),
                ),
                TextField(
                  controller: _inputController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Enter number'),
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  value: _selectedFromUnit.isEmpty ? null : _selectedFromUnit,
                  hint: Text('Select From Unit'),
                  items: _getUnits().map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedFromUnit = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  value: _selectedToUnit.isEmpty ? null : _selectedToUnit,
                  hint: Text('Select To Unit'),
                  items: _getUnits().map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedToUnit = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _convert,
                  child: Text(
                    'Convert',
                    style: TextStyle(fontSize: isLandscape ? 20 : 16),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Result: $_result',
                  style: TextStyle(fontSize: isLandscape ? 22 : 18),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
