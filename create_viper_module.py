import os
import yaml
from pathlib import Path

def get_package_name_from_yaml(yaml_file_path):
    try:
        with open(yaml_file_path, 'r') as yaml_file:
            parsed_yaml = yaml.safe_load(yaml_file)
            return parsed_yaml.get("name")
    except Exception as e:
        print(f"Error reading YAML file: {e}")
        return None

def create_viper_files(module_name, class_name, full_path):
    base_path = 'lib'
    normalized_path = os.path.normpath(full_path)

    try:
        
        lib_index = normalized_path.index(base_path)
        project_root = Path(normalized_path[:lib_index]).parent
        relative_path = normalized_path[lib_index + len(base_path) + 1:]


        package_yaml_path = project_root / 'pubspec.yaml'
        package_name_from_yaml = get_package_name_from_yaml(package_yaml_path)
        if not package_name_from_yaml:
            print("Could not extract package name from pubspec.yaml or path.")
            return

        module_folder_path = Path(normalized_path) / module_name
        module_folder_path.mkdir(parents=True, exist_ok=True)
        print(f"Created module folder: {module_folder_path}")

 
        if relative_path:
            adjusted_path = f"{package_name_from_yaml}/{relative_path}/{module_name}".strip('/')
        else:
            adjusted_path = f"{package_name_from_yaml}/{module_name}".strip('/')

        
        file_names = [
            f"{module_name}_controller.dart",
            f"{module_name}_interactor.dart",
            f"{module_name}_interfaces.dart",
            f"{module_name}_presenter.dart",
            f"{module_name}_router.dart",
            f"{module_name}_widget.dart"
        ]

        file_contents = [
            f"""import 'package:flutter/cupertino.dart';\nimport 'package:{adjusted_path}/{module_name}_interfaces.dart';\n\nclass {class_name}Controller implements {class_name}ControllerInterface {{\n  late {class_name}PresenterInterface presenter;\n  late BuildContext _context;\n\n  void onWidgetBuilt(BuildContext context) {{\n    _context = context;\n    presenter.onWidgetBuilt(_context);\n  }}\n}}\n""",
            f"""import 'package:{adjusted_path}/{module_name}_interfaces.dart';\n\nclass {class_name}Interactor implements {class_name}InteractorInputInterface {{\n  late {class_name}InteractorOutputInterface presenter;\n}}\n""",
            f"""import 'package:flutter/material.dart';\n\n/// Controller => Presenter\nabstract class {class_name}PresenterInterface {{\n  void onWidgetBuilt(BuildContext context);\n}}\n\n/// Presenter => Interactor\nabstract class {class_name}InteractorInputInterface {{}}\n\n/// Interactor => Presenter\nabstract class {class_name}InteractorOutputInterface {{}}\n\n/// Presenter => Controller\nabstract class {class_name}ControllerInterface {{}}\n\n/// Presenter => Router\nabstract class {class_name}RouterInterface {{}}\n""",
            f"""import 'package:flutter/cupertino.dart';\nimport 'package:{adjusted_path}/{module_name}_interfaces.dart';\n\nclass {class_name}Presenter implements {class_name}PresenterInterface, {class_name}InteractorOutputInterface {{\n  final {class_name}InteractorInputInterface interactor;\n  final {class_name}ControllerInterface controller;\n  final {class_name}RouterInterface router;\n  late BuildContext _context;\n\n  {class_name}Presenter(this.controller, this.interactor, this.router);\n\n  @override\n  void onWidgetBuilt(BuildContext context) {{\n    _context = context;\n  }}\n}}\n""",
            f"""import 'package:{adjusted_path}/{module_name}_controller.dart';\nimport 'package:{adjusted_path}/{module_name}_interactor.dart';\nimport 'package:{adjusted_path}/{module_name}_interfaces.dart';\nimport 'package:{adjusted_path}/{module_name}_presenter.dart';\nimport 'package:{adjusted_path}/{module_name}_widget.dart';\n\nclass {class_name}Router extends {class_name}RouterInterface {{\n  static {class_name}Widget initModule() {{\n    {class_name}Interactor interactor = {class_name}Interactor();\n    {class_name}Controller controller = {class_name}Controller();\n    {class_name}Router router = {class_name}Router();\n    {class_name}Presenter presenter = {class_name}Presenter(controller, interactor, router);\n    interactor.presenter = presenter;\n    controller.presenter = presenter;\n    return {class_name}Widget(controller);\n  }}\n}}\n""",
            f"""import 'package:flutter/cupertino.dart';\nimport 'package:{adjusted_path}/{module_name}_controller.dart';\n\nclass {class_name}Widget extends StatefulWidget {{\n  final {class_name}Controller controller;\n\n  const {class_name}Widget(this.controller, {{Key? key}}) : super(key: key);\n\n  @override\n  State<{class_name}Widget> createState() => _{class_name}WidgetState();\n}}\n\nclass _{class_name}WidgetState extends State<{class_name}Widget> {{\n  @override\n  void initState() {{\n    super.initState();\n    WidgetsBinding.instance.addPostFrameCallback((_) {{\n      widget.controller.onWidgetBuilt(context);\n    }});\n  }}\n\n  @override\n  Widget build(BuildContext context) {{\n    return SizedBox(); \n  }}\n}}\n"""
        ]


        for file_name, content in zip(file_names, file_contents):
            file_path = module_folder_path / file_name
            with open(file_path, 'w') as f:
                f.write(content)
            print(f"Created file: {file_path}")
    except ValueError:
        print(f"Base path '{base_path}' not found in the provided path.")
    except Exception as e:
        print(f"Error creating files: {e}")

if __name__ == "__main__":
    module_name = input("Enter the module name: ")
    class_name = input("Enter the class name: ")
    folder_path = input("Enter the folder's relative path (e.g., scenes/one_card/summary): ")
    
    create_viper_files(module_name, class_name, folder_path)