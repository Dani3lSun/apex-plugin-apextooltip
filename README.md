# Oracle APEX Dynamic Action Plugin - APEX Tooltip
A powerful, flexible APEX plugin enabling you to easily create semantic, modern tooltips. Using the open source JQuery plugin tooltipster.

## Changelog
### 1.1 - Added text source (freetext, text from item, text from title attribute of affected element) / upgraded tooltipster to newest version 4.1.2

### 1.0 - Initial Release

## Install
- Import plugin file "dynamic_action_plugin_de_danielh_apextooltip.sql" from source directory into your application
- (Optional) Deploy the JS and CSS files from "server" directory on your webserver and change the "File Prefix" to webservers folder.

## Plugin Settings
The plugin settings are highly customizable and you can change:
- **Theme** - APEX Tooltip theme (5 different themes to choose from)
- **Content Text Source** - Source of the tooltip content text (Freetext, Text from item, Text from HTML title attribute of affected element)
- **Content Text** - Content text of the tooltip
- **Content with HTML** - If the content of the tooltip is provided as a string, it is displayed as plain text by default. If this content should actually be interpreted as HTML, set this option to true
- **Animation** - Determines how the tooltip will animate in and out (Fade, Grow, Swing, Slide, Fall)
- **Position** - Set the position of the tooltip (Top, Bottom, Left, Right, Top-Left, Top-Right, Bottom-Left, Bottom-Right)
- **Trigger** - Set how tooltips should be activated and closed. Default 'hover'
- **Delay** - Delay how long it takes (in milliseconds) for the tooltip to start animating in. Default 200ms.
- **min Width** - Set a minimum width (in pixels) for the tooltip. Default: 0 (auto width)
- **max Width** - Set a maximum width (in pixels) for the tooltip. Default: null (no max width)
- **Logging** - Whether to log events in the console

## Plugin Events
- **APEX Tooltip - on Show** - DA event to do things when a tooltip opens
- **APEX Tooltip - on Hide** - DA event to do things when a tooltip closes

## How to use
- Create a new Dynamic Action with event "onload" (other events also possible)
- As action choose "APEX Tooltip".
- Choose best fitting plugin attributes (help included)
- Choose Affected Elements which tooltips are binded to (Items, Buttons, Regions or JQuery Selectors)

## Demo Application
[https://apex.oracle.com/pls/apex/f?p=APEXPLUGIN](https://apex.oracle.com/pls/apex/f?p=APEXPLUGIN)

## Preview
## ![](https://github.com/Dani3lSun/apex-plugin-apextooltip/blob/master/preview.gif)
- [tooltipster](https://github.com/iamceege/tooltipster)
