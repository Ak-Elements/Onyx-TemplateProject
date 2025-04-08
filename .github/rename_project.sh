#!/usr/bin/env bash
while getopts a:n:u:d: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        n) name=${OPTARG};;
        u) urlname=${OPTARG};;
        d) description=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Project Name: $name";
echo "Project URL name: $urlname";
echo "Description: $description";

echo "Renaming project..."

original_author="Ak-Elements"
original_name="onyx_templateproject"
original_urlname="Onyx-TemplateProject"
original_description="Awesome onyx_templateproject created by Ak-Elements"
# for filename in $(find . -name "*.*") 
for filename in $(git ls-files) 
do
    sed -i "s/$original_author/$author/g" $filename
    sed -i "s/$original_name/$name/g" $filename
    sed -i "s/$original_urlname/$urlname/g" $filename
    sed -i "s/$original_description/$description/g" $filename
    echo "Renamed $filename"
done

# replace @PROJECT_NAME@ in generate projects
sed -i "s/@PROJECT_NAME@/$name/g" "generate_project.ps1"
sed -i "s/@PROJECT_NAME@/$name/g" "generate_project.bat"
sed -i "s/@PROJECT_NAME@/$name/g" "generate_project.sh"

mv onyx_templateproject $name

# This command runs only once on GHA!
rm -rf .github/template.yml
