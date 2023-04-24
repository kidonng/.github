test (uname) = Darwin || exit

function sign_application --argument-names name
    set -l app "/Applications/$name.app"
    if ! test -d $app
        echo App "'$name'" does not exist >&2
        return 1
    end

    set -l id (appid $name)
    set -l entitlements (mktemp -t entitlements)

    # https://github.com/chamburr/glance/blob/febd696e106710e3a4d0acd61d22e1e45b81c632/README.md#installation
    xattr -cr $app
    echo '
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
            <dict>
                <key>com.apple.security.app-sandbox</key>
                <true/>
                <key>com.apple.security.application-groups</key>
                <array>
                    <string>group.'$id'</string>
                </array>
                <key>com.apple.security.files.user-selected.read-only</key>
                <true/>
            </dict>
        </plist>
    ' > $entitlements
    codesign -s - -f --deep --entitlements $entitlements $app

    rm $entitlements
end
