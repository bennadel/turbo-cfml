import resolve from "@rollup/plugin-node-resolve"

import { version } from "./package.json"
const year = new Date().getFullYear()
const banner = `/*!\nTurbo ${version}\nCopyright © ${year} 37signals LLC\n */`

export default [
  {
    input: "src/index.js",
    output: [
      {
        name: "Turbo",
        file: "dist/turbo-cfml.es2017-umd.js",
        format: "umd",
        banner
      },
      {
        file: "dist/turbo-cfml.es2017-esm.js",
        format: "es",
        banner
      }
    ],
    plugins: [resolve()],
    watch: {
      include: "src/**"
    }
  }
]
