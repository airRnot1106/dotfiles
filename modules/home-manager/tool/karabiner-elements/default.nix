{
  xdg.configFile."karabiner/karabiner.json".text = builtins.toJSON {
    profiles = [
      {
        name = "Default profile";
        selected = true;
        virtual_hid_keyboard = {
          keyboard_type = "ansi";
        };
        simple_modifications = [
          {
            from = {
              key_code = "caps_lock";
            };
            to = [
              {
                key_code = "left_control";
              }
            ];
          }
          {
            from = {
              key_code = "left_control";
            };
            to = [
              {
                key_code = "caps_lock";
              }
            ];
          }
        ];
      }
    ];
  };
}
