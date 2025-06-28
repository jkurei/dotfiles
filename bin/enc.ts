import { isString, size } from "lodash"
const { black, red, yellow, underline, bgYellow } = require("chalk")
const minimist = require("minimist")
const fs = require("fs")
const askUser = require("prompt").get
const node_exec = require('child_process').exec

// npm i --save lodash chalk minimist prompt @types/node @types/lodash
// npm i -g ts-node typescript

function debug(x: any) {
  console.error(black.bgYellow(isString(x) ? x : JSON.stringify(x)))
  return x
}

function exec(cmd: string) {
  return new Promise((yea, nope) => {
    const dir = node_exec(cmd, function(err, stdout, stderr) {
      if (err) {
        debug("This command exited with " + JSON.stringify(err))
        debug(" -- " + cmd)
        debug(stdout);
        debug(stderr);
      }
    });
    
    dir.on('exit', function (code: number) {
      if (!code) {
        console.log("ok: " + cmd)
        yea()
      }
      else nope(code)
    });
  })
}

/* Arguments */ 

const argOpts = { boolean: ["r", "k"], string: ["o"] }
const args = minimist(process.argv.slice(2), argOpts)
const noArgs: boolean = size(args) == 1 && args._.length == 0

debug({ noArgs })
debug(JSON.stringify(args))

/* Help text */

function logHelpAndExit(flipOut: boolean = false) {
  if (flipOut) {
    console.log(red("IDK what you want!\n"))
  }
  
  console.log(`
You need to give me some arguments dude

enc a -o b 
    will encrypt a as b

enc a b c 
    will encrypt a, b and c as a.enc, b.enc and c.enc
    
-r
    will remove the input files
    
-k 
    will search recursively in a directory (or right here)
    and encode those with the "k" flag in their name

-c 
    create a key file (encrypted, ofc) and say goodbye to 
    passwords. kind of.
`
  )
  
  process.exit(-1)
}

if (noArgs || args.h || args.help) {
  logHelpAndExit()
}

if (args.o && args.k) {
  logHelpAndExit(true)
}

/* Functions */

function defaultName(f: string) {
  return f + ".enc"
}

function enc(enc: string, dec: string, password: string) {
  const cmd = `openssl enc -aes-256-cbc -in "${enc}" -out "${dec}" -pass pass:${password}`
  console.log(cmd)
  return exec(cmd)
}

function rm(f: string) {
  const cmd = `rm ${f}`
  console.log(cmd)
  return exec(cmd)
}

function promptForPassword(): Promise<string> {
  return new Promise((yea, nope) => {
    askUser(
      { properties: { password: { hidden: true }}},
      (err, result) => (err ? nope(err) : yea(result.password))
    )
  })
}

/* Main */

async function main() {

  /* get the password... */
  let password: string = ""

  /* ... from a file if possible... */
  if (fs.existsSync("~/ENC_PWD")) {
    debug("I see that my key file exists... but this is NOT IMPLEMENTED yet!")
    process.exit(-2)
  }

  /* ... or from the user otherwise */
  else {
    console.log("I don't have a password file (create it with -c), so pls give me one:")
    password = await promptForPassword()
  }

  if (!password) {
    debug("I need a password!")
    process.exit(-2)
  }

  /* Now do the real shit */

  if (args.c) {
    /* -c: create password file */
    debug("NOT IMPLEMENTED")
    logHelpAndExit()
  }
  else if (args.o) {
    /* -o: encrypt 1 file, with a given name */
    // #TODO check if files exist, to fail more gacefully
    if (args._.length != 1 || !isString(args.o)) {
      logHelpAndExit(true)
    }
      
    await enc(args._[0], args.o, password)
    
    if (args.r) {
      await rm(args._[0])
    }
  }
  else if (args.k) {
    /* -k mode */
    // #TODO check if files exist, to fail more gacefully
    // #TODO Implement -k mode
    console.log("NOT IMPLEMENTED")
  }
  else {
    /* multifile mode */
    // #TODO check if files exist, to fail more gacefully
    await exec("echo hola > test.txt")

    args._.forEach(async (f: string) => {
      await enc(f, defaultName(f), password)
    })
    
    if (args.r) {
      args._.forEach(async (f: string) => {
        await rm(f)
      })
    }
  }
}
    
main()

// #TODO check if files are actually directories
// #TODO maybe compress directory to zip and then encrypt? IDK
// #TODO checkout https://github.com/shelljs/shelljs
// #DONE this should be typescript 
