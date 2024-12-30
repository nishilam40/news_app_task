import 'package:flutter/material.dart';

import 'package:news_app_task/controller/homescreen_controller.dart';
import 'package:news_app_task/view/dummy_db.dart';
import 'package:news_app_task/view/newsdetails_screen/newsdetails_screen.dart';
import 'package:news_app_task/view/newsdetails_screen/widgets/category_detail_screen.dart';
import 'package:provider/provider.dart';

class NewsHomePage extends StatefulWidget {
  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  // Controller for search functionality
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        context.read<HomeScreenController>().getNews(Dummydb.categories[0]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homescreenstate=context.watch<HomeScreenController>();
   
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Center(
          child: Text(
            'News Watch',
            style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
         
              setState(() {
                _searchQuery = _searchController.text;
              });
            },
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.bookmark_add_outlined)
        ],
      ),
      body: Consumer<HomeScreenController>(
        builder: (context, provider, child) {
        
          List filteredArticles = provider.articlesList
              .where((article) =>
                  article.title.toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
                  article.description.toString().toLowerCase().contains(_searchQuery.toLowerCase()))
              .toList();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search news...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (query) {
                    
                      setState(() {
                        _searchQuery = query;
                      });
                    },
                  ),
                ),

                // Categories Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Categories',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.blue)),
                ),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Dummydb.categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryDetailPage(
                                category: Dummydb.categories[index],
                                title: provider.articlesList[index].title.toString(),
                                author: provider.articlesList[index].author.toString(),
                                discription: provider.articlesList[index].description.toString(),
                                content: provider.articlesList[index].content.toString(),
                                imageUrl: provider.articlesList[index].urlToImage.toString(),
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Chip(
                            label: Text(Dummydb.categories[index]),
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      );
                    },
                  ),
                ),

       
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Main News', 
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                
                Container(
                  height: 350,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredArticles.length, 
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailsScreen(
                                title: filteredArticles[index].title.toString(),
                                author: filteredArticles[index].author.toString(),
                                discription: filteredArticles[index].description.toString(),
                                imageUrl: filteredArticles[index].urlToImage.toString(),
                                content: filteredArticles[index].content.toString(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 300,
                          height: 500,
                          margin: EdgeInsets.all(8),
                          child: Card(
                            elevation: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  filteredArticles[index].urlToImage.toString(),
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    filteredArticles[index].title.toString(),
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    filteredArticles[index].description.toString(),
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Latest News',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredArticles.length, // Use filtered articles
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          leading: Image.network(
                            filteredArticles[index].urlToImage.toString(),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(filteredArticles[index].title.toString()),
                          subtitle: Text(filteredArticles[index].description.toString()),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}