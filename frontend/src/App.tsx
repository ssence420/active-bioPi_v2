import { useState } from "react";
import { ReactComponent as SquareIcon } from "./components/square1.svg?react";

export default function App() {
  return (
    <div className="h-screen bg-white flex items-center justify-center">
      <SquareIcon className="w-24 h-24 bg-amber-400" />
    </div>
  );
}
