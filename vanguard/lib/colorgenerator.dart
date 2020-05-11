class ColorGenerator {
  static final List<String> colorCodes = [
    "#fb7e7e",
    "#b6fb7e",
    "#7ea4fb",
    "#937efb",
    "#fbae7e",
    "#ec7efb",
    "#7efbe0",
    "#40ff1f",
    "#fbec7e",
    "#1fffe5",
    "#fff81f",
    "#ff1f1f",
    "#1f40ff",
    "#9ba9fd",
    "#88c20c",
    "#eb33db",
    "#fedd20",
    "#d8eb33",
    "#eb3933",
    "#3398eb",
    "#ffaa00",
    "#003300",
    "#f279ea",
    "#3995e6",
    "#9d3df2",
    "#3d6df2",
    "#a68a53",
    "#435943",
    "#3c0059",
    "#a62929",
    "#403300",
    "#1a6638",
    "#4d5a66",
    "#770080",
    "#401010",
    "#f2e63d",
    "#00e699",
    "#ff0044",
    "#d9896c",
    "#593116",
    "#f27989", 
    "#f2ceb6",
    "#b6d6f2",
    "#cc6d00",
    "#475900",
    "#f20000",
    "#86b32d",
    "#cef2b6",
    "#20f200",
    "#8fbfaf",
    "#00bfb3",
    "#13494d",
    "#008fb3",
    "#1d3473",
    "#000099",
    "#8f8fbf",
    "#f2b6de",
    "#2d2040",
    "#73003d",
    "#bf307c",
    "#664d5a",
  ];

  static String getColorCode(int index) {
    return colorCodes[index % colorCodes.length];
  }
}
