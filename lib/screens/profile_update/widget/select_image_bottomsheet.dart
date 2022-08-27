import 'package:building_ui/exports/exports.dart';

Future selectImageModal(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Wrap(
        children: const [
          ListTile(
            leading: Icon(Icons.camera_alt_outlined),
            title: Text('Camera'),
          ),
          ListTile(
            leading: Icon(Icons.browse_gallery),
            title: Text('Gallery'),
          ),

        ],
      );
    },
  );
}
