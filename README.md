# Installation

- Create and boot a fresh [Arch ISO](https://archlinux.org/download)
- Run this command:
  ```bash
  bash <(curl -fsSL https://github.com/Thijzert123/my-archy/raw/refs/heads/main/install.sh)
  ```
- `archinstall` will pop up with most fields already set. Only change the following things:
  - Disk configuration (recommended: btrfs, use best effort layout, subvolumes with default structure, use compression)
  - Authentication (add at least one user)
  - Locales (optional)
  - Mirrors (optional)
  - Hostname (optional)
  - Timezone (optional)
- Confirm installation and exit `archinstall` after.
- Reboot. You can also set the `REBOOT` environment variable before running to reboot automatically.
