import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onThemeChange;

  const HomeScreen({super.key, required this.onThemeChange});
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> notes = [];
  Future<void> _addNewNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNoteScreen(),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        notes.add(result);
      });
    }
  }
  bool _isDarkMode = false;
  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ColorNotes'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            IconButton(
            icon: Icon(
              _isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_fill,
            ),
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode; 
              });
              widget.onThemeChange(); 
            },
          ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              iconColor: Theme.of(context).colorScheme.primary,
              title: const Text('Ana Sayfa'),
              textColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.2,
          ),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteDetailScreen(
                      note: notes[index],
                      onUpdate: (updatedNote) {
                        setState(() {
                          notes[index] = updatedNote;
                        });
                      },
                      onDelete: () {
                        setState(() {
                          notes.removeAt(index);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );

                if (result == 'deleted') {
                  setState(() {
                    notes.removeAt(index);
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: notes[index]['color'],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            notes.removeAt(index);
                          });
                        },
                      ),
                    ),
                    Center(
                      child: Text(
                        notes[index]['content'],
                        style: const TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewNote,
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}



// Yeni not ekranı
class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _noteController = TextEditingController();
  Color? _selectedColor;

  final List<Color> _colors = const [
    Color(0xFF5ACBEB),
    Color(0xFFBCB0EE),
    Color(0xFFFBFF90),
    Color(0xFFFFADF0),
    Color(0xFFA9FF8A),
    Color(0xFF5773C6),
    Color(0xFF784F9E),
    Color(0xFFCF8CD1),
    Color(0xFFDE6B8F),
  ];

  void _saveNote() {
  if (_noteController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Lütfen bir not yazın.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary, // Tema rengini burada ayarlıyoruz
          ),
        ),
      ),
    );
    return;
  }

  if (_selectedColor == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Lütfen bir renk seçin.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary, // Tema rengini burada ayarlıyoruz
          ),
        ),
      ),
    );
    return;
  }

  Navigator.pop(context, {
    'content': _noteController.text,
    'color': _selectedColor,
  });
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Not Ekle'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bir renk seçin:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 229, 192, 255),),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _colors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: _selectedColor == color
                          ? Border.all(color: Colors.black, width: 2)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _noteController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  hintText: 'Notunuzu buraya yazın...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveNote,
              style: ElevatedButton.styleFrom(
              ),
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

// Not Detay Ekranı
class NoteDetailScreen extends StatefulWidget {
  final Map<String, dynamic> note;
  final Function(Map<String, dynamic>) onUpdate;
  final VoidCallback onDelete;

  const NoteDetailScreen({
    super.key,
    required this.note,
    required this.onUpdate,
    required this.onDelete,
  });

  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late TextEditingController _noteController;
  late Color _selectedColor;

  final List<Color> _colors = const [
    Color(0xFF5ACBEB),
    Color(0xFFBCB0EE),
    Color(0xFFFBFF90),
    Color(0xFFFFADF0),
    Color(0xFFA9FF8A),
    Color(0xFF5773C6),
    Color(0xFF784F9E),
    Color(0xFFCF8CD1),
    Color(0xFFDE6B8F),
  ];

  void initState() {
    super.initState();
    _noteController = TextEditingController(text: widget.note['content']);
    _selectedColor = widget.note['color'];
  }

  void _saveChanges() {
    if (_noteController.text.isNotEmpty) {
      widget.onUpdate({
        'content': _noteController.text,
        'color': _selectedColor,
      });
      Navigator.pop(context);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedColor,
      appBar: AppBar(
        title: const Text('Not Detayı'),
        backgroundColor: _selectedColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: widget.onDelete,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _noteController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Notunuzu düzenleyin...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Bir renk seçin:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _colors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: _selectedColor == color
                          ? Border.all(color: Colors.black, width: 2)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _saveChanges,
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}