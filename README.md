# animated_confirm_dialog

A customizable Flutter package for displaying confirmation dialogs with optional 3D flip animations and modern UI. This package allows you to easily show stylish confirmation dialogs with a clean and modern design, making it highly customizable.

## Features

- **Customizable Dialogs**: Easily adjust the title, message, and button text.
- **Animations**: Includes optional 3D flip animation for dialog transitions.
- **Modern UI**: A visually appealing, modern design with customizable button styles and colors.
- **Dismissable**: Optionally control if the dialog can be dismissed by tapping outside.

## Demo Video

![Demo Video](<https://raw.githubusercontent.com/MilakeSuraj/animated_confirm_dialog/master/Screen%20Recording%202025-01-27%20170706%20(1).gif>)

## Getting Started

To use `animated_confirm_dialog` in your Flutter project, follow these simple steps.

### Prerequisites

Before starting, ensure that you have the following installed:

- Flutter SDK: `>=3.0.0`
- Dart SDK: `>=3.1.3 <4.0.0`

### Installation

1. Open your `pubspec.yaml` file.
2. Under `dependencies`, add the following line:

```yaml
dependencies:
  animated_confirm_dialog: ^1.0.0
```

### Usage

Once you’ve installed the package, you can use the showCustomDialog function to display the confirmation dialog. Here’s an example of how to use it:

```dart
import 'package:animated_confirm_dialog/animated_confirm_dialog.dart';

 showCustomDialog(
              context: context,
              title: 'Delete Item?',
              message: 'Are you sure you want to delete this item?',
              cancelButtonText: 'No',
              confirmButtonText: 'Yes',
              cancelButtonColor: Colors.red,
              cancelButtonTextColor: Colors.white,
              confirmButtonColor: Colors.green,
              confirmButtonTextColor: Colors.white,
              onCancel: () {
                // Action when cancel button is pressed
                Navigator.of(context).pop();
              },
              onConfirm: () {
                // Action when confirm button is pressed
                Navigator.of(context).pop();
              },
              isFlip: true, // You can set isFlip to true for 3D rotation effect
            );

```

## Customization

You can customize various aspects of the dialog by passing different parameters. Below is a list of customizable options:

| Parameter                    | Description                                                      | Default                               |
| ---------------------------- | ---------------------------------------------------------------- | ------------------------------------- |
| **`title`**                  | The title of the dialog.                                         | `'Logout Confirmation'`               |
| **`message`**                | The message displayed inside the dialog.                         | `'Are you sure you want to log out?'` |
| **`cancelButtonText`**       | Text for the cancel button.                                      | `'Cancel'`                            |
| **`confirmButtonText`**      | Text for the confirm button.                                     | `'Logout'`                            |
| **`backgroundColor`**        | Background color of the dialog.                                  | `Color(0xFFF5F5F5)`                   |
| **`titleColor`**             | Color of the title text.                                         | `Color(0xFF000000)`                   |
| **`messageColor`**           | Color of the message text.                                       | `Color(0xFF000000)`                   |
| **`cancelButtonColor`**      | Background color of the cancel button.                           | `Color(0xFF007BFF)`                   |
| **`cancelButtonTextColor`**  | Color of the cancel button text.                                 | `Colors.white`                        |
| **`confirmButtonColor`**     | Background color of the confirm button.                          | `Colors.white`                        |
| **`confirmButtonTextColor`** | Color of the confirm button text.                                | `Color(0xFF007BFF)`                   |
| **`onCancel`**               | A callback function triggered when the cancel button is tapped.  | `null (no action)`                    |
| **`onConfirm`**              | A callback function triggered when the confirm button is tapped. | `null (no action)`                    |
| **`isFlip`**                 | Enables a 3D flip animation when the dialog is shown.            | `false`                               |
| **`dismissible`**            | Controls whether the dialog can be dismissed by tapping outside. | `true`                                |

## Licence

This project is licensed under the MIT License. You can view the full license in the [LICENSE](LICENSE) file.

## Support the Library

You can support the library by:

- Liking it on [pub.dev](https://pub.dev/packages/animated_confirm_dialog)
- Starring it on [GitHub](https://github.com/MilakeSuraj/animated_confirm_dialog)
- Reporting any bugs you encounter on [GitHub Issues](https://github.com/MilakeSuraj/animated_confirm_dialog/issues)

```

```
