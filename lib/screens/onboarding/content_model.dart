class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Busca por Estágios',
      image: 'images/onboarding1.png',
      discription: "encontre a vaga de estágio ideal para você"
          "receba as melhores oportunidades "
          "para iniciar sua carreira "),
  UnbordingContent(
    title: 'As melhores vagas',
    image: 'images/onboarding1.png',
    discription: "você terá acesso as melhores oportunidades"
        "de estagio disponiveis na sua regiao ",
  ),
  UnbordingContent(
    title: 'Praticidade ',
    image: 'images/onboarding2.jpg',
    discription: "envie seu curriculo e candidate-se"
        "diretamente pelo aplicativo",
  ),
];
