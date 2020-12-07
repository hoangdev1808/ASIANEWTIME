import {
	src,
	dest
} from "gulp";
import pug from "gulp-pug";
import plumber from "gulp-plumber";

export const pugTask = () => {
	return src([
			"src/pages/*.pug",
			"!src/pages/\_*.pug"
		])
		.pipe(plumber())
		.pipe(pug({
			pretty: "\t",

		}))
		.pipe(dest("dist"))
};

module.exports = pugTask;
