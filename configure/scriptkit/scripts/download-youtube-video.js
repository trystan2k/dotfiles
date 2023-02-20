// Name: Download YouTube Video
// Description: Download a video from a YouTube URL as .mp4
// Author: Vogelino
// Twitter: @soyvogelino
// Shortcut: cmd option shift y

import "@johnlindquist/kit";

const youtubeDlExec = await npm("youtube-dl-exec");
const slugify = await npm("slugify");
const apiKey = await env("YOUTUBE_API_KEY");

// Show feedback as HTML (Adds padding and some feedback styles)
const showFeedback = async (message) => {
  await div(`
    <style type="text/css">
      .container { position: relative; padding-right: 232px !important; } 
      .error     { border: 1px solid red;   color: red;       background: rgba(255,0,0,.1); }
      .success   { border: 1px solid green; color: darkgreen; background: rgba(0,255,0,.1); }
      .default   { border: 1px solid gray;  color: black;     background: rgba(0,0,0,.05); }
    </style>
    <main class="p-8">
      ${message}
    </main>
  `);
  return message;
};

// Returns the SVG markup of an animated loading spinner
const getLoadingSpinner = () => `
<svg
  style="margin: 0 8px 0 0; display: inline-block; shape-rendering: auto"
  width="30px"
  height="30px"
  viewBox="0 0 100 100"
  preserveAspectRatio="xMidYMid"
>
  <defs>
    <clipPath id="progress-4hqxcfiwb2u-cp" x="0" y="0" width="100" height="100">
      <rect x="0" y="0" width="0" height="100">
        <animate
          attributeName="width"
          repeatCount="indefinite"
          dur="1s"
          values="0;100;100"
          keyTimes="0;0.5;1"
        ></animate>
        <animate
          attributeName="x"
          repeatCount="indefinite"
          dur="1s"
          values="0;0;100"
          keyTimes="0;0.5;1"
        ></animate>
      </rect>
    </clipPath>
  </defs>
  <path
    fill="none"
    stroke="rgba(0,0,0,.2)"
    stroke-width="2.79"
    d="M18 36.895L81.99999999999999 36.895A13.104999999999999 13.104999999999999 0 0 1 95.10499999999999 50L95.10499999999999 50A13.104999999999999 13.104999999999999 0 0 1 81.99999999999999 63.105L18 63.105A13.104999999999999 13.104999999999999 0 0 1 4.895000000000003 50L4.895000000000003 50A13.104999999999999 13.104999999999999 0 0 1 18 36.895 Z"
  ></path>
  <path
    fill="rgba(0,0,0,.8)"
    clip-path="url(#progress-4hqxcfiwb2u-cp)"
    d="M18 40.99L82 40.99A9.009999999999998 9.009999999999998 0 0 1 91.00999999999999 50L91.00999999999999 50A9.009999999999998 9.009999999999998 0 0 1 82 59.01L18 59.01A9.009999999999998 9.009999999999998 0 0 1 8.990000000000004 50L8.990000000000004 50A9.009999999999998 9.009999999999998 0 0 1 18 40.99 Z"
  ></path>
</svg>
`;

// Returns a small HTML structure showing basic information about the video currently downloaded
const getVideoTemplate = (title, metadata) => `
<h1 class="w-full truncate">${title}</h1>
<table className="container">
  <tr>
    <td width="${
      (metadata.thumbnails?.default?.width || 0) + 32
    }" className="pr-4 align-top">
      <img
        src="${metadata.thumbnails?.default?.url}"
        width="${metadata.thumbnails?.default?.width}"
        height="${metadata.thumbnails?.default?.height}"
      />
    </td>
    <td class="align-top">
      <div>
        <strong class="block">Destination</strong>
        <span>${metadata.path}</span>
      </div>
      <div>
        <strong>Language</strong>
        <span>${metadata.defaultAudioLanguage}</span>
      </div>
      <div>
        <strong>Channel</strong>
        <span>${metadata.channelTitle}</span>
      </div>
    </td>
  </tr>
</table>
`;

// Retruns basic information about the youtube video (For the feedback and the file name)
const getVideoMetadata = (url) =>
  new Promise((resolve, reject) => {
    const urlObj = new URL(url);
    const id = urlObj.searchParams.get("v");
    if (!id) return reject(`Video ID not present in the url`);
    const ytUrl = new URL(`https://www.googleapis.com/youtube/v3/videos`);
    ytUrl.searchParams.set("key", apiKey);
    ytUrl.searchParams.set("id", id);
    ytUrl.searchParams.set("part", "snippet");
    console.log(ytUrl.toString());
    get(ytUrl.toString())
      .then((response) => response.data)
      .then((data) => data.items[0].snippet)
      .then(resolve);
  });

// We save the metadata outside the try catch so it's available in the catch
let fullMetadata = {};

try {
  const videoSrc = await arg("Video url:");
  const videoMetadata = await getVideoMetadata(videoSrc);
  const videoPath = "Downloads";

  const videoName = slugify(videoMetadata.title.slice(0, 50).toLowerCase());
  const fileName = videoName !== "" ? videoName : videoSrc;
  const newPath = home(videoPath, path.basename(fileName) + ".mp4");
  fullMetadata = { ...videoMetadata, path: `~/${videoPath}/${fileName}.mp4` };

  // We display the loading state
  void showFeedback(`
    <div class="px-6 py-4 rounded default">
      ${getVideoTemplate(
        `${getLoadingSpinner()} Downloading "${fullMetadata.title}"`,
        fullMetadata
      )}
    </div>
  `);

  // We download the video
  const res = await youtubeDlExec(videoSrc, { output: newPath });
  console.log(res);

  // If all went well, we can show a success message
  showFeedback(`
    <div class="px-6 py-4 rounded success">
      ${getVideoTemplate(
        `✅ Successfully downloaded "${fullMetadata.title}"`,
        fullMetadata
      )}
    </div>
  `);
  await wait(1000);

  // After a second, we offer the user the choice of what to do next
  const nextStep = await arg("What would you like to do with this file?", [
    {
      name: "Show in finder ↗️",
      description: `Open ~/${videoPath}`,
      value: "locate",
    },
    {
      name: "Open video 🎥",
      description: `View video in default player`,
      value: `view`,
    },
  ]);

  // We check for the user's choice in and open either the file or the location
  if (nextStep === "locate") {
    exec(`open --reveal ${newPath}`);
  } else if (nextStep === "view") {
    exec(`open ${newPath}`);
  }

  // In case something went wrong, we show the error
} catch (err) {
  console.log(err);
  await showFeedback(`
    <div class="px-6 py-4 rounded error">
      <p class="px-6 py-4 mb-4 rounded error">
        🔴 Error ${err}
      </p>
      ${getVideoTemplate(
        `🔴 Error downloading "${fullMetadata?.title}"`,
        fullMetadata || {}
      )}
    </div>
  `);
}
