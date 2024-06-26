import { bgBlack, black, rgb24, white } from "https://deno.land/std@0.167.0/fmt/colors.ts";

console.log(`Hello!`);
console.log(`This script was written for ${bgBlack(white("deno"))}${black("2")}${rgb24("Nix", 0x7E7EFF)}.`);

// https://github.com/dylanaraps/neofetch/blob/ccd5d9f52609bbdcd5d8fa78c4fdb0f12954125f/neofetch#L8976-L8998
const c1 = (t: string) => rgb24(t, 0x4D6FB6);
const c2 = (t: string) => rgb24(t, 0x7EB6E1);
console.log(
  [
    c1("          ▗▄▄▄       ") + c2("▗▄▄▄▄    ▄▄▄▖"),
    c1("          ▜███▙       ") + c2("▜███▙  ▟███▛"),
    c1("           ▜███▙       ") + c2("▜███▙▟███▛"),
    c1("            ▜███▙       ") + c2("▜██████▛"),
    c1("     ▟█████████████████▙ ") + c2("▜████▛     ") + c1("▟▙"),
    c1("    ▟███████████████████▙ ") + c2("▜███▙    ") + c1("▟██▙"),
    c2("           ▄▄▄▄▖           ") + c2("▜███▙  ") + c1("▟███▛"),
    c2("          ▟███▛             ") + c2("▜██▛ ") + c1("▟███▛"),
    c2("         ▟███▛               ") + c2("▜▛ ") + c1("▟███▛"),
    c2("▟███████████▛                  ") + c1("▟██████████▙"),
    c2("▜██████████▛                  ") + c1("▟███████████▛"),
    c2("      ▟███▛") + c1(" ▟▙               ") + c1("▟███▛"),
    c2("     ▟███▛") + c1(" ▟██▙             ") + c1("▟███▛"),
    c2("    ▟███▛") + c1("  ▜███▙           ") + c1("▝▀▀▀▀"),
    c2("    ▜██▛") + c1("    ▜███▙ ") + c2("▜██████████████████▛"),
    c2("     ▜▛") + c1("     ▟████▙ ") + c2("▜████████████████▛"),
    c1("           ▟██████▙       ") + c2("▜███▙"),
    c1("          ▟███▛▜███▙       ") + c2("▜███▙"),
    c1("         ▟███▛  ▜███▙       ") + c2("▜███▙"),
    c1("         ▝▀▀▀    ▀▀▀▀▘       ") + c2("▀▀▀▘"),
  ].join("\n"),
);
