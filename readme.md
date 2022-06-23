# docker-android 

simple react-native android docker image with the following stuff 

- React Native + Android
- Fastlane (ruby 2.7.5) (you'll have to reinstall this gem if you change the ruby version)
- `chruby` + `ruby-install`
- fallback installs of `ruby-2.7.5` 


## Usage 

You can either get the rolling release tag that get's updated dynamically if you like to play with fire or you can use date tagged images which you find in the 
[packages section](https://github.com/barelyhuman/docker-android/pkgs/container/docker-android)

```yml
image: ghcr.io/barelyhuman/docker-android:latest
# or
image: ghcr.io/barelyhuman/docker-android:20220621
```

```sh
docker pull ghcr.io/barelyhuman/docker-android:latest
# or 
docker pull ghcr.io/barelyhuman/docker-android:20220621
```

### Accepted Args 
Everything from the [react-native-community/docker-android](https://github.com/react-native-community/docker-android) image is passed down to the base image 
and the additional arg you can pass are listed below

#### `INSTALL_RUBY_VERSION`
<small>default value: `3.0.0`</small>

This arg will add another ruby version into the image, the base image comes with `2.7.5` and the above default value

`2.7.5` => Used by react-native by default 
`3.0.0` => Personal preferred version

### Usage in CI

Due to the nature of how CI's and specifically ubuntu images handle `exec` , you'll have to source this before running `chruby` in your CI scripts

```sh
source /usr/local/share/chruby/chruby.sh
chruby 3.0.0
```