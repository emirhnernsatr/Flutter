
import 'dart:io';

import 'package:flutter_learn/202/custom_excepsion.dart';

class FileDownload {
  bool? downloadFile(FileItem? fileItem) {
    if (fileItem == null) FileDownloadException();

    print('a');

    return null;
    }
  }

  class FileItem {
    final String name;
    final File file;

    FileItem (this.name, this.file);
  }