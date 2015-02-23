# CoreDataModel
Sample Core Data model framework in Swift.

## Usage
This will help you set up a Swift Core Data project using a reusable data model as a Framework. 
Either start with these projects as a base, or (recommended) go through the steps to set everything up along the way.

### Getting Started:

1. Create a new Swift Framework project:
![create](Documentation/CreateFramework.png "Create Project")

2. Import Core Data Framework:
![import](Documentation/ImportCoreData.png "Import Core Data")

3. Copy the file CoreDataManager.swift into project.

4. Add a new Bundle target named CoreDataModelSchema. Yes... choose OSX instead of iOS.  We'll fix that later:
![bundle](Documentation/AddBundleForSchema.png "Add Bundle Target")

5. Create a new Core Data data model file and be certain to include it in the schema bundle target (not the framework).
![addSchemaFile](Documentation/ImportCoreData.png "Add Data Model File")

6. Add a new model version since we are setting up a versioned data model.
![version](Documentation/NewDataModel.png "Add Model Version")

7. Change the Base SDK from OSX to iOS.
![baseSDK](Documentation/ChangeBaseSDK.png "Change Base SDK")

8. Add a target dependency to your Framework so that the Bundle is built on Framework compile.
![target](Documentation/AddTargetDependency.png "Add Target Dependency")

 

