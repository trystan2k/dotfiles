// Name: Port kill
// Description: Enter port number to kill process listening on port.
// Author: kyo young
// GitHub:

import '@johnlindquist/kit';

const killPort = await npm('kill-port');
const port = await arg('Enter port to kill')
const containerClassName = 'flex justify-center items-center text-4xl h-full'

try {
    await killPort(port, 'tcp')
    await div(`🤖 listening on port ${port} has been killed.`,containerClassName);
} catch (error) {
    console.error(error);
    await div(`
    🛰️ ${error.message}
    `,containerClassName)
}



