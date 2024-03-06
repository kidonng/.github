function wrap_chrome_apps
    sed --in-place s!/opt/google/chrome/google-chrome!google-chrome-stable! \
        ~/.local/share/applications/chrome-*.desktop
end
