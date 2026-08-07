import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputWidgetDay13 extends StatefulWidget {
  const InputWidgetDay13({super.key});

  @override
  State<InputWidgetDay13> createState() => _InputWidgerDay13State();
}

class _InputWidgerDay13State extends State<InputWidgetDay13> {
  bool _isCheck = false;
  bool _isOn = false;
  String? _seleted;
  DateTime? _seletedTime;
  TimeOfDay? _seletedTimeOfDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _isOn ? Colors.greenAccent : Colors.brown,
      child: checkboxWidget(),
    );
  }

  Column checkboxWidget() {
    return Column(
      children: [
        chechkboxWidget(),
        Center(),
        swicthWidget(),
        dropDonwWidgget(),
        datePickerWidget(),

        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              setState(() {
                _seletedTimeOfDay = picked;
              });
            }
          },
          child: Text("Pilih Jam"),
        ),
        Text(
          _seletedTimeOfDay == null
              ? "TimeOfDay(11:14)"
              : DateFormat('HH:mm').format(
                  DateTime(
                    0,
                    0,
                    0,
                    _seletedTimeOfDay!.hour,
                    _seletedTimeOfDay!.minute,
                  ),
                ),
        ),
        Text(
          _seletedTimeOfDay == null
              ? "11:14"
              : DateFormat('HH:mm').format(
                  DateTime(
                    0,
                    0,
                    0,
                    _seletedTimeOfDay!.hour,
                    _seletedTimeOfDay!.minute,
                  ),
                ),
        ),
        Text(
          _seletedTimeOfDay == null
              ? "11:14"
              : DateFormat('HH:mm').format(
                  DateTime(
                    0,
                    0,
                    0,
                    _seletedTimeOfDay!.hour,
                    _seletedTimeOfDay!.minute,
                  ),
                ),
        ),
      ],
    );
  }

  Column datePickerWidget() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(2013),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
            );
            if (picked != null) {
              setState(() {
                _seletedTime = picked;
              });
            }
          },
          child: Text("Pilih Tanggal"),
        ),
        Text(
          _seletedTime == null
              ? "Anda Belum Pilih Tanggal"
              : _seletedTime.toString(),
        ),
        Text(
          _seletedTime == null
              ? "Anda belum pilih tanggal"
              : DateFormat(
                  'EEE, dd MMM yyyy',
                ).format(_seletedTime ?? DateTime.now()),
        ),
        Text(
          _seletedTime == null
              ? "Anda belum pilih tanggal"
              : DateFormat(
                  'EEE, dd MMM yyyy',
                ).format(_seletedTime ?? DateTime.now()),
        ),
      ],
    );
  }

  Column swicthWidget() {
    return Column(
      children: [
        Switch(
          value: _isOn,
          onChanged: (value) {
            _isOn = value ?? false;
            setState(() {});
          },
        ),
        Text(_isOn ? "Matiin" : 'HIDUPIN'),
      ],
    );
  }

  Column dropDonwWidgget() {
    return Column(children: [dropdownWidget()]);
  }

  Column dropdownWidget() {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(
            fillColor: _seleted == "Merah"
                ? const Color.fromRGBO(210, 45, 4, 1)
                : _seleted == "Kuning"
                ? Colors.amber
                : Colors.green,
          ),
          dropdownColor: Colors.pink,
          initialValue: _seleted,
          items: ["Merah", "Kuning", "Hijau"].map((String val) {
            return DropdownMenuItem(value: val, child: Text(val));
          }).toList(),
          onChanged: (value) {
            setState(() {
              _seleted = value;
            });
          },
        ),
        Text(_seleted.toString()),
        Container(
          height: 50,
          width: 50,
          color: _seleted == "Merah"
              ? const Color.fromRGBO(210, 45, 4, 1)
              : _seleted == "Kuning"
              ? Colors.amber
              : Colors.green,
        ),
      ],
    );
  }

  Column chechkboxWidget() {
    return Column(
      children: [
        Checkbox(
          value: _isCheck,
          onChanged: (value) {
            _isCheck = value ?? false;
            setState(() {});
          },
        ),
        Text(_isOn ? "Anda Sudah Menceklis" : "Anda Belum Menceklis"),
      ],
    );
  }
}
