# Loclization

## packages:
- intl
- intl_transaltion

## commands

inside the root folder, run these commands 
`
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/src/i10n lib/src/locale.dart
`

`
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/src/i10n \ --no-use-deferred-loading lib/src/locale.dart lib/src/i10n/intl_*.arb
`