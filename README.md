# fg_screen_record_standalone
Fiveguard Screenshot and Record Screen Command with ACE Perms

### Commands

#### 1. Record Command

- **Command:** `/record [ID] [Time in Sec]`
- **Description:** Records the screen of the specified player for the given time in seconds.

#### 2. Screen Command

- **Command:** `/screenshot [ID]`
- **Description:** Captures a screenshot of the specified player's screen.

### Usage

1. Use the `/record` command to initiate screen recording for a specific player. Provide the player's ID and the desired recording time in seconds as parameters.

2. Use the `/screenshot` command to capture a screenshot of a specific player. Provide the player's ID as a parameter.

### Installation

1. Ensure that the `Fiveguard` resource is correctly installed and available in your server.

2. Copy the provided script into your server's resources folder.

3. Add the script to your server.cfg file: `start fg_screen_record`
   
4. Add to your server.cfg file: `add_ace group.admin yourace allow`

5. Adjust the configuration parameters in the script file according to your server's setup.

### Configuration (main.lua)

- `RecordC`: The command for initiating screen recording.
- `RecordAce`: The ACE permission required to use the record command.
- `ScreenC`: The command for capturing a screenshot.
- `ScreenAce`: The ACE permission required to use the screenshot command.

### Notes

- Ensure that the `Fiveguard` resource is properly configured and functional for the anticheat features to work.

  ![grafik](https://github.com/UnrealMexd0x/fg_screen_record/assets/118627448/07d4c095-79a9-4e3f-b755-69d19f045c0f)


- Monitor the console for feedback messages on the success or failure of screen recording and screenshot actions.

- The reason the seconds in the command only go up to 10 is due to Discord's Upload limit.

### Example

```lua
-- Example usage of the record command
/record 1 10

-- Example usage of the screenshot command
/screenshot 1
```
