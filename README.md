
# toGif

Simple bash script to convert video to gif.


## Pendencies

- ffmpeg

You can see the documentation here:

```
https://ffmpeg.org/ffmpeg.html
```

## Install


Cloning the project

```bash
    git clone https://github.com/cand1z/toGif.git
```

Enter the project directory

```bash
    cd toGif
```

Giving execute permission to the script

```bash
    chmod +x toGif.sh
```



## Example of use


```console
    ./toGif.sh filename.webm filename.gif
```


## Decrease file size

To decrease the file size (consequently decrease its resolution), we can use the gifsicle tool, as shown in the following example:

```bash
    gifsicle --optimize=3 --output "filename-optimized.gif" --resize-height 1000 "filename.gif"
```

