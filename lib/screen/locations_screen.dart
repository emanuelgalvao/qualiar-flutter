import 'package:air_pollution_app/data/location_list.dart';
import 'package:air_pollution_app/utils/app_icons.dart';
import 'package:air_pollution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locationsProvider = Provider.of<LocationList>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        title: Text('Localizações'),
        actions: [
          IconButton(
            onPressed: () {
              if (locationsProvider.count >= 5) {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog.adaptive(
                      title: const Text('Máximo atingido!'),
                      content: const Text(
                          'Você pode ter no máximo 5 localidades!\nExclua alguma caso deseje adicionar uma nova!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Ok'),
                        ),
                      ],
                    );
                  },
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
                  title: Text('${location.name}, ${location.uf}'),
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
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog.adaptive(
                                    title: const Text('Erro ao excluir!'),
                                    content: const Text(
                                        'Você não pode excluir seu local favorito!\nEscolha outro local favorito antes de exluir esse!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
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
