import 'package:breakaway/constants/routes.dart';
import 'package:breakaway/data_storing/cities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class City {
  final String name;
  final String state;

  City({required this.name, required this.state});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      state: json['state'],
    );
  }
}

class RegionView extends StatefulWidget {
  const RegionView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegionViewState();
}

class _RegionViewState extends State<RegionView> {
  final _cityService = CityService();
  List<City> _cities = [];
  List<City> _filteredCities = [];
  City? _selectedCity;
  late TextEditingController _searchController;
  bool _showDropdown = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _fetchCities();
  }

  Future<void> _fetchCities() async {
    try {
      final cities = await _cityService.fetchCities();
      setState(() {
        _cities = cities;
        _filteredCities = cities;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void _filterCities(String query) {
    setState(() {
      _filteredCities = _cities
          .where((city) =>
              city.name.toLowerCase().contains(query.toLowerCase()) ||
              city.state.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _selectCity(City city) {
    setState(() {
      _selectedCity = city;
      _showDropdown = false;
      _searchController.text = '${city.name}, ${city.state}';
    });
  }

  void _toggleDropdown() {
    setState(() {
      _showDropdown = !_showDropdown;
      if (_showDropdown) {
        _filterCities(_searchController.text);
      } else {
        _filteredCities = _cities;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFCEDDD),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child:
                    SvgPicture.asset('assets/Logo.svg', width: 80, height: 80),
              ),
              const SizedBox(
                height: 70,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFFFFDEB9),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onTap: _toggleDropdown,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF7149C6),
                      ),
                      hintText: 'Location',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      suffixIcon: _showDropdown
                          ? IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Color(0xFF7149C6),
                              ),
                              onPressed: _toggleDropdown,
                            )
                          : null,
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              if (_showDropdown)
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredCities.length,
                    itemBuilder: (context, index) {
                      final city = _filteredCities[index];
                      return ListTile(
                        title: Text('${city.name}, ${city.state}'),
                        onTap: () => _selectCity(city),
                      );
                    },
                  ),
                ),
              if (_selectedCity != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Selected City: ${_selectedCity!.name}, ${_selectedCity!.state}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(hobbiesViewRoute);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7149C6),
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
