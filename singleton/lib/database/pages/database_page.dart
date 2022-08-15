// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:singleton/database/database_connection.dart';

class DatabasePage extends StatefulWidget {
  const DatabasePage({Key? key}) : super(key: key);

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  ValueNotifier<List<Object?>> nomes = ValueNotifier([]);

  Future<void> buscarNomes() async {
    await Future.delayed(const Duration(seconds: 3));

    var database = await DatabaseConnection.instance.database;
    var result = await database.rawQuery('select * from teste');
    nomes.value = result.map<Object?>((e) => e["nome"]).toList();
  }

  Future<void> addNome(String nome) async {
    var database = await DatabaseConnection.instance.database;
    await database.rawInsert('insert into teste values("$nome")');
    buscarNomes();
  }

  Future<void> deleteNome(String nome) async {
    var database = await DatabaseConnection.instance.database;
    await database.rawInsert('delete from teste where nome="$nome"');
    buscarNomes();
  }

  @override
  void initState() {
    super.initState();
    buscarNomes();
  }

  @override
  void dispose() {
    super.dispose();
    DatabaseConnection.instance.closeDatabaseConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Page'),
      ),
      body: SizedBox(
        child: ValueListenableBuilder(
          valueListenable: nomes,
          builder: (_, __, ___) {
            if (nomes.value.isEmpty) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            return ListView.separated(
              itemCount: nomes.value.length,
              itemBuilder: (context, index) {
                String nome = nomes.value[index].toString();

                return ListTile(
                  title: Text(nome),
                  trailing: IconButton(
                    onPressed: () {
                      deleteNome(nome);
                    },
                    icon: const Icon(Icons.delete_forever),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          addNome("Nome adicionado pelo float");
        },
      ),
    );
  }
}
