ROOT="${PWD}"
REPOSITORIES=(
    'packages/apps/ContactsCommon'
    'packages/apps/Contacts'
    'packages/apps/Settings'
    'packages/apps/ExactCalculator'
    'packages/apps/PhoneCommon'
    'build'
    'system/sepolicy'
    'frameworks/native'
    'frameworks/base'
)

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

    git am "${ROOT}/oms-patches/${repository}"/*

    cd "${ROOT}"
done
