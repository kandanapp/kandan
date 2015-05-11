# How to localize

### Table of Contents

* [Overview](#overview)
* [Requirements](#requirements)
* [PO catalog handling](#makepo)

<hr>
# <a name="overview"></a> OverView

Localize of Kandan app is based on two framework.

One is for Ruby I18N/L10N. It utilize standard ruby simple internationalization framework.
Kandan also support external translation network service such as transifex.com.
Because these translation service requires GetText PO style file, we can convert YML
translation catalog to PO file, and vise versa.

Another is for Backbone.js I18N. We use i18next js library for its purpose.
We need further development for its area.

<hr>
# <a name="requirements"></a>Requirements
* Ruby 1.9

<hr>
# <a name="makepo"></a>PO catalog handling

At first we need to master POT template file.
```
script/yaml2po -P config/locale/admin/en.yml /config/locale/admin/admin.pot
```
Now you can upload  POT file onto transifex.com or other translation
network service.

Creating language po file
```
script/yaml2po -l de -t config/locale/admin/en.yml config/admin/locale/de.yml config/locale/admin/de.po
```

Generate yml file from po file
To create a language's yaml from a given po file
```
script/po2yaml config/locale/admin/de.po config/locale/admin/de.yaml
```


