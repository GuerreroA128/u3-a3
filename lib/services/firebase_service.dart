import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProductos() async {
  List Productos = [];
  QuerySnapshot querySnapshot = await db.collection('Productos').get();
  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    Map person = {
      "name": data["name"],
      "uid": doc.id,
    };

    Productos.add(person);
  }
  return Productos;
}

// Guardar un name en base de datos
Future<void> addProductos(String name) async {
  await db.collection("Productos").add({"name": name});
}

// Actualizar un name en base de datos
Future<void> updateProductos(String uid, String name) async {
  await db.collection("Productos").doc(uid).set({"name": name});
}

// Borrar datos de Firebase
Future<void> deleteProductos(String uid) async {
  await db.collection("Productos").doc(uid).delete();
}
