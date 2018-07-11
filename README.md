# QaCube

Will hopefully one day be a collection of tools useful for QA's/Test automation engineers working with *ruby*. Currently it's just one tool.

Current contents:
 - Sheets-Appender


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'qa_cube'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qa_cube

## Usage

#### Sheets Appender
```
require 'google-sheets-appender'

range = 'A1:A'
spreadsheet_id = '0123456789abcdef'
sheet_name = 'ASheetName'
client_secret_path = '/directory/containing/client/secret/file/'
workspace = '/directory/containing/credentials/directory/' # You'll be prompted to generate a new key if no `.credentials` dir containing a valid key is found here.

appender = QaCube::SheetsAppender.new(spreadsheet_id: spreadsheet_id, sheet_name: sheet_name, client_secrets_path: client_secret_path, range: range, workspace_dir: workspace_dir)
appender.append(values: [[a,b,c,d,e,f,g]])

```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/btalpers/qa_cube
