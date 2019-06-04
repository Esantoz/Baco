import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';

Color firstColor = Color(0xff311b92);
Icon hicon;

class SearchIcon extends StatefulWidget implements PreferredSizeWidget{
  @override
  State<StatefulWidget> createState() {
    return _SearchIconState();
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);


}

class _SearchIconState extends State<SearchIcon> {
  final List<String> nomesEventos = ["whoami", "enigma", "end game"];
  _MySearchDelegate _delegate;//testes

  @override
  void initState(){
    super.initState();
    _delegate = _MySearchDelegate(nomesEventos);
  }


  Widget _appBarTitle = Text("Baco",style: TextStyle(color: firstColor,fontWeight: FontWeight.bold),);
  Icon _searchIcon = Icon(Icons.search,);
  final TextEditingController _filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: IconThemeData(color: firstColor),
        backgroundColor: Colors.white.withOpacity(0.5),
        title: Center(
            child: _appBarTitle
        ),
        actions: <Widget>[
          IconButton(
            tooltip: "Buscar...",
            icon: _searchIcon,
            onPressed: () async {
              final String selected = await showSearch<String>(
                context: context,
                delegate: _delegate,
              );
            },
          )
        ]
    );
  }
}

class _MySearchDelegate extends SearchDelegate<String>{
  final List<String> _words;
  final List<String> _history;

  _MySearchDelegate(List<String> words)
    : _words = words,
    _history = <String>[],
    super();


  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty
          ?IconButton(
        tooltip: "Voice Search",
        icon: const Icon(Icons.mic),
        onPressed: (){
          this.query = "TODO: implement voice input";
        },
      )
          :IconButton(
        tooltip: "Clear",
        icon: const Icon(Icons.clear),
        onPressed: (){
          query = "";
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        this.close(context, null);
      },
    );


  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                this.close(context, this.query);
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion){
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

}

class _SuggestionList extends StatelessWidget{
  const _SuggestionList({this.suggestions, this.query,this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context,int i){
          final String suggestion = suggestions[i];
          return ListTile(
            leading: query.isEmpty ? Icon(Icons.history) : Icon(null),

            title: RichText(
              text: TextSpan(
                text: suggestion.substring(0,query.length),
                style: textTheme.copyWith(fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: suggestion.substring(query.length),
                    style: textTheme,
                  )
                ]
              ),
            ),
            onTap: (){
              onSelected(suggestion);
            },
          );
        },
    );
  }

}




