## Description

Project contains batch scripts for Windows that automate file processing for retouching work.

Each script has a scenario description.

## Initial state

At the start, the situation is as follows:

- All RAW files (`*.NEF`) from the photoshoot are located in a folder that will be referred to as the `root` folder. The name of this folder doesn't matter; it can be, for example, in the format `yyyy-MM-dd description of photoshoot`.
- Inside the `root` folder, the following folders should be created:
    - `process` - for all processing rough files, such as `*.NEF`, `*PSD`, `*.TIFF`, and so on;
    - `result` - for storing final retouching results.

Scripts can be launched by double-clicking or in Command Promt/PowerShell/other tools opened from the containing folder with the command:
```bash
.\script_name.bat
```

### Configuration

In all scripts, there are configurable variables:
| Name | Default value | Description |
| --- | --- | --- |
| `file` | `selection.txt` | Name of the file in `process` folder containing filenames of images selected for retouching (without `prefix` and `extension`, each on the new line).<br><br> Example of the file contents:<br> <pre>0713<br>0715<br>0730<br>0735</pre> |
| `prefix` | `DSC_` | Prefix that appears in every filename before the numeric part.
| `extension` | `.NEF` | Extension of the `RAW` image files.

These variables together form filenames like these:
```
DSC_0713.NEF
DSC_0715.NEF
DSC_0730.NEF
DSC_0735.NEF
```

### Example

Here is an example of the anticipated structure of the photoshoot project folder:

```
root
+-- DSC_XXXX.NEF
+-- DSC_XXXY.NEF
+-- DSC_XXXQ.NEF
+-- ...
+-- process
|   +-- copy_nefs.bat
|   +-- selection.txt
|   +-- DSC_XXXX
|   |   +-- DSC_XXXX.NEF
|   |   +-- DSC_XXXX.PSD
|   |   +-- some_clip_image.PNG
|   |   +-- ...
|   +-- DSC_XXXY
|   |   +-- DSC_XXXY.NEF
|   |   +-- DSC_XXXY.PSD
|   |   +-- some_useless_image.JPG
|   |   +-- ...
+-- result
|   +-- DSC_XXXX.JPG
|   +-- DSC_XXXX_900.JPG
|   +-- DSC_XXXY.JPG
|   +-- DSC_XXXY_900.JPG
|   +-- ....
```

## copy_nefs.bat

This script should be placed in `root\process\` folder.

### Purpose

It takes filenames (numeric parts) from `root\process\selection.txt` and copies corresponding `.NEF` files to the `process` folder (each to a separate folder).

For example, the file `root\DSC_0713.NEF`, if selected by adding it's numeric part to `selection.txt`, will be copied to the `root\process\DSC_0713\DSC_0713.NEF`.

### Launch

```bash
.\copy_nefs.bat
```

## Support

If you wanna support my coding crimes, I would always appreciate your [investment in my tea](https://www.paypal.com/donate/?hosted_button_id=YBLWNJ376T8Y8).

## License

MIT licensed