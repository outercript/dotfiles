if [ -d /opt/android-sdk ]; then
  PATH=$PATH:/opt/android-sdk/tools
  PATH=$PATH:/opt/android-sdk/platform-tools
  PATH=$PATH:/opt/genymotion
  export PATH
fi
