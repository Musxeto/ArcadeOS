# ArcadeOS
A Bootable OS in Assembly Language
![ARCADE OS LOGO](https://github.com/Musxeto/ArcadeOS/assets/138971833/6244cbf9-8e32-4181-ae2b-4661c864207d)


Arcade OS is a comprehensive operating system developed for the sole purpose of delivering an authentic retro gaming experience. This project, born out of the 3rd Semester Computer Organization and Assembly Language course at Lahore Garrison University, is a collaborative effort by a group of dedicated students including me, Ghulam Mustafa, the group leader and my friends/Groupmates. With a focus on assembly language programming, Arcade OS takes users on a nostalgic journey back to the MS-DOS era, providing a minimalist Command Line Interface (CLI) and an array of text-based retro games.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Development Tools](#development-tools)
- [Testing](#testing)
- [Results](#results)
- [Challenges](#challenges)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Arcade OS is more than just a technological project; it represents a journey into the intricate world of assembly language and a homage to the golden age of computing. Developed as part of an academic endeavor at Lahore Garrison University, this operating system is a testament to the passion and dedication of its creators.

## Features

### Bootable Operating System
Arcade OS is not just a program; it's a standalone operating system capable of running directly on bare metal. Boot it up, and you're transported to the simplicity of a bygone era.

### Minimalistic Command Line Interface (CLI)
Inspired by the iconic MS-DOS interface, the CLI is designed for efficiency and functionality. Forget flashy graphics; focus on code and interaction.

### Classic Arcade Games
Immerse yourself in the thrill of retro gaming with built-in classics like SNAKE, TETRIS, and BRICKS. Add your games seamlessly, ensuring a diverse gaming experience.

### Assembly Language Prowess
Arcade OS showcases the power of assembly language programming. Dive deep into the low-level intricacies of system control and witness the magic of code that runs directly on bare-metal hardware.

### Nostalgic MS-DOS Experience
Stay true to the roots of computing with a lightweight, minimalist design. Speed, efficiency, and a dash of nostalgia — Arcade OS brings back the joys of classic arcade-based gaming environments.

## Getting Started

To embark on your Arcade OS adventure, follow these steps:

1. **Download:**
   - (#) clone the repository to your local machine.

2. **Build:**
   - Build the source code using NASM, ensuring a seamless compilation.

3. **Run:**
   - Utilize an emulator like QEMU to run the generated image file, immersing yourself in the retro gaming experience.

For detailed instructions and system requirements, Check the Docs.

## Project Structure

Arcade OS is organized into several key components:

- **boot.asm:** Bootloader code for initializing the system.
- **shell.asm:** Command Line Interface (CLI) implementation.
- **list.asm:** Lists available games and provides execution functionality.
- **time.asm:** Displays the current time and provides related functionality.
- **files.asm:** Contains the list of available games and commands.

For a detailed explanation of each component, refer to the code, we got WE lot of comments in there.

## Development Tools

Arcade OS is built using a variety of development tools:

- **Assembly Language:** x86 Assembly (NASM Syntax)
- **Assembler:** NASM (Netwide Assembler)
- **BIOS:** Basic Input/Output System for system-level operations
- **Emulator:** QEMU (Quick Emulator)
- **Version Control:** Git and GitHub

## Testing

The project underwent rigorous testing primarily using the QEMU emulator. Unit testing and system testing were conducted to ensure stability and reliability. For more details, refer to documentation.

## Results

Key outcomes of the project include successful booting, CLI implementation, games execution, and proficiency in assembly language programming. Challenges faced and future enhancements are discussed in the section of the doc.

## Challenges

The development process encountered challenges such as size limitations, graphical constraints, and exclusions due to project deadlines.

## Future Enhancements

While Arcade OS meets its core goals, future enhancements could include an expanded game library, graphical enhancements, custom theme settings, real-time system information, and multiplayer support.

## Contributing

Arcade OS is an open-source project, and contributions are enthusiastically welcomed! Whether you're fixing a bug, implementing a new feature, or enhancing documentation, your efforts contribute to the growth of this nostalgic platform. Fork the repository, create a branch, make your changes, and submit a pull request..

## License

Feel free to explore, modify, and share this project with the world.

---

**Note:** This project was developed as part of the 3rd Semester Computer Organization and Assembly Language course at Lahore Garrison University. It reflects the efforts and passion for exploration of us student developers.
