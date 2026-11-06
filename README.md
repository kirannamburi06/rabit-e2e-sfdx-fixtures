# rabit e2e SFDX fixtures

SFDX (source-format) Git fixtures for rabit's end-to-end CI job tests
(`com.rabit.integration.cijob.triggerbuild` in rabit). rabit registers this repository as SFDX-enabled, which the
SFDX job types (SFDXVC2SF, UPVC2SF, CUPVC2SF) require. Metadata-format fixtures live in `rabit-e2e-fixtures`.
Each branch is one fixture; tests point at it through `application-it.yaml`.

| Branch | Layout | Used by |
|---|---|---|
| `sfdxvc2sf-source` | SFDX project: `sfdx-project.json` + package directory `force-app` | `SfdxVc2SfStartBuildET` |
| `upvc2sf-install` | Unlocked package `RabitE2EInstallPkg` (`force-app`) with a promoted version in `packageAliases` | `UpVc2SfStartBuildET` |
| `cupvc2sf-create` | Unlocked package `RabitE2ECreatePkg` (`force-app`); each run adds its new version to `packageAliases` | `CupVc2SfStartBuildET` |

Conventions:
- One fixture per branch, named after the job type and the variant it exercises.
- Keep each fixture small and self-contained, so it validates against a clean Developer org.
- The SFDX job tests validate only; the package tests really install their versions into the org on every run.
- `cupvc2sf-create` gets a commit from AutoRABIT on every run, so pull before changing it and never force-push it.
- When a branch's contents change, update the fixture keys in rabit's `application-it.yaml`.
