import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabit/core/router.dart';
import 'package:tabit/features/characters/domain/utils/characters_constants.dart';
import 'package:tabit/features/characters/presentation/providers/updated_characters.dart';
import 'package:tabit/features/characters/presentation/widgets/list_tiles/character_list_tile.dart';

import '../../../domain/models/rick_and_morty_response.dart';

class AllCharactersScreen extends ConsumerStatefulWidget {
  const AllCharactersScreen({super.key});
  @override
  AllCharactersScreenState createState() => AllCharactersScreenState();
}

class AllCharactersScreenState extends ConsumerState<AllCharactersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animation?.addListener(() {
      if (_tabController.index == _tabController.animation?.value.round()) {
        _onTabChanged(_tabController.index);
      }
    });
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    CharacterStatus? status;
    switch (index) {
      case 1:
        status = CharacterStatus.alive;
        break;
      case 2:
        status = CharacterStatus.dead;
        break;
      case 3:
        status = CharacterStatus.unknown;
        break;
      default:
        status = null; // All
    }
    ref
        .read(updatedCharactersProvider.notifier)
        .filterOrSearchCharacters(status, _searchController.text);
  }

  void _onSearchChanged() {
    ref.read(updatedCharactersProvider.notifier).filterOrSearchCharacters(
        _getStatusFromTabIndex(), _searchController.text);
  }

  CharacterStatus? _getStatusFromTabIndex() {
    switch (_tabController.index) {
      case 1:
        return CharacterStatus.alive;
      case 2:
        return CharacterStatus.dead;
      case 3:
        return CharacterStatus.unknown;
      default:
        return null;
    }
  }

  void _onScroll() {
    var notifier = ref.read(updatedCharactersProvider.notifier);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !notifier.isSearching) {
      notifier.getCharactersByPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    var updatedCharacters = ref.watch(updatedCharactersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Characters'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Alive'),
            Tab(text: 'Dead'),
            Tab(text: 'Unknown'),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: updatedCharacters.when(
              data: (data) {
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: data.length + 1,
                  itemBuilder: (context, index) {
                    if (index == data.length) {
                      // Show loader only if more pages exist and not filtering or searching
                      final notifier =
                          ref.read(updatedCharactersProvider.notifier);
                      final shouldShowLoader =
                          notifier.currentPage != null && !notifier.isSearching;

                      return shouldShowLoader
                          ? const Center(child: CircularProgressIndicator())
                          : const SizedBox.shrink();
                    }
                    Character character = data[index];
                    return InkWell(
                        onTap: () {
                          router.push(characterDetailPath, extra: character);
                        },
                        child: CharacterListTile(character: character));
                  },
                );
              },
              error: (error, __) => Center(child: Text('$error')),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
