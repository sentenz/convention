# App Resources

Resources are additional files and static content used in the code, such as bitmaps, layout definitions, user interface strings and values, animation instructions, and more.

- [Resource Types](#resource-types)
- [Resource Syntax](#resource-syntax)
- [See also](#see-also)

Always externalize app resources such as images and strings from the code, so that you can maintain them independently. Also provide alternative resources for specific device configurations, by grouping them in specially-named resource directories.

## Resource Types

Place each type of resource in a specific subdirectory of the project's `resource/` directory.

Resource directories supported inside project `resource/` directory.

| Directory | Resource Type                                                     |
| --------- | ----------------------------------------------------------------- |
| animator/ | Files that define property animations.                            |
| color/    | Files that define a state list of colors.                         |
| drawable/ | Bitmap files (.png, .jpg, .gif).                                  |
| mipmap/   | Drawable files for different launcher icon densities.             |
| layout/   | Files that define a user interface layout.                        |
| menu/     | Files that define app menus.                                      |
| raw/      | Arbitrary files to save in their raw form.                        |
| values/   | Files that contain values, such as strings, integers, and colors. |
| xml/      | Arbitrary XML files that can be read at runtime.                  |
| font/     | Font files.                                                       |

## Resource Syntax

The syntax to reference a resource in code:

```bash
[<package_name>.]<resource_type>.<resource_name>
```

- `package_name` is the name of the package in which the resource is located.
- `resource_type` is the subclass for the resource type.
- `resource_name` is either the resource filename without the extension or the name attribute value.

## See also

- Android [app resources](https://developer.android.com/guide/topics/resources/providing-resources) article.
- Android [resource types](https://developer.android.com/guide/topics/resources/available-resources) article.
- Microsoft [app resources](https://docs.microsoft.com/en-us/windows/uwp/app-resources/) article.
