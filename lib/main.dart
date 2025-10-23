import 'package:flutter/material.dart';

void main() {
  runApp(const EnglishLearningApp());
}

class EnglishLearningApp extends StatelessWidget {
  const EnglishLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Learning App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4361EE),
          primary: const Color(0xFF4361EE),
          secondary: const Color(0xFF3A0CA3),
          tertiary: const Color(0xFF7209B7),
          background: const Color(0xFFF8F9FA),
          surface: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4361EE),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const VocabularyScreen(),
    const GrammarScreen(),
    const ReadingScreen(),
    const ExerciseScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.language, size: 28),
            SizedBox(width: 8),
            Text(
              'LinguaLearn',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8F9FA),
              Color(0xFFE9ECEF),
            ],
          ),
        ),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF4361EE),
          unselectedItemColor: const Color(0xFF6C757D),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.wordpress_rounded),
              activeIcon: Icon(Icons.wordpress_rounded, size: 28),
              label: 'Vocabulary',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              activeIcon: Icon(Icons.menu_book_rounded, size: 28),
              label: 'Grammar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_rounded),
              activeIcon: Icon(Icons.article_rounded, size: 28),
              label: 'Reading',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz_rounded),
              activeIcon: Icon(Icons.quiz_rounded, size: 28),
              label: 'Exercises',
            ),
          ],
        ),
      ),
    );
  }
}

// Vocabulary Screen with enhanced design
class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  final List<VocabularyCategory> categories = const [
    VocabularyCategory(
      title: 'Basic Words',
      icon: Icons.chat_rounded,
      color: Color(0xFF4361EE),
      words: ['Hello', 'Goodbye', 'Thank you', 'Please', 'Sorry'],
      translations: ['Hola', 'Adiós', 'Gracias', 'Por favor', 'Lo siento'],
    ),
    VocabularyCategory(
      title: 'Food & Drinks',
      icon: Icons.restaurant_rounded,
      color: Color(0xFF4CC9F0),
      words: ['Apple', 'Water', 'Bread', 'Coffee', 'Rice'],
      translations: ['Manzana', 'Agua', 'Pan', 'Café', 'Arroz'],
    ),
    VocabularyCategory(
      title: 'Family',
      icon: Icons.family_restroom_rounded,
      color: Color(0xFF7209B7),
      words: ['Mother', 'Father', 'Brother', 'Sister', 'Friend'],
      translations: ['Madre', 'Padre', 'Hermano', 'Hermana', 'Amigo'],
    ),
    VocabularyCategory(
      title: 'Numbers',
      icon: Icons.numbers_rounded,
      color: Color(0xFFF72585),
      words: ['One', 'Two', 'Three', 'Four', 'Five'],
      translations: ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'],
    ),
    VocabularyCategory(
      title: 'Colors',
      icon: Icons.palette_rounded,
      color: Color(0xFF3A0CA3),
      words: ['Red', 'Blue', 'Green', 'Yellow', 'Black'],
      translations: ['Rojo', 'Azul', 'Verde', 'Amarillo', 'Negro'],
    ),
    VocabularyCategory(
      title: 'Animals',
      icon: Icons.pets_rounded,
      color: Color(0xFF4895EF),
      words: ['Dog', 'Cat', 'Bird', 'Fish', 'Horse'],
      translations: ['Perro', 'Gato', 'Pájaro', 'Pez', 'Caballo'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF4361EE),
                Color(0xFF3A0CA3),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vocabulary Builder',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Learn essential English words and phrases',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Categories Grid
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return VocabularyCategoryCard(category: categories[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class VocabularyCategory {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> words;
  final List<String> translations;

  const VocabularyCategory({
    required this.title,
    required this.icon,
    required this.color,
    required this.words,
    required this.translations,
  });
}

class VocabularyCategoryCard extends StatelessWidget {
  final VocabularyCategory category;

  const VocabularyCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          _showCategoryWords(context, category);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category.color.withOpacity(0.1),
                category.color.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: category.color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  category.icon,
                  size: 32,
                  color: category.color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                category.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: category.color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                '${category.words.length} words',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCategoryWords(BuildContext context, VocabularyCategory category) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    category.color,
                    category.color.withOpacity(0.8),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Icon(category.icon, color: Colors.white, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      category.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            // Words List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: category.words.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: category.color.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.volume_up_rounded,
                          color: category.color,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        category.words[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        category.translations[index],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right_rounded,
                        color: category.color,
                      ),
                      onTap: () {
                        // Would implement text-to-speech here
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Grammar Screen with enhanced design
class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  final List<GrammarLesson> lessons = const [
    GrammarLesson(
      title: 'Present Simple',
      description: 'Used for habits and general truths',
      icon: Icons.schedule_rounded,
      color: Color(0xFF4361EE),
      examples: [
        'I work every day.',
        'She likes coffee.',
        'They play football on weekends.'
      ],
    ),
    GrammarLesson(
      title: 'Past Simple',
      description: 'Used for completed actions in the past',
      icon: Icons.history_rounded,
      color: Color(0xFF7209B7),
      examples: [
        'I worked yesterday.',
        'She visited Paris last year.',
        'They finished their homework.'
      ],
    ),
    GrammarLesson(
      title: 'Future Simple',
      description: 'Used for future actions and predictions',
      icon: Icons.forward_rounded,
      color: Color(0xFF4CC9F0),
      examples: [
        'I will call you tomorrow.',
        'She will arrive at 8 PM.',
        'They will complete the project.'
      ],
    ),
    GrammarLesson(
      title: 'Present Continuous',
      description: 'Used for actions happening now',
      icon: Icons.play_arrow_rounded,
      color: Color(0xFFF72585),
      examples: [
        'I am reading a book.',
        'She is cooking dinner.',
        'They are watching TV.'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF7209B7),
                Color(0xFF3A0CA3),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Grammar Guide',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Master English grammar rules and structures',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Lessons List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              return GrammarLessonCard(lesson: lessons[index]);
            },
          ),
        ),
      ],
    );
  }
}

class GrammarLesson {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> examples;

  const GrammarLesson({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.examples,
  });
}

class GrammarLessonCard extends StatelessWidget {
  final GrammarLesson lesson;

  const GrammarLessonCard({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              lesson.color.withOpacity(0.05),
              lesson.color.withOpacity(0.02),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: lesson.color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(lesson.icon, color: lesson.color, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      lesson.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: lesson.color,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: lesson.color.withOpacity(0.5),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                lesson.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: lesson.color.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: lesson.color.withOpacity(0.1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Examples:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: lesson.color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...lesson.examples.map((example) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: 8,
                                color: lesson.color,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  example,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reading Screen with enhanced design
class ReadingScreen extends StatelessWidget {
  const ReadingScreen({super.key});

  final List<ReadingMaterial> readings = const [
    ReadingMaterial(
      title: 'My Daily Routine',
      level: 'Beginner',
      color: Color(0xFF4CC9F0),
      content: '''
I wake up at 7:00 every morning. First, I brush my teeth and take a shower. Then I have breakfast with my family. I usually eat eggs and toast for breakfast.

After breakfast, I go to work. I work in an office from 9:00 to 5:00. During my lunch break, I like to read a book or talk with my colleagues.

In the evening, I exercise for 30 minutes. Then I cook dinner and watch TV with my family. I go to bed at 11:00 PM.
''',
      questions: [
        'What time does the person wake up?',
        'What do they usually eat for breakfast?',
        'Where do they work?',
      ],
    ),
    ReadingMaterial(
      title: 'The Four Seasons',
      level: 'Elementary',
      color: Color(0xFF7209B7),
      content: '''
There are four seasons in a year: spring, summer, autumn, and winter.

Spring is from March to May. The weather becomes warmer and flowers bloom. Summer is from June to August. It is hot and sunny. People go to the beach and swim.

Autumn is from September to November. Leaves change color and fall from trees. Winter is from December to February. It is cold and sometimes snows.
''',
      questions: [
        'How many seasons are there?',
        'Which season is from June to August?',
        'What happens to leaves in autumn?',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF4CC9F0),
                Color(0xFF4361EE),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reading Practice',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Improve your comprehension with engaging texts',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Reading Materials
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: readings.length,
            itemBuilder: (context, index) {
              return ReadingMaterialCard(material: readings[index]);
            },
          ),
        ),
      ],
    );
  }
}

class ReadingMaterial {
  final String title;
  final String level;
  final Color color;
  final String content;
  final List<String> questions;

  const ReadingMaterial({
    required this.title,
    required this.level,
    required this.color,
    required this.content,
    required this.questions,
  });
}

class ReadingMaterialCard extends StatelessWidget {
  final ReadingMaterial material;

  const ReadingMaterialCard({super.key, required this.material});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              material.color.withOpacity(0.05),
              material.color.withOpacity(0.02),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      material.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: material.color,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: material.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      material.level,
                      style: TextStyle(
                        color: material.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                material.content,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: material.color.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: material.color.withOpacity(0.1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.quiz_rounded, color: material.color, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Comprehension Questions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: material.color,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...material.questions.map((question) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: 8,
                                color: material.color,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  question,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Exercise Screen with enhanced design
class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int _currentExerciseIndex = 0;
  int _score = 0;
  String? _selectedAnswer;

  final List<Exercise> exercises = [
    Exercise(
      question: 'Choose the correct verb: I ___ to school every day.',
      options: ['go', 'goes', 'going', 'went'],
      correctAnswer: 'go',
    ),
    Exercise(
      question: 'What is the past tense of "eat"?',
      options: ['eated', 'ate', 'eaten', 'eating'],
      correctAnswer: 'ate',
    ),
    Exercise(
      question: 'Which sentence is correct?',
      options: [
        'She don\'t like coffee.',
        'She doesn\'t like coffee.',
        'She not like coffee.',
        'She no like coffee.'
      ],
      correctAnswer: 'She doesn\'t like coffee.',
    ),
    Exercise(
      question: 'Complete the sentence: There ___ many books on the table.',
      options: ['is', 'am', 'are', 'be'],
      correctAnswer: 'are',
    ),
  ];

  void _checkAnswer() {
    if (_selectedAnswer == exercises[_currentExerciseIndex].correctAnswer) {
      setState(() {
        _score++;
      });
      _showResultDialog(true);
    } else {
      _showResultDialog(false);
    }
  }

  void _nextExercise() {
    setState(() {
      if (_currentExerciseIndex < exercises.length - 1) {
        _currentExerciseIndex++;
        _selectedAnswer = null;
      } else {
        _showFinalScore();
      }
    });
  }

  void _showResultDialog(bool isCorrect) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Icon(
          isCorrect ? Icons.check_circle_rounded : Icons.error_rounded,
          size: 64,
          color: isCorrect ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
        ),
        content: Text(
          isCorrect ? 'Excellent! 🎉' : 'Try Again! 😔',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _nextExercise();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4361EE),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }

  void _showFinalScore() {
    double percentage = (_score / exercises.length) * 100;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Icon(
          percentage >= 70 ? Icons.celebration_rounded : Icons.school_rounded,
          size: 64,
          color: percentage >= 70 ? const Color(0xFFFFD700) : const Color(0xFF4361EE),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Quiz Completed!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Your score: $_score/${exercises.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${percentage.toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentExerciseIndex = 0;
                  _score = 0;
                  _selectedAnswer = null;
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4361EE),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Restart Quiz'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentExercise = exercises[_currentExerciseIndex];
    final progress = (_currentExerciseIndex + 1) / exercises.length;

    return Column(
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFF72585),
                Color(0xFF7209B7),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Practice Exercises',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Test your knowledge and track your progress',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Progress and Question
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Question ${_currentExerciseIndex + 1}/${exercises.length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6C757D),
                      ),
                    ),
                    Text(
                      'Score: $_score',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4361EE),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade200,
                  color: const Color(0xFF4361EE),
                  borderRadius: BorderRadius.circular(10),
                  minHeight: 8,
                ),
                const SizedBox(height: 32),
                // Question
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF4361EE),
                          Color(0xFF3A0CA3),
                        ],
                      ),
                    ),
                    child: Text(
                      currentExercise.question,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Options
                Expanded(
                  child: ListView(
                    children: currentExercise.options.map((option) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: _selectedAnswer == option
                                ? const Color(0xFF4361EE)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: RadioListTile<String>(
                          title: Text(
                            option,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: _selectedAnswer == option
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _selectedAnswer == option
                                  ? const Color(0xFF4361EE)
                                  : Colors.black87,
                            ),
                          ),
                          value: option,
                          groupValue: _selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              _selectedAnswer = value;
                            });
                          },
                          activeColor: const Color(0xFF4361EE),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _selectedAnswer != null ? _checkAnswer : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4361EE),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Submit Answer',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Exercise {
  final String question;
  final List<String> options;
  final String correctAnswer;

  const Exercise({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}