# rabit e2e SFDX fixtures

SFDX (source-format) Git fixtures for rabit's end-to-end CI job tests
(`com.rabit.integration.cijob.triggerbuild` in rabit). rabit registers this repository as SFDX-enabled, which the
SFDX job types (SFDXVC2SF, UPVC2SF, CUPVC2SF) require. Metadata-format fixtures live in `rabit-e2e-fixtures`.
Each branch is one fixture; tests point at it through `application-it.yaml`.

| Branch | Layout | Used by |
|---|---|---|
| `sfdxvc2sf-source` | SFDX project: `sfdx-project.json` + package directory `force-app` | `SfdxVc2SfStartBuildET` |

Conventions:
- One fixture per branch, named after the job type and the variant it exercises.
- Keep each fixture small and self-contained, so it validates against a clean Developer org.
- Tests only run validate-only (check-only) deploys, so nothing here is ever saved to an org.
- When a branch's contents change, update the fixture keys in rabit's `application-it.yaml`.
