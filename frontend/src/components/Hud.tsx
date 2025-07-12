// components/hud.tsx
import { useEffect, useState } from "react";

export default function Schematic() {
  const [svgContent, setSvgContent] = useState("");

  useEffect(() => {
    fetch("/HUD_1.svg")
      .then((res) => res.text())
      .then(setSvgContent);
  }, []);

  useEffect(() => {
    const lamp = document.getElementById("lamp");
    if (lamp) {
      lamp.setAttribute("fill", "green");
      lamp.addEventListener("click", () => {
        console.log("Lamp clicked!");
        lamp.setAttribute("fill", "red");
      });
    }
  }, [svgContent]);

  return (
    <div
      className="w-[1024px] h-[600px]"
      dangerouslySetInnerHTML={{ __html: svgContent }}
    />
  );
}
