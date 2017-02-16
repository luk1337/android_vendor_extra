ROOT="${PWD}"
REPOSITORIES=(
    'packages/apps/ContactsCommon'
    'packages/apps/Contacts'
    'packages/apps/Settings'
    'packages/apps/ExactCalculator'
    'packages/apps/PhoneCommon'
    'packages/apps/masquerade'
    'build'
    'system/core'
    'system/sepolicy'
    'frameworks/native'
    'frameworks/base'
    'vendor/cm'
)

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

    git am "${ROOT}/vendor/extra/patches/${repository}"/*

    cd "${ROOT}"
done
