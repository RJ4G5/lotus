import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.maxSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Lotus - Cadastro simples de clientes";
    win.show();
  });
}

const borderColor = Color(0xFF805306);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: WindowBorder(
                      color: borderColor,
                      width: 1,
                      child: Row( children: [ Home() ] )
                  )
              )
          );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(color: Color(0xFF3F51B5)),
            child: Column(children: [
              WindowTitleBarBox(
                  child: Row(children: [
                Expanded(child: MoveWindow()),
                Row(
                  children: [
                    MinimizeWindowButton(
                        colors: WindowButtonColors(
                                    iconNormal: Colors.white,
                                    mouseOver: Color(0x69E8EAF6),
                                    mouseDown: Color(0x69C5CAE9),
                                    iconMouseOver: Colors.white,
                                    iconMouseDown: Colors.white)
                                ),
                    CloseWindowButton(
                        colors: WindowButtonColors(
                                    mouseOver: Color(0xFFD32F2F),
                                    mouseDown: Color(0xFFB71C1C),
                                    iconNormal: Colors.white,
                                    iconMouseOver: Colors.white)
                                ),
                  ],
                ),
              ])),
              Spacer(),
              CustomPaint(
                  child: Container(
                    height: 350,
                    //decoration: BoxDecoration(color: Color(0xffffffff)),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 0.0,left: 10.0, right: 10.0,top: 10.0),
                                  decoration: BoxDecoration(
                                                  border: Border.all(color: Color(0xffB0BEC5), width: 2),
                                                  borderRadius: BorderRadius.circular(5),
                                              ),
                                  height: 170,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 1.0,left: 10.0,right: 10.0,top: 10.0),
                                  decoration: BoxDecoration(
                                                  border: Border.all(color: Color(0xffB0BEC5), width: 2),
                                                  borderRadius: BorderRadius.circular(5),
                                              ),
                                  height: 135,
                                  child: Column(
                                    children: [
                                      Container(
                                            margin: EdgeInsets.only( bottom: 0,left: 5.0,right: 5.0,top: 5.0),
                                            height: 30,
                                            decoration: BoxDecoration(
                                                            color: Color(0xffECEFF1),
                                                            borderRadius: BorderRadius.circular(5)
                                                        ),
                                            child: TextFormField(
                                                        decoration: const InputDecoration(
                                                            contentPadding:EdgeInsets.all(5.0),
                                                            focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide (
                                                                                                      color: Color(0xFF3F51B5)
                                                                                                  )
                                                                            ),
                                                            border: OutlineInputBorder(),
                                                            hintText: 'Buscar clientes'),
                                                  ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                                        color: Color(0xffECEFF1),
                                                        borderRadius: BorderRadius.circular(5),
                                                    ),
                                        height: 85,
                                        child: SfDataGrid(
                                            headerRowHeight: 25.0,
                                            rowHeight: 25.0,
                                            selectionMode: SelectionMode.single,
                                            gridLinesVisibility: GridLinesVisibility.both,
                                            columnWidthMode: ColumnWidthMode.fill,
                                            columns: <GridColumn>[
                                                  GridColumn(
                                                      columnName: 'Nome',
                                                      label: Container(
                                                                alignment: Alignment.center,
                                                                child: Text('Nome/Razão Social')
                                                              )
                                                  ),
                                                  GridColumn(
                                                      columnName: 'CNPJ/CPF',
                                                      label: Container(
                                                                alignment: Alignment.center,
                                                                child: Text('CNPJ/CPF')
                                                              )
                                                  ),
                                                  GridColumn(
                                                      columnName: 'acoes',
                                                      width: 100,
                                                      label: Container(
                                                                height: 10,
                                                                alignment: Alignment.center,
                                                                child: Text('Ações')
                                                              )
                                                  ),
                                            ],
                                            source:
                                                EmployeeDataSource(employeeData: [
                                                    Employee('Jéssica Malu Galvão', '21.291.366/0001-37', "Excluir"),
                                                    Employee('CEL CONSULTORIA E GESTÃO EMPRESARIAL LTDA', '172.113.753-02', "Excluir"),
                                                    Employee('C.C.L. GEBER E CIA LTDA', '93.155.119/0001-14', "Excluir"),
                                                    Employee('Cauê Calebe Juan Nascimento', '202.764.665-51', "Excluir"),
                                                    Employee('Alícia e Rita Financeira Ltda', '48.782.145/0001-18', "Excluir"),                                         
                                            ]),
                                          
                                       
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                    "Criado por Melquizedeque S. Lobo     V 1.0")
                              ],
                            ),
                            Positioned(
                              child: Container(
                                          padding: EdgeInsets.all(10.0),
                                          margin: EdgeInsets.only(left: 48.0, top: 0),
                                          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                                          border:Border.all(color: Colors.white, width: 5),
                                                          shape: BoxShape.circle,
                                                          color: Colors.white,
                                                          // image: DecorationImage(
                                                          //  fit: BoxFit.cover,
                                                          //    image: AssetImage('images/profile.png'),
                                                          //    ),
                                                      ),
                                      ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  painter: MyPainter())
            ])));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Color(0xffffffff);
    path = Path();

    path.lineTo(size.width * 0.31, 0);
    path.cubicTo(size.width * 0.3, size.height * 0.01, size.width * 0.3, size.height * 0.01, size.width * 0.3, size.height * 0.02);
    path.cubicTo(size.width * 0.3, size.height * 0.18, size.width / 5,   size.height * 0.28, size.width * 0.12, size.height / 5);
    path.cubicTo(size.width * 0.08, size.height * 0.16, size.width * 0.06, size.height * 0.09, size.width * 0.06, size.height * 0.02);
    path.cubicTo(size.width * 0.06, size.height * 0.01, size.width * 0.06,  size.height * 0.01, size.width * 0.05, 0);  path.cubicTo(size.width * 0.05, 0, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height, 0, size.height);
    path.cubicTo( 0, size.height, size.width, size.height, size.width, size.height);  path.cubicTo(size.width, size.height, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.31, 0, size.width * 0.31, 0);
    path.cubicTo(size.width * 0.31, 0, size.width * 0.31, 0, size.width * 0.31, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Employee {
  /// Creates the employee class with required details.
  Employee(this.nome, this.cnpjcpf, this.acoes);

  /// Id of an employee.
  final String nome;

  /// Name of an employee.
  final String cnpjcpf;

  /// Designation of an employee.

  /// Salary of an employee.
  final String acoes;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'nome', value: e.nome),
              DataGridCell<String>(columnName: 'CNPJ/CPF', value: e.cnpjcpf),
              DataGridCell<String>(columnName: 'acoes', value: e.acoes),
            ]))
        .toList();
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
              width: row.getCells().indexOf(e) == 0 ? 200 : null,
              alignment:  row.getCells().indexOf(e) == 0 ? Alignment.centerLeft : Alignment.center,
              child: Text(e.value.toString()),
            );
    }).toList());
  }
}
