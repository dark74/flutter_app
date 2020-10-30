import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();

    return new MaterialApp(
      title: "Welcome to Flutter",
      theme: new ThemeData(primaryColor: Colors.deepPurple),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Welcome to Flutter T",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordState();
  }
}

class RandomWordState extends State<RandomWords> {
  final _suggestWords = <WordPair>[];
  final _bigFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text('Startup Name Generator')),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  ///路由跳转已收藏item的页面
  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(pair.asPascalCase, style: _bigFont),
        );
      });
      final dividers =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
          appBar: new AppBar(
            title: new Text("Saved Suggestions"),
          ),
          body: new ListView(
            children: dividers,
          ));
    }));
  }

  ///构建ListView
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          if (index.isOdd) return new Divider();
          final wordCounts = index ~/ 2; //除以2向下取整,计算出ListView中减去分隔线后的实际单词对数量
          if (wordCounts >= _suggestWords.length) {
            _suggestWords.addAll(generateWordPairs().take(10)); //再生成10个单词加到数据源中
          }
          return _buildRow(_suggestWords[wordCounts]); //根据数据源构建view返回
        });
  }

  ///主页的ListView每行
  Widget _buildRow(WordPair wordPair) {
    bool already = _saved.contains(wordPair);
    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        style: _bigFont,
      ),
      trailing: new Icon(
        already ? Icons.favorite : Icons.favorite_border,
        color: already ? Colors.red : Colors.black12,
      ),
      onTap: () {
        setState(() {
          if (already) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }
}
