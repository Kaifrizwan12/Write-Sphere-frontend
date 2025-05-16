// This file contains the code for the AddBlog class which is a function inside a stateful widget.


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final MultiSelectController<String> controllerM =
      MultiSelectController<String>();
  final TextEditingController BlogNameC = TextEditingController();
  final TextEditingController BlogGenreC = TextEditingController();
  final TextEditingController BlogPreviewC = TextEditingController();
  final TextEditingController BlogContentC = TextEditingController();
  final TextEditingController BlogAutherC = TextEditingController();

  final FocusNode blogNameFocus = FocusNode();
  final FocusNode blogGenreFocus = FocusNode();
  final FocusNode blogPreviewFocus = FocusNode();
  final FocusNode blogContentFocus = FocusNode();
  final FocusNode blogAuthorFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    var items = [
      DropdownItem(label: 'Technology', value: 'Technology'),
      DropdownItem(label: 'Science', value: 'Science'),
      DropdownItem(label: 'Education', value: 'Education'),
      DropdownItem(label: 'Health', value: 'Health'),
      DropdownItem(label: 'Sports', value: 'Sports'),
      DropdownItem(label: 'Entertainment', value: 'Entertainment'),
      DropdownItem(label: 'Travel', value: 'Travel'),
      DropdownItem(label: 'Food', value: 'Food'),
      DropdownItem(label: 'Art', value: 'Art'),
      DropdownItem(label: 'Music', value: 'Music'),
      DropdownItem(label: 'History', value: 'History'),
      DropdownItem(label: 'Politics', value: 'Politics'),
    ];

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/write-svgrepo-com.svg',
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: BlogNameC,
                    focusNode: blogNameFocus,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter blog title',
                    ),
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(blogGenreFocus);
                    },
                  ),
                ),
                // SizedBox(
                //   width: double.infinity,
                //   child: TextField(
                //     textInputAction: TextInputAction.next,
                //     controller: BlogGenreC,
                //     focusNode: blogGenreFocus,
                //     maxLines: null,
                //     decoration: const InputDecoration(
                //       border: OutlineInputBorder(),
                //       hintText: 'Enter blog genre',
                //     ),
                //     onSubmitted: (_) {
                //       FocusScope.of(context).requestFocus(blogPreviewFocus);
                //     },
                //   ),
                // ),

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: BlogPreviewC,
                    focusNode: blogPreviewFocus,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter blog preview',
                    ),
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(blogContentFocus);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: BlogContentC,
                    focusNode: blogContentFocus,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter blog content',
                    ),
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(blogAuthorFocus);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: BlogAutherC,
                    focusNode: blogAuthorFocus,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter author name (optional)',
                    ),
                    onSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: MultiDropdown<String>(
                    items: items,
                    controller: controllerM,
                    searchEnabled: true,
                    enabled: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a blog genre';
                      }
                      return null;
                    },
                    onSelectionChange: (selectedItems) {
                      debugPrint("OnSelectionChange: $selectedItems");
                    },
                    chipDecoration: ChipDecoration(
                      backgroundColor: Colors.grey.shade900,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontFamily: 'Montserrat',
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fieldDecoration: FieldDecoration(
                      hintText: 'Select blog genre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue.shade400,
                        ),
                      ),
                    ),
                    dropdownDecoration: DropdownDecoration(
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: Colors.grey.shade800,
                    ),
                    dropdownItemDecoration: DropdownItemDecoration(
                      selectedIcon: Icon(
                        Icons.check,
                        color: Colors.green.shade300,
                      ),
                      selectedBackgroundColor:
                          Color(0xFFE2D3F5).withOpacity(0.5),
                      disabledIcon: Icon(
                        Icons.close,
                        color: Colors.red.shade400,
                      ),
                      disabledBackgroundColor: Colors.grey.shade700,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.755,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      //
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.edit, color: Color(0xFFE2D3F5)),
                        const SizedBox(width: 10),
                        Text(
                          'Spin It into the Sphere!',
                          style: TextStyle(
                            color: const Color(0xFFE2D3F5),
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
