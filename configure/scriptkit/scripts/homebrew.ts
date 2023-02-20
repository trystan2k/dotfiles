// Name: Search Homebrew
// Shortcut: cmd option shift h

import "@johnlindquist/kit"

let query = await arg("Search homebrew")

let response = await get(`https://formulae.brew.sh/api/formula/${query.trim()}.json`)
let { name } = response.data;

let bins = await readdir(`/opt/homebrew/bin`)

let installed = bins.includes(name)

if(installed){
    setDescription(`${name} already installed`)
}

let message = `${installed ? `Uninstall` : `Install`} ${name}?`

let confirm = await arg(message, [
    {name: `[y]es`, value: true},
    {name: `[n]o`, value: false}
])

setPlaceholder(`Please wait...`)

if(confirm){
    setDescription(`${installed ? `Uninstalling` : `Installing`} ${name}`)
    await exec(`/opt/homebrew/bin/brew ${installed ? `uninstall` : `install`} ${name}`)
}


