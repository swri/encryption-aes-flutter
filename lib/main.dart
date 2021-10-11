import 'package:flutter/material.dart';

import 'aes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suwari Encryption',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: "Poppins",
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double screenWidth;
  late double screenHeight;

  final TextEditingController encryptController = TextEditingController();
  final TextEditingController decryptController = TextEditingController();

  final encrypData = AESEncryption();

  String? decrypted, encrypt;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Encryption WEB"),
      ),
      body: Center(
        child: SizedBox(
          width: screenWidth * 0.95,
          height: screenHeight * 0.83,
          child: Card(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: ListView(
                  children: [
                    //* JUDUL
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: screenWidth),
                        const Text(
                          "Encryption Using AES",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    //* INPUT PLAIN TEKS
                    TextField(
                      minLines: 3,
                      maxLines: 5,
                      controller: encryptController,
                      decoration: const InputDecoration(
                        labelText: 'Plaintext',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //* OUTPUT ENCRYPTION
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: screenWidth),
                        const Text("Encrypted: "),
                        SelectableText(encrypt ?? ""),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //* TOMBOL ENCRYPTION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            encrypt =
                                encrypData.crypteFile(encryptController.text);
                            setState(() {});
                          },
                          child: const SizedBox(
                            width: 150,
                            height: 50,
                            child: Center(
                              child: Text(
                                'Encrypt',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //* INPUT DECRYPTION
                    TextField(
                      minLines: 3,
                      maxLines: 5,
                      controller: decryptController,
                      decoration: const InputDecoration(
                        labelText: 'Encrypted',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //* OUTPUT DECRYPTION
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: screenWidth),
                        const Text("Decrypted: "),
                        SelectableText(decrypted ?? ""),
                      ],
                    ),
                    //* TOMBOL DECRYPTION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            decrypted =
                                encrypData.decryptFile(decryptController.text);
                            setState(() {});
                          },
                          child: const SizedBox(
                            width: 150,
                            height: 50,
                            child: Center(
                              child: Text(
                                'Decrypt',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
