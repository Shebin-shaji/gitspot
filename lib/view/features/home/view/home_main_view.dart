import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMainView extends StatelessWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "GitSpot",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const .symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Search for Git users",
                  labelStyle: const TextStyle(color: Colors.grey),

                  // Unfocused border
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.2,
                    ),
                  ),

                  // Focused border
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),

                  // Background
                  filled: true,
                  fillColor:
                      Colors.transparent, // keep transparent or set a color
                ),
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
              ),
              SizedBox(height: 6),
              Align(
                alignment: .bottomRight,
                child: Text(
                  "Search a Repo",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      spacing: 12,

                      children: [
                        CircleAvatar(radius: 45, backgroundColor: Colors.white),
                        Column(
                          spacing: 10,
                          mainAxisAlignment: .spaceBetween,
                          crossAxisAlignment: .start,
                          children: [
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  "Shebin Shaji",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                                Align(
                                  alignment: .centerRight,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Repositories",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "51",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Followers",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "51",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Following",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "51",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      spacing: 12,
                      children: [
                        Icon(Icons.person, color: Colors.white),
                        Text(
                          "Data Science | AI/ML",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 14),

                    Row(
                      spacing: 12,
                      children: [
                        Icon(Icons.attach_file_outlined, color: Colors.white),
                        Text(
                          "Not Mentioned",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
