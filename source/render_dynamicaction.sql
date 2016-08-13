/*-------------------------------------
 * APEX Tooltip functions
 * Version: 1.1 (13.08.2016)
 * Author:  Daniel Hochleitner
 *-------------------------------------
*/
FUNCTION render_tooltip(p_dynamic_action IN apex_plugin.t_dynamic_action,
                        p_plugin         IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_dynamic_action_render_result IS
  --
  -- plugin attributes
  l_result       apex_plugin.t_dynamic_action_render_result;
  l_theme        VARCHAR2(100) := p_dynamic_action.attribute_01;
  l_text_source  VARCHAR2(100) := p_dynamic_action.attribute_11;
  l_content_text VARCHAR2(1000) := p_dynamic_action.attribute_02;
  l_content_item VARCHAR2(200) := p_dynamic_action.attribute_12;
  l_content_html VARCHAR2(50) := p_dynamic_action.attribute_03;
  l_animation    VARCHAR2(100) := p_dynamic_action.attribute_04;
  l_position     VARCHAR2(100) := p_dynamic_action.attribute_05;
  l_delay        NUMBER := p_dynamic_action.attribute_06;
  l_trigger      VARCHAR2(100) := p_dynamic_action.attribute_07;
  l_min_width    NUMBER := p_dynamic_action.attribute_08;
  l_max_width    NUMBER := p_dynamic_action.attribute_09;
  l_logging      VARCHAR2(50) := p_dynamic_action.attribute_10;
  -- js/css file vars
  l_apextooltip_js  VARCHAR2(50);
  l_tooltipster_js  VARCHAR2(50);
  l_tooltipster_css VARCHAR2(50);
  --
BEGIN
  -- attribute defaults
  l_theme        := nvl(l_theme,
                        'tooltipster-default');
  l_text_source  := nvl(l_text_source,
                        'TEXT');
  l_content_html := nvl(l_content_html,
                        'false');
  l_animation    := nvl(l_animation,
                        'fade');
  l_position     := nvl(l_position,
                        'top');
  l_delay        := nvl(l_delay,
                        200);
  l_trigger      := nvl(l_trigger,
                        'hover');
  l_min_width    := nvl(l_min_width,
                        0);
  l_logging      := nvl(l_logging,
                        'false');
  -- Debug
  IF apex_application.g_debug THEN
    apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,
                                          p_dynamic_action => p_dynamic_action);
    -- set js/css filenames (normal version)
    l_apextooltip_js  := 'apextooltip';
    l_tooltipster_js  := 'tooltipster.bundle';
    l_tooltipster_css := 'tooltipster.bundle';
  ELSE
    -- minified version
    l_apextooltip_js  := 'apextooltip.min';
    l_tooltipster_js  := 'tooltipster.bundle.min';
    l_tooltipster_css := 'tooltipster.bundle.min';
  END IF;
  --
  -- add tooltipster and apextooltip js files
  apex_javascript.add_library(p_name           => l_tooltipster_js,
                              p_directory      => p_plugin.file_prefix ||
                                                  'js/',
                              p_version        => NULL,
                              p_skip_extension => FALSE);
  --
  apex_javascript.add_library(p_name           => l_apextooltip_js,
                              p_directory      => p_plugin.file_prefix ||
                                                  'js/',
                              p_version        => NULL,
                              p_skip_extension => FALSE);
  --
  -- add tooltipster css and theme css files
  apex_css.add_file(p_name      => l_tooltipster_css,
                    p_directory => p_plugin.file_prefix || 'css/');
  -- theme (not default one)
  IF l_theme != 'tooltipster-default' THEN
    apex_css.add_file(p_name      => l_theme || '.min',
                      p_directory => p_plugin.file_prefix || 'css/themes/');
  END IF;
  --
  --
  l_result.javascript_function := 'apexTooltip.showTooltip';
  l_result.attribute_01        := l_theme;
  l_result.attribute_02        := l_content_text;
  l_result.attribute_03        := l_content_html;
  l_result.attribute_04        := l_animation;
  l_result.attribute_05        := l_position;
  l_result.attribute_06        := l_delay;
  l_result.attribute_07        := l_trigger;
  l_result.attribute_08        := l_min_width;
  l_result.attribute_09        := l_max_width;
  l_result.attribute_10        := l_logging;
  l_result.attribute_11        := l_text_source;
  l_result.attribute_12        := l_content_item;
  --
  RETURN l_result;
  --
END render_tooltip;