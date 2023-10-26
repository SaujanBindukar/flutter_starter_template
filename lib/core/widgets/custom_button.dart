import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.name,
    this.backgroundColor,
    required this.onPressed,
    this.padding,
    this.textColor,
    this.isLoading = false,
    this.enabledShadow = false,
    this.remove = false,
    this.textSize = 15,
    this.buttonHeight = 50,
    this.fontWeight = FontWeight.w600,
  });

  const CustomButton.text({
    super.key,
    required this.name,
    required this.onPressed,
    this.padding,
    this.isLoading = false,
    this.enabledShadow = false,
    this.remove = false,
    this.textSize = 15,
    this.buttonHeight = 50,
    this.fontWeight = FontWeight.w600,
    this.textColor,
  }) : backgroundColor = Colors.transparent;

  final String name;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? textColor;

  final EdgeInsetsGeometry? padding;
  final bool enabledShadow;
  final bool remove;

  final double textSize;
  final double buttonHeight;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: textColor ?? Colors.white,
                          fontWeight: fontWeight,
                          letterSpacing: 0.41,
                          fontSize: textSize,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
