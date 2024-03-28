import 'package:air_pollution_app/data/location_list.dart';
import 'package:air_pollution_app/utils/app_icons.dart';
import 'package:air_pollution_app/utils/app_routes.dart';
import 'package:air_pollution_app/utils/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locationsProvider = Provider.of<LocationList>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Meus Locais'),
        actions: [
          IconButton(
            onPressed: () {
              if (locationsProvider.count >= 5) {
                showAdaptativeDialog(
                  context,
                  'Máximo atingido!',
                  'Você pode ter no máximo 5 locais!\nExclua algum caso deseje adicionar um novo!',
                );
                return;
              } else {
                Navigator.of(context).pushNamed(AppRoutes.addLocation);
              }
            },
            icon: Icon(AppIcons.add),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: locationsProvider.count,
          itemBuilder: (ctx, index) {
            final location = locationsProvider.locations[index];
            return Column(
              children: [
                ListTile(
                  title: Text(
                    '${location.name}, ${location.uf}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            locationsProvider.handleFavorite(location.id);
                          },
                          icon: Icon(
                            AppIcons.favorite,
                            color: location.isFavorite
                                ? Colors.deepOrange
                                : Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (location.isFavorite) {
                              showAdaptativeDialog(
                                context,
                                'Erro ao excluir!',
                                'Você não pode excluir seu local favorito!\nEscolha outro local como favorito antes de exluir esse!',
                              );
                            } else {
                              locationsProvider.removeLocation(location.id);
                            }
                          },
                          icon: Icon(
                            AppIcons.delete,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
              ],
            );
          }),
    );
  }
}
