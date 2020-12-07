import {
	watch,
	series,
	parallel
} from "gulp"
import bSync from "browser-sync";

import jsCore from "./core-js"
import jsTask from "./script"
import pugTask from "./html"
import cssCore from "./core-css"
import sassTask from "./css"
import {
	copyImage
} from "./copy";
import {
	cleanImage
} from "./clean";

export const server = () => {
	bSync.init({
		notify: true,
		server: {
			baseDir: "dist",
		},
		port: 8000
	})

	watch([
		"src/js/*.js",
	], series(jsTask));

	watch([
		"src/**/**.pug"
	], series(pugTask));

	watch([
		"src/components/**/**.sass"
	], series(sassTask));

	watch([
		"src/img/**/**.{svg,png,jpg,speg,gif,jpge,PNG,JPGE,JPG,SVG,GIF,SPEG}"
	], series(cleanImage, copyImage));

	watch([
		"src/_plugins/**/**.css", "src/_plugins/**/**.js", "config.json"
	], parallel(jsCore, cssCore));

	watch([
		"dist"
	]).on("change", bSync.reload);
}

module.exports = server;
