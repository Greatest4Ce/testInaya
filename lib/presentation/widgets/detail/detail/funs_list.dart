import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

/// Горизонтальный список включенных удобств
class FunsList extends StatelessWidget {
  /// Стандартный конструктор, в который необходимо передать
  /// [item] типа [ItemEntity]
  const FunsList({
    required this.item,
    super.key,
  });

  /// Элемент, развлечения которого буду отображаться
  final ItemEntity item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.funs.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: _FunCard(label: item.funs.elementAt(index)),
            );
          } else if (index <= item.funs.length - 1) {
            return _FunCard(label: item.funs.elementAt(index));
          } else {
            return const SizedBox(
              width: 20,
            );
          }
        },
      ),
    );
  }
}

class _FunCard extends StatelessWidget {
  const _FunCard({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 174, maxWidth: 140),
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage('assets/images/funs/$label.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              t.funsMap[label]!,
              style: context.textTheme.p,
            ),
          ),
        ],
      ),
    );
  }
}
