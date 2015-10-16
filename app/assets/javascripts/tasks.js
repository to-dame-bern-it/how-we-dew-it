function toggleVideoVolume() {
  vid = $('#bgvid')
  if(vid.prop('muted') == true){
    vid.prop('muted', false)
  } else {
    vid.prop('muted', true)
  }
}
