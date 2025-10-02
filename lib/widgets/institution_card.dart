import 'package:flutter/material.dart';
import '../models/institution.dart';

class InstitutionCard extends StatelessWidget {
  final Institution institution;

  const InstitutionCard({super.key, required this.institution});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(institution.name, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text('${institution.level} • ${institution.type}'),
                  const SizedBox(height: 2),
                  Text(institution.location, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: institution,
                );
              },
              icon: const Icon(Icons.info_outline),
              label: const Text('Ver detalles'),
            ),
          ],
        ),
      ),
    );
  }
}
