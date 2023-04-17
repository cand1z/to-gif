
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

```console
    git clone https://github.com/cand1z/toGif.git
```

Enter the project directory

```console
    cd toGif
```

Giving execute permission to the script

```console
    chmod +x toGif.sh
```



## Example of use


```console
    ./toGif.sh filename.webm filename.gif
```


## Decrease file size

To decrease the file size (consequently decrease its resolution), we can use the gifsicle tool, as shown in the following example:

```console
    gifsicle --optimize=3 --output "filename-optimized.gif" --resize-height 1000 "filename.gif"
```

