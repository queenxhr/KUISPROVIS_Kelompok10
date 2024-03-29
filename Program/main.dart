import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz UI Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quiz UI Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedGender = ''; // Default selected gender
  late TextEditingController _dateController; // Deklarasi controller
  DateTime? _selectedDate; // Variabel untuk menyimpan tanggal yang dipilih

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(); // Inisialisasi controller
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PageWidget('Beranda'),
    PageWidget('Kategori'),
    PageWidget('Scan'),
    PageWidget('List Belanja'),
    PageWidget('Akun'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Nomor Kelompok:  [10]',
            ),
            const Text(
              'Mhs 1:  [2200978, Ratu Syahirah Khairunnisa]',
            ),
            const Text(
              'Mhs 2:  [2200598, Jasmine Noor Fawzia]',
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return soalNo1();
                  }));
                },
                child: const Text('   Jawaban No 1   '),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return soalNo2();
                  }));
                },
                child: const Text('   Jawaban No 2   '),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.category;
      case 2:
        return Icons.qr_code;
      case 3:
        return Icons.shopping_basket;
      case 4:
        return Icons.account_circle;
      default:
        return Icons.home;
    }
  }

  //jawaban no 1
  Widget soalNo1() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Colors.grey[200],
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 260,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(222, 242, 203, 29),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [],
              ),
            ),
            Positioned(
              top: 70,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Budi Martami',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/profil.jpg'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Ubah Profile',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nama Depan',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nama Belakang',
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Gender',
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      value: _selectedGender,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedGender = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        '',
                                        'Laki-Laki',
                                        'Perempuan'
                                      ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left:
                                                      8.0), // Tambahkan padding kiri di sini
                                              child: Text(value),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Tanggal Lahir',
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                _dateController, // Tambahkan controller ke TextFormField
                                            readOnly:
                                                true, // Tidak dapat diedit langsung oleh pengguna
                                            decoration: InputDecoration(
                                              hintText: 'DD/MM/YYYY',
                                              border: OutlineInputBorder(),
                                              suffixIcon: IconButton(
                                                icon:
                                                    Icon(Icons.calendar_today),
                                                onPressed: () {
                                                  _selectDate(context);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Alamat',
                          ),
                        ),
                        SizedBox(height: 100),
                        Padding(
                          padding: EdgeInsets.all(20), //20 pixel ke semua arah
                          child: SizedBox(
                            width: 10, // Lebar tombol
                            height: 60, // Tinggi tombol
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(222, 253, 212, 31),
                                side: BorderSide(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text(
                                  'Simpan',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(
            _selectedDate!); // Update nilai controller dengan tanggal yang dipilih
      });
    }
  }

  //jawaban no 2
  // Widget soalNo2
  Widget soalNo2() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.0, // Set desired height for inner container
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: () {},
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Cari barang di Toko',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {},
                          color:
                              Colors.white, // Memberikan warna putih pada ikon
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications),
                          onPressed: () {},
                          color:
                              Colors.white, // Memberikan warna putih pada ikon
                        ),
                        IconButton(
                          icon: Icon(Icons.chat),
                          onPressed: () {},
                          color:
                              Colors.white, // Memberikan warna putih pada ikon
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Widget lain di bawah Container
          SizedBox(height: 20),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Budi!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.wallet),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                      width: 5), // Spasi antara ikon dan teks
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Store'),
                                      Text('Credit'),
                                      Text('Rp.0'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            // Add divider after first column
                            thickness: 1,
                            color: Colors.black26,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.discount),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                      width: 5), // Spasi antara ikon dan teks
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Reward'),
                                      Text('Point'),
                                      Text('100 Point'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            // Add divider after first column
                            thickness: 1,
                            color: Colors.black26,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.card_giftcard),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                      width: 5), // Spasi antara ikon dan teks
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Kupon'),
                                      Text('Saya'),
                                      Text('11 Kupon'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.store, size: 50.0),
                            onPressed: () {},
                          ),
                          Text('Official Store'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.local_fire_department,
                                size: 50.0, color: Colors.orange[900]),
                            onPressed: () {},
                          ),
                          Text('Hot Deal'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.shopping_bag, size: 50.0),
                            onPressed: () {},
                          ),
                          Text('Fashion'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            icon:
                                Icon(Icons.face_retouching_natural, size: 50.0),
                            onPressed: () {},
                          ),
                          Text('Kosmetik'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset('assets/left_image.png'),
                    ),
                    Expanded(
                      child: Image.asset('assets/right_image.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Tambahkan widget lain di bawah Container
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home),
              color: _selectedIndex == 0 ? Colors.yellow[600] : Colors.black,
              onPressed: () => _onItemTapped(0),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.category),
              color: _selectedIndex == 1 ? Colors.yellow[600] : Colors.black,
              onPressed: () => _onItemTapped(1),
            ),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.qr_code),
              color: _selectedIndex == 2 ? Colors.yellow[600] : Colors.black,
              onPressed: () => _onItemTapped(2),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.shopping_basket),
              color: _selectedIndex == 3 ? Colors.yellow[600] : Colors.black,
              onPressed: () => _onItemTapped(3),
            ),
            label: 'List Belanja',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.account_circle),
              color: _selectedIndex == 4 ? Colors.yellow[600] : Colors.black,
              onPressed: () => _onItemTapped(4),
            ),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow[600],
        onTap: _onItemTapped,
        mouseCursor: SystemMouseCursors.click,
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      // Berdasarkan indeks yang dipilih, arahkan ke halaman yang sesuai
      switch (index) {
        case 0:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => MyHomePage(title: 'Beranda')),
          );
          break;
        case 1:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PageWidget('Kategori')),
          );
          break;
        case 2:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PageWidget('Scan')),
          );
          break;
        case 3:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PageWidget('List Belanja')),
          );
          break;
        case 4:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PageWidget('Akun')),
          );
          break;
        default:
          break;
      }
    }
  }
}

class PageWidget extends StatelessWidget {
  final String title;

  PageWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke widget soalNo2
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}