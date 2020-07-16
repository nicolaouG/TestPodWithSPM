# TestPodWithSPM

Use this as pod, SPM or submodule.

## Installation

#### Add it as a pod:

```swift
platform :ios, '13.2'
pod 'TestPodWithSPM'
```

#### As a swift package dependency:

Xcode / File / Swift Packages / Add Package Dependency / add_this_repo_url -> https://github.com/nicolaouG/TestPodWithSPM.git


# How to

## Setup Pod

- Xcode / File / New / Project / Framework
- File / New / Target / Single View App (as an example project)
- Create new github repo
- Link project to the repo:
```bash
$ git init
$ git remote add origin github_repo_url
$ git add .
$ git commit -m "commit message"
$ git push -u origin master
```
- Add readme and LICENSE files (easier from github - automatic license file when you name it like that) and pull them
- Install cocoapods (if not already installed):
```bash
$ gem install cocoapods
```
- Create Podspec:
```bash
$ pod spec create podName
```
- Edit Podspec accordingly. E.g:
```bash
$ open -a Xcode podName.podspec
```
```ruby
Pod::Spec.new do |spec|

  spec.name         = "GNImageCollection"
  spec.version      = "0.1.5"
  spec.summary      = "Shows image(s) with zooming, saving and sharing capabilities."
  spec.description  = <<-DESC
  This library can be used to show a collection view of images, either modally, in a navigation controller or as a subview, where they can be zoomed, saved or shared.
                   DESC
  spec.homepage     = "https://github.com/nicolaouG/GNImageCollection"
  spec.screenshots  = "https://raw.githubusercontent.com/nicolaouG/GNImageCollection/master/imagesCollection_podspec.gif"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "george" => "georgios.nicolaou92@gmail.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = "10.0"
  spec.swift_version = "5"
  spec.source       = { :git => "https://github.com/nicolaouG/GNImageCollection.git", :tag => "#{spec.version}" }
  spec.source_files = "GNImageCollection/**/*.{h,m,swift}"
  spec.framework    = "UIKit"
  spec.requires_arc = true

end
```
- Validate podspec:
```bash
$ pod spec lint podName.podspec
```
- Push with tags:
``` bash
$ git add, commit, push ...
$ git tag (to see the existing tags of the repo)
$ git tag 0.0.1
$ git push origin 0.0.1
```
- Register in cocoapods (if not already):
```bash
$ pod trunk register email@example.com username
```
- Publish:
```bash
$ pod trunk push
```

#### Notes:
- Delete pod: (version is the tag found in the podspec e.g 0.0.1). It might show an error but usually it is deleted anyways (try deleting it again to see 'No pod found with the specified name')
```bash
$ pod trunk delete podName version
... warning: will ask for confirmation ...
> y
```
- Update pod:
  - Change version in podspec
  - make the changes in code
  - push with a new tag
  - push trunk


## Setup Swift Package

- Create a swift package in the framework's or project's folder (creates the package manifest, Sources folder etc). It gets the same name as the parent project so it is suitable for use in an already existing pod / framework. Alternatively, create a new library from File / New / Swift Package.
```bash
$ swift package init
```
- Move the files from the pod's folder (or the ones you want to include in the library) to the Sources/** folder
- Change podspec source_files accordingly e.g:
```ruby
spec.source_files = Sources/**/*.{h,m,swift}
```
- In pod/framework Target / Build Phases / 
  - .../ Copy Bundle Resources -> remove pList
  - pod's .h file in .../ Headers / Public

#### Include package
File / Swift Packages / Add Package Dependency / ... / paste the git url

OR:

```ruby
dependencies: [
    .package(url: "https://github.com/nicolaouG/TestPodWithSPM", from: "0.0.1"),
]
```
*and*
```ruby
targets: [
    .target(name: "YourSP_or_Project", dependencies: ["TestPodWithSPM"]),
]
```

#### Edit package
- Clone it from git
- Copy the whole library folder and paste it inside the project which might already have it as a dependency (it overrides the dependency)
- Edit any file(s) (changes are automatically tracked in the cloned lib folder)
- Push the updated cloned lib
- Push updated tag
- Optional: Delete local package (dependency re-appears)
- File / Swift Packages / Update...


