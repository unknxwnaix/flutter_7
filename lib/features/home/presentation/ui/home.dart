import 'package:auto/features/home/presentation/state/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto/features/home/domain/entity/celebrity_entity.dart'; 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeController>().init();
  }

  void _search() {
    context.read<HomeController>().filterCelebrities(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Celebrity Info'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Celebrity',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _search,
                ),
              ),
            ),
          ),
          Expanded(
            child: controller.filteredCelebrities == null
                ? controller.errorMessage != null
                    ? Center(child: Text('Error: ${controller.errorMessage}'))
                    : const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.filteredCelebrities!.length,
                    itemBuilder: (context, index) {
                      final celebrity = controller.filteredCelebrities![index];
                      return ListTile(
                        title: Text(celebrity.name),
                        subtitle: Text('Net Worth: \$${celebrity.netWorth}'),
                        onTap: () => _showDetails(context, celebrity),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showDetails(BuildContext context, CelebrityEntity celebrity) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(celebrity.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Net Worth: \$${celebrity.netWorth}'),
              Text('Gender: ${celebrity.gender}'),
              Text('Nationality: ${celebrity.nationality}'),
              Text('Occupation: ${celebrity.occupation.join(', ')}'),
              Text('Height: ${celebrity.height} meters'),
              Text('Birthday: ${celebrity.birthday}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
