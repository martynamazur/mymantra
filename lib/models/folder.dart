class Folder{
  int folderId;
  String folderName;
  String folderColor;

  Folder(this.folderId, this.folderName, this.folderColor);

  Map<String, dynamic> toMap() {
    return {
      'folderId': this.folderId,
      'folderName': this.folderName,
    };
  }


}