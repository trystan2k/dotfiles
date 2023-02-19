// Name: Search Homebrew

import "@johnlindquist/kit"

let response = await get(`https://formulae.brew.sh/api/formula.json`)

let homebrewChoices = response.data.map(({name, tap}) => {
    return {
        name,
        value: name,
        description: tap,
        preview: async ()=> {
            let response = await get(`https://formulae.brew.sh/api/formula/${name}.json`)
            let {full_name, tap, desc, homepage, versions, urls} = response.data
            return md(`## ${full_name}
### ${tap}

${desc}
[${homepage}](${homepage})

* Version - ${versions?.stable}
* URLs - ${urls?.stable?.url}


 `)
        }

    }
})

let formula = await arg("Search homebrew", homebrewChoices)

let bins = await readdir(`/opt/homebrew/bin`)

let installed = bins.includes(formula)

if(installed){
    setDescription(`${formula} already installed`)
}

let message = `${installed ? `Uninstall` : `Install`} ${formula}?`

let confirm = await arg(message, [
    {name: `[y]es`, value: true},
    {name: `[n]o`, value: false}
])

setChoices(null)
setPlaceholder(`Please wait...`)


if(confirm){
    setDescription(`${installed ? `Uninstalling` : `Installing`} ${formula}`)
    await exec(`/opt/homebrew/bin/brew ${installed ? `uninstall` : `install`} ${formula}`)
}


