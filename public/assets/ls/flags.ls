ns = {}

ns.loading = !->
  for flag in ns.flags
    type = flag.type.toLowerCase()

    if type is 'state'
      field = "
        <tr>
          <td style=\"vertical-align: top;\">
            <p>
              <i class=\"question icon link popup\" data-content=\"#{flag.description}\"></i>
                <label>#{flag.name}</label>
            </p>
          </td>
          <td class=\"ui vertical \" style=\"padding-left: 1em;\">
            <div class=\"inline fields\">
              <div class=\"field\">
                <div class=\"ui radio checkbox\">
                  <input type=\"radio\" name=\"flag_#{flag.name}\" checked=\"checked\">
                  <label>None</label>
                </div>
              </div>
              <div class=\"field\">
                <div class=\"ui radio checkbox\">
                  <input type=\"radio\" name=\"flag_#{flag.name}\">
                  <label>Allow</label>
                </div>
              </div>
              <div class=\"field\">
                <div class=\"ui radio checkbox\">
                  <input type=\"radio\" name=\"flag_#{flag.name}\">
                  <label>Deny</label>
                </div>
              </div>
            </div>
          </td>
        </tr>
      "
      $( '#flags-state table tbody' )append( field );

    else
      field = "
      <div class=\"field\">
        <label>
          #{flag.name}
          <i class=\"question icon link popup\" data-content=\"#{flag.description}\" data-variation=\"inverted\"></i>
        </label>

        <input type=\"text\" placeholder=\"#{flag.name} ( #{flag.default} | #{flag.default_group} )\"/>
      </div>
      "
      $( '#flags-' + type )append( field );


ns.flags =
  * 'name' : 'passthrough'
    'description' : 'Use allow to have this region treated as a region that doesn\'t check build permission (use this to make simple no-PVP, etc. zones).'
    'default' : 'N/A'
    'default_group' : 'All'
    'type' : 'State'

  * 'name' : 'build'
    'description' : 'All members and owners will be able to build normally without changing this flag, do not change it. This flag overrides all region build checks. Deny always takes precedence over allow. If you simply want to protect a region, you don\'t have to touch this flag. By default no one can build in a region until you use addowner/addmember to add a player to the region.'
    'default' : 'N/A'
    'default_group' : 'Non-Members'
    'type' : 'State'

  * 'name' : 'construct'
    'description' : 'Deprecated. Don\'t use this flag at all. It\'s broken and should be considered deprecated.'
    'default' : 'Members'
    'default_group' : 'N/A'
    'type' : 'Group'

  * 'name' : 'pvp'
    'description' : 'Allow or block PvP.'
    'default' : 'Allowed'
    'default_group' : 'All'
    'type' : 'State'

  * 'name' : 'mob-damage'
    'description' : 'Allow or block mob damage on players.'
    'default' : 'Allowed'
    'default_group' : 'All'
    'type' : 'State'

  * 'name' : 'entity-item-frame-destroy'
    'description' : 'Allow or block non-player entities from destroying item-frames.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'entity-painting-destroy'
    'description' : 'Allow or block non-player entities from destroying paintings.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'mob-spawning'
    'description' : 'Allow or deny mobs spawning'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'creeper-explosion'
    'description' : 'Allow or block creeper damage to terrain and players.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'enderman-grief'
    'description' : 'Allow or prevent endermen from picking up or placing blocks.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'enderpearl'
    'description' : 'Allow or prevent players from teleporting to or from regions using enderpearls.'
    'default' : 'Allowed'
    'default_group' : 'Non-Members*'
    'type' : 'State'

  * 'name' : 'enderdragon-block-damage'
    'description' : 'Allow or prevent enderdragon damage to blocks.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'ghast-fireball'
    'description' : 'Allow or block fireballs damage to terrain and players.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'sleep'
    'description' : 'Allow or block players from entering beds.'
    'default' : 'Allowed'
    'default_group' : 'Non-Members*'
    'type' : 'State'

  * 'name' : 'tnt'
    'description' : 'Allow or block TNT.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'lighter'
    'description' : 'Allow or block flint and steel.'
    'default' : 'Allowed'
    'default_group' : 'Non-Members*'
    'type' : 'State'

  * 'name' : 'fire-spread'
    'description' : 'Allow or block the spread of fire (requires high frequency flags to be on in configuration)'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'lava-fire'
    'description' : 'Allow or block whether lava can start fires (requires high frequency flags to be on in configuration)'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'lightning'
    'description' : 'Allow or block lightning striking at all in a region'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'chest-access'
    'description' : 'Allow or block the player from opening chests, furnaces, and other containers in a region'
    'default' : 'Deny'
    'default_group' : 'Non-Members'
    'type' : 'State'

  * 'name' : 'pistons'
    'description' : 'Allow or block piston activation'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'water-flow'
    'description' : 'Allow or block flow of water. (requires high frequency flags to be on in configuration) '
    'default' : 'N/A'
    'default_group' : 'Allowed'
    'type' : 'State'

  * 'name' : 'lava-flow'
    'description' : 'Allow or block flow of lava. (requires high frequency flags to be on in configuration)'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'use'
    'description' : 'Allow or block the ability to use doors, buttons, pressure plates, levers, etc'
    'default' : 'Allowed'
    'default_group' : 'Non-Members*'
    'type' : 'State'

  * 'name' : 'vehicle-place'
    'description' : 'Allow or block the ability to place vehicles'
    'default' : 'Denied'
    'default_group' : 'Non-Members'
    'type' : 'State'

  * 'name' : 'vehicle-destroy'
    'description' : 'Allow or block the ability to remove vehicles'
    'default' : 'Denied'
    'default_group' : 'Non-Members'
    'type' : 'State'

  * 'name' : 'snow-fall'
    'description' : 'Allow or block snow from forming in an area. Note that this will not block weather altogether, that can be done in the config.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'snow-melt'
    'description' : 'Allow or block snow from melting in an area.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'ice-form'
    'description' : 'Allow or block ice from forming in an area.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'ice-melt'
    'description' : 'Allow or block ice from melting in an area.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'leaf-decay'
    'description' : 'Allow or block leaves from decaying.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'grass-growth'
    'description' : 'Allow or block grass from spreading to dirt.'
    'default' : 'Allowed'
    'default_group' : 'N/A'
    'type' : 'State'

  * 'name' : 'invincible'
    'description' : 'Sets a temporary godmode on the player. This will also disable /god-mode if set to deny, unless the player has the worldguard.god.override-regions permission.'
    'default' : 'None'
    'default_group' : 'All'
    'type' : 'State'

  * 'name' : 'entry'
    'description' : 'Allow or deny a group of players to enter an area'
    'default' : 'Allowed'
    'default_group' : 'Non-Members*'
    'type' : 'State'

  * 'name' : 'exit'
    'description' : 'Allow or deny a group of players to leave an area'
    'default' : 'Allowed'
    'default_group' : 'Non-Members*'
    'type' : 'State'

  * 'name' : 'greeting'
    'description' : 'Message to show a player when they enter a region. See String flag below for formatting.'
    'default' : 'unset'
    'default_group' : 'All'
    'type' : 'String'

  * 'name' : 'farewell'
    'description' : 'Message to show a player when they leave a region. See String flag below for formatting.'
    'default' : 'unset'
    'default_group' : 'All'
    'type' : 'String'

  * 'name' : 'notify-enter'
    'description' : 'Sends a message to players with the worldguard.notify permission when a player enters a region.'
    'default' : 'False'
    'default_group' : 'All'
    'type' : 'Boolean'

  * 'name' : 'notify-leave'
    'description' : 'Sends a message to players with the worldguard.notify permission when a player leaves a region.'
    'default' : 'False'
    'default_group' : 'All'
    'type' : 'Boolean'

  * 'name' : 'deny-spawn'
    'description' : 'Set mobs that can\'t spawn within the region. From console or ingame: /region flag [id] denyspawn Skeleton,Zombie,Creeper,etc . In config file: deny-spawn: [SKELETON, CREEPER, ZOMBIE, ETC]'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'List'

  * 'name' : 'heal-delay'
    'description' : 'Set the time in seconds between heal-amount triggering'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'Integer'

  * 'name' : 'heal-amount'
    'description' : 'Set the amount per heal time (see heal-delay)'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'Integer'

  * 'name' : 'heal-min-health'
    'description' : 'Minimum health the heal flags will drop a player to.'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'Integer'

  * 'name' : 'heal-max-health'
    'description' : 'Maximum health the heal flags will raise a player to. (a full bar is 20 hearts)'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'Integer'

  * 'name' : 'feed-delay'
    'description' : 'Set the time in seconds between feed-amount triggering'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'Integer'

  * 'name' : 'feed-amount'
    'description' : 'Set the amount per hunger regen time (see feed-delay)'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'Integer'

  * 'name' : 'feed-min-hunger'
    'description' : 'Minimum hunger the feed flags will drop a player to.'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'Integer'

  * 'name' : 'feed-max-hunger'
    'description' : 'Maximum hunger the feed flags will raise a player to. (a full bar is 20 food)'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'Integer'

  * 'name' : 'teleport'
    'description' : 'Defines the location /region teleport <id> teleports you to.'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'Location'

  * 'name' : 'spawn'
    'description' : 'Define the spawn of the region, use /region flag region x y z'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'Location'

  * 'name' : 'blocked-cmds'
    'description' : 'Sets the commands that will be blocked inside the region'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'List'

  * 'name' : 'allowed-cmds'
    'description' : 'Sets the commands allowed in the region. If this is set (not empty) it will act like a whitelist and ONLY commands from this list will be allowed.'
    'default' : 'unset'
    'default_group' : 'N/A'
    'type' : 'List'

  * 'name' : 'send-chat'
    'description' : 'Sets whether or not a player can send chat inside the region'
    'default' : 'Allowed'
    'default_group' : 'Non-Members*'
    'type' : 'State'

  * 'name' : 'receive-chat'
    'description' : 'Sets whether or not a player can receive chat inside the region.'
    'default' : 'Allowed'
    'default_group' : 'Non-Members*'
    'type' : 'State'

  * 'name' : 'game-mode'
    'description' : 'Sets the gamemode when a player enters a region. Can either be SURVIVAL, CREATIVE or ADVENTURE.'
    'default' : 'unset'
    'default_group' : 'All'
    'type' : 'Custom'

  * 'name' : 'potion-splash'
    'description' : 'Allow or block splash effect from potion'
    'default' : 'Allowed'
    'default_group' : 'Non-Members*'
    'type' : 'State'

ns.loading()
