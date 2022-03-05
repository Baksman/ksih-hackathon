class Election {
  final String description;
  final List<String> tags;
  final String imagePath;

  Election(
      {required this.description, required this.tags, required this.imagePath});
}

final elections = [
  Election(
    description:
        'Rivers state budge for 2022',
    tags: ['#knownyourworth'],
    imagePath: 'ksih.png',
  ),
  Election(
      description:
          'NDDC Budget',
      tags: ['#2021'],
      imagePath: 'yar_adua.png'),
  Election(
      description:
          'NDDC budget',
      tags: ['#Niger delta'],
      imagePath: 'inec.png'),
  Election(
      description:
          'Delta state budget 2022',
      tags: ['#Asaba'],
      imagePath: 'parrotbox.png'),
  Election(
      description:
          'Bayelsa budget 2020',
      tags: ['#Bayelsa'],
      imagePath: 'ksih.png'),
];
