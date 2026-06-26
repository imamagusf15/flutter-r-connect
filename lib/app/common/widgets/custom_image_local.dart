import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageLocal extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  const CustomImageLocal({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final extension = imagePath.split('.').last.toLowerCase();

    if (extension == 'svg') {
      return _buildSvgImage();
    } else if (['png', 'jpg', 'jpeg'].contains(extension)) {
      return _buildAssetImage();
    } else {
      return _buildPlaceholder("Gambar tidak ditemukan");
    }
  }

  Widget _buildSvgImage() {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }

  Widget _buildAssetImage() {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }

  Widget _buildPlaceholder(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.broken_image, size: width ?? 50, color: Colors.redAccent),
          const SizedBox(height: 8),
          Text(
            message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
