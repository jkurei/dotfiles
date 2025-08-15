#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const dir = process.argv[2];
if (!dir) {
  console.error("Usage: node script.js <directory>");
  process.exit(1);
}

const hashMap = new Map(); // sha1 => [paths]

function walk(dirPath) {
  const entries = fs.readdirSync(dirPath, { withFileTypes: true });
  for (const entry of entries) {
    const fullPath = path.join(dirPath, entry.name);
    if (entry.isDirectory()) {
      walk(fullPath);
    } else if (entry.isFile()) {
      const hash = sha1sum(fullPath);
      if (!hashMap.has(hash)) hashMap.set(hash, []);
      hashMap.get(hash).push(fullPath);
    }
  }
}

function sha1sum(filePath) {
  const data = fs.readFileSync(filePath);
  return crypto.createHash('sha1').update(data).digest('hex');
}

walk(dir);

for (const files of hashMap.values()) {
  if (files.length > 1) {
    files.slice(1).forEach(file => console.log(file)); // print duplicates, keep one original
  }
}


