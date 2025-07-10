enum UpdateType { none, small, middle, large }

UpdateType getUpdateType(String local, String remote) {
  try {
    final localParts = local.trim().split('.');
    final remoteParts = remote.trim().split('.');

    if (localParts.length != 3 || remoteParts.length != 3) {
      return UpdateType.none;
    }

    final localMajor = int.parse(localParts[0]);
    final localMinor = int.parse(localParts[1]);
    final localPatch = int.parse(localParts[2]);

    final remoteMajor = int.parse(remoteParts[0]);
    final remoteMinor = int.parse(remoteParts[1]);
    final remotePatch = int.parse(remoteParts[2]);

    // Remote <= local
    if (remoteMajor < localMajor ||
        (remoteMajor == localMajor && remoteMinor < localMinor) ||
        (remoteMajor == localMajor &&
            remoteMinor == localMinor &&
            remotePatch <= localPatch)) {
      return UpdateType.none;
    }

    if (remoteMajor > localMajor) {
      return UpdateType.large;
    }

    if (remoteMinor > localMinor) {
      return UpdateType.middle;
    }

    return UpdateType.small;
  } catch (e) {
    return UpdateType.none;
  }
}
