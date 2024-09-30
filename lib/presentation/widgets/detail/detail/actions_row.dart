import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/icons/button_icons.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';

/// Тип действия кнопки
enum Action {
  /// Позвонить
  call,

  /// Написать
  message,

  /// Поделиться
  share;

  @override
  String toString() {
    switch (this) {
      case Action.call:
        return 'Позвонить';
      case Action.message:
        return 'Написать';
      case Action.share:
        return 'Поделиться';
    }
  }
}

/// Виджет строки действий
class ActionsRow extends StatelessWidget {
  /// Стандартный конструктор
  const ActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        spacing: 8,
        children: [
          _ActionButton(action: Action.call, onPressed: () {}),
          _ActionButton(action: Action.message, onPressed: () {}),
          _ActionButton(action: Action.share, onPressed: () {}),
        ],
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  const _ActionButton({
    required this.action,
    required this.onPressed,
  });

  final Action action;
  final VoidCallback onPressed;

  @override
  State<_ActionButton> createState() => __ActionButtonState();
}

class __ActionButtonState extends State<_ActionButton> {
  late WidgetStatesController _controller;
  final Map<Action, IconData> icons = {
    Action.call: ButtonIcons.phone,
    Action.share: ButtonIcons.share,
    Action.message: ButtonIcons.message,
  };

  @override
  void initState() {
    _controller = WidgetStatesController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (context, states, child) {
        return GestureDetector(
          onTap: widget.onPressed,
          onTapDown: (details) {
            _controller.update(WidgetState.pressed, true);
          },
          onTapUp: (details) {
            _controller.update(WidgetState.pressed, false);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            decoration: BoxDecoration(
              border: Border.all(color: context.myColorScheme.inactive),
              borderRadius: BorderRadius.circular(16),
              color: _colorResolver(states),
            ),
            child: Wrap(
              spacing: 8,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(icons[widget.action]),
                Text(
                  widget.action.toString(),
                  style: context.textTheme.label,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _colorResolver(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return context.myColorScheme.inactive;
    }
    return context.myColorScheme.surface;
  }
}
