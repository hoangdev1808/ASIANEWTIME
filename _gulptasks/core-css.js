import {
	src,
	dest
} from "gulp";
import concat from "gulp-concat";
import plumber from "gulp-plumber";
import cssnano from "cssnano";
import postcss from "gulp-postcss";
import cssSort from "css-declaration-sorter";
import autoprefixer from "autoprefixer";
import {
	readFileSync
} from "graceful-fs";

export const cssCore = () => {
	let glob = JSON.parse(readFileSync("config.json"))
	return src(glob.css, {
			allowEmpty: true
		})
		.pipe(plumber())
		.pipe(concat("plugins.min.css"))
		.pipe(postcss([
			autoprefixer({
				browsers: ["last 4 version", "IE 9"],
				cascade: false
			}),
			cssnano(),
			cssSort({
				order: "concentric-css",
			})
		]))
		.pipe(dest("dist/css"))
}

module.exports = cssCore;
