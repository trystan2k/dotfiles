// Menu: Open Project in VS Code
// Description: Opens a project in code
// Shortcut: cmd shift .

const containerClassName = 'flex justify-center items-center text-sm h-full'
async function getProjects(parentDir) {
  const codeDir = await ls(parentDir)
  const choices = []
  
  if (codeDir.includes("package.json")) {
    choices.push({
      name: parentDir,
      value: parentDir,
      description: parentDir,
    })

    return choices
  }

  for (const dir of codeDir) {
    if (dir.includes("node_modules")) {
      continue
    }
    const fullPath = path.join(parentDir, dir)
    if (!await isFile(fullPath)) {
      choices.push(...(await getProjects(fullPath)))
    }
  }
  return choices
}

const categories = [
  { name: "Personal", path: "~/Documents/Thiago/Repos" },
  { name: "Work", path: "~/Documents/GFT" }
]

const categoryChoice = await arg(
  "What are you working on ?",
  categories.map((category) => category.name)
)
const category =
  categories.find((item) => item.name === categoryChoice)?.path ||
  categories[0].path

const choice = await arg("Which project?", [...(await getProjects(category))])

edit(choice)