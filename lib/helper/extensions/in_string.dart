extension NameShortener on String {
  String shortenName() {
    List<String> words = split(' ');
    String initials = words.map((word) => word[0].toUpperCase()).join(' ');
    return initials;
  }

  String originalString() {
    return replaceAll('_', '').toLowerCase();
  }

  String capitalize() {
    return isNotEmpty
        ? '${this[0].toUpperCase()}${substring(1)}'.replaceAll('_', ' ')
        : '';
  }

  bool get isImageFile {
    // List of common image file extensions
    final List<String> imageExtensions = [
      'jpg',
      'jpeg',
      'png',
      'gif',
    ];

    // Extract the file extension from the string
    final String extension = split('.').last.toLowerCase();

    // Check if the extension is in the list of image extensions
    return imageExtensions.contains(extension);
  }

  bool get isPdfFile {
    // PDF file extension
    return endsWith('.pdf');
  }
}
