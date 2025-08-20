
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool enabled; // Added enabled parameter

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.textInputAction,
    this.enabled = true, // Default to enabled
  });

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _isFocused = false;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: widget.enabled
                ? theme.colorScheme.onSurface
                : theme.colorScheme.onSurface.withValues(alpha:0.5),
          ),
        ),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: !widget.enabled
                  ? theme.colorScheme.outline.withValues(alpha: 0.1)
                  : _hasError
                  ? theme.colorScheme.error
                  : _isFocused
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline.withValues(alpha: 0.2),
              width: _isFocused && widget.enabled ? 2 : 1,
            ),
            color: !widget.enabled
                ? (isDark ? const Color(0xFF0F0F10) : const Color(0xFFF5F5F5))
                : (isDark ? const Color(0xFF1A1A1C) : const Color(0xFFF8F9FA)),
          ),
          child: TextFormField(
            controller: widget.controller,
            enabled: widget.enabled,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            validator: (value) {
              if (!widget.enabled) return null; // Skip validation when disabled
              final error = widget.validator?.call(value);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() => _hasError = error != null);
                }
              });
              return error;
            },
            onChanged: (value) {
              if (_hasError && widget.enabled) {
                setState(() => _hasError = false);
              }
            },
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: widget.enabled
                  ? theme.colorScheme.onSurface
                  : theme.colorScheme.onSurface.withValues(alpha:0.5),
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: widget.enabled
                    ? theme.colorScheme.onSurface.withValues(alpha:0.4)
                    : theme.colorScheme.onSurface.withValues(alpha:0.2),
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Icon(
                widget.icon,
                color: !widget.enabled
                    ? theme.colorScheme.onSurface.withValues(alpha:0.3)
                    : _isFocused
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface.withValues(alpha:0.4),
                size: 20,
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              border: InputBorder.none,
              isDense: true,
              errorStyle: const TextStyle(height: 0),
            ),
            onTap: widget.enabled
                ? () {
                    setState(() => _isFocused = true);
                    HapticFeedback.selectionClick();
                  }
                : null,
            onTapOutside: widget.enabled
                ? (_) => setState(() => _isFocused = false)
                : null,
            onFieldSubmitted: widget.enabled
                ? (_) => setState(() => _isFocused = false)
                : null,
          ),
        ),
      ],
    );
  }
}
