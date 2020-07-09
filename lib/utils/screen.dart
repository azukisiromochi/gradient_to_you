enum Screen {
  colorPalette,
  gradientBuilder,
  imagePicker,
  gradientFilter,
  writeMessage,
  saveOrShare,
}

extension ScreensExtension on Screen {
  String get name {
    switch (this) {
      case Screen.colorPalette:
        return 'color_palette';
        break;
      case Screen.gradientBuilder:
        return 'gradient_builder';
        break;
      case Screen.imagePicker:
        return 'image_picker';
        break;
      case Screen.gradientFilter:
        return 'gradient_filter';
        break;
      case Screen.writeMessage:
        return 'write_message';
        break;
      case Screen.saveOrShare:
        return 'save_or_share';
        break;
    }
  }

  String get url => '/$name';
}
