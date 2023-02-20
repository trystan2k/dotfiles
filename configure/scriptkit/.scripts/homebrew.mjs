// Users/todd/Documents/Thiago/Repos/dotfiles/configure/scriptkit/scripts/homebrew.ts
import "@johnlindquist/kit";
var query = await arg("Search homebrew");
var response = await get(`https://formulae.brew.sh/api/formula/${query.trim()}.json`);
var { name } = response.data;
var bins = await readdir(`/opt/homebrew/bin`);
var installed = bins.includes(name);
if (installed) {
  setDescription(`${name} already installed`);
}
var message = `${installed ? `Uninstall` : `Install`} ${name}?`;
var confirm = await arg(message, [
  { name: `[y]es`, value: true },
  { name: `[n]o`, value: false }
]);
setPlaceholder(`Please wait...`);
if (confirm) {
  setDescription(`${installed ? `Uninstalling` : `Installing`} ${name}`);
  await exec(`/opt/homebrew/bin/brew ${installed ? `uninstall` : `install`} ${name}`);
}
