# README: `press_release_v4`

- Notes by: Tim Fraser
- Developed by: Tim Fraser & Peilin Li

This folder contains all code necessary to generate an automated press release, with the `officedown` package in `RMarkdown`.

Here's a quick summary of the folder:

### Required Files

- `report.docx`: example rendered report.
- `report.Rmd`: the RMarkdown file that renders the report.
- `logo_cat.png`: CAT Logo image used in report.
- `logo_reporter.png`: REPORTER Logo image used in report.
- `logo_visualizer.png`: CAT VISUALIZER Logo image used in report.
- `styles.docx`: the word doc style sheet used as a template for the report.
- `catviz_0.2.0.tar.gz`: `catviz` package used for visualization functions.

This press release relies on two endpoints from the CAT Public API, including:

- https://api.cat-apps.com/visualizer/v1/retrieve_p/
- https://api.cat-apps.com/reporter/v1/retrieve_data/donut

For more details, see:

- https://api.cat-apps.com/

