part of default_project;

// data/default/project/init.dart

void initDefaultProject(var entries) {
   _initProjects(entries);
}

void _initProjects(var entries) {
  Project project1 = new Project.withId(entries.projects.concept, 'dartling');
  project1.description = 'A domain model framework.';
  entries.projects.add(project1);

  Project project2 = new Project.withId(entries.projects.concept, 'Wicket');
  project2.description = 'A web component framework.';
  entries.projects.add(project2);
}



