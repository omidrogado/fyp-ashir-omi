/// CONTRACT 4b: uniform bone names every .glb avatar must use. Proposed; Track B must sign off.
/// Finger joints 1..3 map onto the MediaPipe landmark chains (thumb: CMC/MCP/IP, others: MCP/PIP/DIP).
abstract final class AvatarBones {
  static const List<String> _body = <String>['Hips', 'Spine', 'Chest', 'Neck', 'Head'];
  static const List<String> _arm = <String>['Shoulder', 'UpperArm', 'LowerArm', 'Hand'];
  static const List<String> _fingers = <String>['Thumb', 'Index', 'Middle', 'Ring', 'Pinky'];

  static final List<String> all = _build();

  static List<String> _build() {
    final List<String> names = <String>[..._body];
    for (final String side in const <String>['Left', 'Right']) {
      for (final String part in _arm) {
        names.add('$side$part');
      }
      for (final String finger in _fingers) {
        for (int joint = 1; joint <= 3; joint++) {
          names.add('$side$finger$joint');
        }
      }
    }
    return List<String>.unmodifiable(names);
  }
}