import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget{
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(8.0)
        )
      ),
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          Text(
            "Sobre",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16.0),
          Text(
            "Aluno de Engenharia de Computação no Instuto Mauá de Tecnologia, atualmente no segundo ano do curso.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16.0),
          Text(
            "Atualmente participo de duas entidades acadêmicas:",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "Kimauánisso: Equipe de robótica focada na participação de competições.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "Nawat Games: Entidade de desenvolvimento de jogos usando Unity.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16.0),
          Text(
            "Me interesso pela área de desenvolvimento de software, tendo interesse em projetos de código aberto",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}