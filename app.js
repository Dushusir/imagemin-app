const imagemin = require('imagemin');

const imageminMozjpeg = require('imagemin-mozjpeg');
const imageminPngquant = require('imagemin-pngquant');
const imageminGiflossy = require('imagemin-giflossy');
const imageminWebp = require('imagemin-webp');
const imageminSvgo = require('imagemin-svgo');


(async () => {
	const files = await imagemin(['images/*.{jpg,png,gif}'], {
		destination: 'build/images',
		plugins: [
			imageminMozjpeg({
                quality: 70
            }),
            imageminPngquant(),
            imageminGiflossy({
                lossy: 80
            }),
            // imageminWebp(),
            imageminSvgo()
		]
	});

	console.log(files);
	//=> [{data: <Buffer 89 50 4e …>, destinationPath: 'build/images/foo.jpg'}, …]
})();