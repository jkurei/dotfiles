const fs = require("fs")
const readline = require("readline")

/// FUNCS

const isFile = (x) => fs.statSync(x).isFile()
const isFolder = (x) => fs.statSync(x).isDirectory()

const countItemsInFolder = (folderPath) =>
  fs.readdirSync(folderPath).reduce(
    ({ folders, files }, x, i) =>
      isFolder(`${folderPath}/${x}`)
        ? ({ folders: folders + 1, files })
        : ({ folders, files: files + 1 })
    ,
    { folders: 0, files: 0 }
  )

/// MAIN

const doit = (dry = false) => {
  let somefound = false

  fs.readdirSync('./').map(x => {
    if (isFolder(x)) {
      const count = countItemsInFolder(x)
      const suffix = `-- ${count.folders}, ${count.files}`
      if (x.endsWith(suffix)) {
        if(dry) {
          console.log(`${x}`)
          console.log(` -> (same)`)
        }
      } else {
        somefound = true
        const newPath = `${x} ${suffix}`
        if (dry) {
          console.log(`${x}`)
          console.log(` -> ${newPath}`)
        }
        else {
          fs.renameSync(x, newPath)
        }
      }
    }
  })

  if (dry && !somefound) { console.log("No folders to be renamed") }
  return somefound
}

const worktodo = doit("dry")

if (worktodo) {
  var rl = readline.createInterface(process.stdin, process.stdout)
  rl.question("Rename? [y]/n: ", answer => {
      if(answer.startsWith("n")) {
          console.log("Cancelled")
      }
      else {
          doit()
      }
      rl.close()
  })
}