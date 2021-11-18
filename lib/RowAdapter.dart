import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'Models/model_table_cliente.dart';

class RowAdapter extends DataGridSource {

  RowAdapter({required List<TD> employeeData}) {
    _employeeData = employeeData.map<DataGridRow>((e) => DataGridRow(cells: [
                                                                              DataGridCell<String>(columnName: 'CNPJ/CPF', value: e.cnpjcpf),
                                                                              DataGridCell<String>(columnName: 'nome', value: e.nome),              
                                                                              DataGridCell<String>(columnName: 'telefone', value: e.telefone),
                                                                            ])).toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {    
            return Container(
              padding: EdgeInsets.only(left: 3),              
              alignment:  row.getCells().indexOf(e) == 2 ? Alignment.center :Alignment.centerLeft  ,
              child: Text(e.value.toString()),
            );
    }).toList());
  }
}