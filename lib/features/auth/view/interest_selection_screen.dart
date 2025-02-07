import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinterestclone/core/api_response_enum.dart';
import 'package:pinterestclone/features/auth/providers/auth_provider.dart';
import 'package:pinterestclone/features/auth/providers/interest_provider.dart';

class InterestSelectionScreen extends ConsumerStatefulWidget {
  const InterestSelectionScreen({super.key});

  @override
  ConsumerState<InterestSelectionScreen> createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState
    extends ConsumerState<InterestSelectionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(interestProvider).getAllInterest();
    });
  }

  @override
  Widget build(BuildContext context) {
    final interestState = ref.watch(interestProvider);
    switch (interestState.apiState) {
      case ApiState.initial:
      case ApiState.loading:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ApiState.error:
        return Column(
          children: [
            Text("Error"),
            ElevatedButton(
              onPressed: () {
                ref.read(interestProvider).getAllInterest();
              },
              child: Text("Try Again"),
            )
          ],
        );
      case ApiState.success:
        return Stack(
          children: [
            GridView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  ref.read(interestProvider).selectInterest(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: interestState.interest[index].isSelected
                        ? Colors.amber
                        : Colors.red,
                    image: DecorationImage(
                      image: NetworkImage(
                          interestState.interest[index].name ?? ""),
                    ),
                  ),
                  child: Text(
                    interestState.interest[index].name ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
              ),
              itemCount: interestState.interest.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Visibility(
                visible: interestState.hasSelectedAnInterest,
                child: ElevatedButton(
                  onPressed: () {
                    final selectedInterets =
                        ref.read(interestProvider).getSelectedInterest();
                    ref.read(authProvider).setInterest(selectedInterets);
                    ref.read(authProvider).createUser();
                  },
                  child: Text("Continue"),
                ),
              ),
            ),
          ],
        );
    }
  }
}
