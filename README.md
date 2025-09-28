# ![Logo](WindowIcon.png) Visual Novel Kit

![MIT License](https://img.shields.io/static/v1.svg?label=📜%20License&message=MIT&color=informational)
[![Join the Discord channel](https://img.shields.io/static/v1.svg?label=Join%20our%20Discord%20channel&message=🎆&color=7289DA&logo=discord&logoColor=white&labelColor=2C2F33)](https://discord.gg/K9gvjdg)

***⚠️ Project is Stable, but still WIP, as it missing few features! ⚠️***

Inspired by the [Ren'Py]() and powered by [Rakugo Project](). 
This [Godot](https://godotengine.org)'s project aiming to provide a way to make visual novels games easily.

*Screenshot from "The Question" example* 

![Screenshot](https://github.com/rakugoteam/The-Question/blob/2.0/Screenshot.png?raw=true)

## Features

### UI game template for Visual Novel a'la Ren'Py

- Main Menu
- Pause Menu
- Options
- History
- Save & Load (WIP)

#### Those are modified from RGT

- Main Menu
- Pause Menu
- Options

#### History

History logs Say, Ask, Menu and Notify statements.

You can easy add your own stuff to history like this:
`VisualNovelKit.add_history_log(["tag", any_data])`.

Then in *scenes/PauseMenu/history_log_container.gd*
you add func to handel this tag and data.

### Scripting dialogue langue inspired by Ren'Py
- [Rakugo Dialogue Script core](https://rakugoteam.github.io/rakugo-docs/2.2/)
- Notification support
- Node translations support 
- Animations support
- Audio support
- Thanks to AdvancedText you can use Markdown, Ren'Py Markup or BBCode in dialogues and menus

[Installation](#installation) -
[What do you need to now](#what-do-you-need-to-know) -
[Info](#infos)
---

## Installation

### If you want to create a new project with it

For now just download source code.
Unpack it, than import and start to editing it in Godot Engine. 

### If you have already a project

For now just download source code.
Unpack it to your project.
If have your own UI that you want to use then you only need *addons* dir. 

## What do you need to know

### *"The Question"* Demo

[*"The Question"*](https://github.com/rakugoteam/The-Question) is Demo/Example project using **VisualNovelKit**.

It is port of **Ren'Py** Demo/Example project *"The Question"* to **VisualNovelKit**. 

### Editing UI

All UI scenes and there code it in *scenes* dir.

### Scripting dialogue langue

[Rakugo Dialogue Script core](https://rakugoteam.github.io/rakugo-docs/2.2/)

#### Notification support

You can display notification in UI:
```
notify "notification text" # display by 0.5s
notify 1 "long notification text" # display by 1s
```

#### Node translations
Add any **Node2D**, **Control** and **Node3D**
to `show` group, then you can in rks script:
```renpy
hide NodeName
show NodeName

# you don't need to add child nodes to `show` group if parent is
show NodeName ChildA # will show both NodeName and its child
show NodeName ChildB # will hide ChildA and show ChildB
hide NodeName ChildB # will only ChildB

# `at`, `scale`, `rotate` must be used with `show`

# `at` move node to new position 
at x, y, z # Z only if node is 3DNode
# `at` only for 2DNode/Control node
at x%, y% # procent of screen size
at top center # of screen, also: `left`, `right` and `bottom`

scale x, y, z # Z only if node is 3DNode
scale 2 # will scale Node to 2 in all axis

rotate angle # only for 2DNode/Control node
# rotate angle axis - only for 3DNode
rotate 45 forward
```

#### Animations support
Add any **AnimationPlayer** nodes to group `anim`,
then you can in rks script:
```renpy
play AnimationPlayer animation_name speed
pause AnimationPlayer
stop AnimationPlayer
```

#### Audio support
Add any **AudioStreamPlayer** nodes to `audio` group,
then you can in rks script:
```renpy
play AudioStreamPlayer speed
seek AudioStreamPlayer from
stop AudioStreamPlayer
```

### Included Addons

- [Rakugo Game Template (RGT) modified a'la Ren'Py](https://github.com/rakugoteam/Rakugo-Game-Template)
- [Rakugo Dialogue System (RDS)](https://github.com/rakugoteam/Rakugo-Dialogue-System) 
- [Rakugo Regex Lab](https://github.com/rakugoteam/VisualNovelKit/tree/2.0/addons/rakugo_regex_lab)
- [RakuScript_Color](https://github.com/rakugoteam/Rakugo-Dialogue-System/tree/main/addons/RakuScript_Color)
- [Visual Novel extensions for RDS](https://github.com/rakugoteam/VisualNovelKit/tree/2.0/addons/visualnovelkit/rks_extensions)
- [AdvancedText](https://github.com/rakugoteam/AdvancedText)
- [Godot Font Icons](https://github.com/rakugoteam/Godot-Icons-Fonts)
- [Rakugo Nodes](https://github.com/rakugoteam/Rakugo-Nodes)

### Project Settings

- [Rakugo Game Template Project Settings](https://github.com/rakugoteam/Rakugo-Game-Template?tab=readme-ov-file#project-settings)
- `addons/rakugo/game_version` - version of your game - displayed at right bottom corner of MainMenu
- `addons/rakugo/narrator_name` - name displayed if you type say statement with out character tag
- `addons/rakugo/save_folder` - obsolete as it now use **SaveHelper** from **RGT**
- `addons/rakugo/debug` - obsolete
- **VisualNovelKit** class has const and static funcs that easy to access setting below 
- `addons/visual_novel_kit/default_markup_setting` - path to default marku setting used by **DialogueUI**
- `addons/visual_novel_kit/at_predefind/center` - default pos of screen center used by `at` in **Vector2%**
- `addons/visual_novel_kit/at_predefind/left` - default pos of screen left used by `at` in **Vector2%**
- `addons/visual_novel_kit/at_predefind/right` - default pos of screen right used by `at` in **Vector2%**
- `addons/visual_novel_kit/at_predefind/top` - default pos of screen yop used by `at` in **Vector2%**
- `addons/visual_novel_kit/at_predefind/bottom` - default pos of screen bottom used by `at` in **Vector2%**

### Autoloads
- [Rakugo Game Template Autoloads](https://github.com/rakugoteam/Rakugo-Game-Template?tab=readme-ov-file#autoloads)
- RKSShow, RKSAnim, RKSAudio - those expands RakuScript langue


## Infos

If you want to help please write to us on our [Discord](https://discord.gg/K9gvjdg)

Rakugo Team website: https://rakugoteam.github.io/
