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
        'welcome to 2023,the year when are voice  will count, we can only speak with our  voters card',
    tags: ['#knownyourworth'],
    imagePath: 'ksih.png',
  ),
  Election(
      description:
          'Let’s all make this election our collective responsibility to have a free and fair credible election that’ll count.',
      tags: ['#holdingourleadersbytheirwords'],
      imagePath: 'yar_adua.png'),
  Election(
      description:
          'The official announcement has been made on when the presidential election will be held.',
      tags: ['#electionday'],
      imagePath: 'inec.png'),
  Election(
      description:
          'the governed can be reach here on every angle on the planet.',
      tags: ['#ParrotBox', '#election', '#makingEveryElectionCount'],
      imagePath: 'parrotbox.png'),
  Election(
      description:
          'welcome to 2023,the year when are voice  will count, we can only speak with our  voters card',
      tags: ['#knownyourworth'],
      imagePath: 'ksih.png'),
];
