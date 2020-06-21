// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    webGLRenderer: false, 
    
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 12,

    // default window size to open
    windowSize: [1000, 650],

    // font family with optional fallbacks
    fontFamily: 'Fira Code, "Hack Nerd Font", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: true,

    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '2px 4px 14px 8px',

    // for advanced config flags please refer to https://hyper.is/#cfg  

    hyperTabs: {
      trafficButtons: true,
      border: true,
      tabIconsColored: true,
      closeAlign: "right",
      activityColor: 'salmon',
    }, 

    hyperline: {                                                            
      plugins: [ 
        "hostname",
        "ip",                                                                    
        "memory",                                                                   
        "battery"
      ]                                                                          
    },

    activeTab: '🌕'
  },


  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hyperterm-cobalt2-theme",
    "hyper-quit",
    "hyperline",
    "hypercwd",
    "hyperlinks",
    "hyperterm-safepaste",
    "hyper-search",
    "hyper-fading-scrollbar", 
    "hyper-font-ligatures",
    "hyper-tab-touchbar",
    "hyper-active-tab"
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    //'window:devtools': 'F12',
  },
};
