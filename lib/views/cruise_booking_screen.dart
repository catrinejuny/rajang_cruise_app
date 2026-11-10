import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

// Main screen adapting between portrait and landscape orientations
class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final bool isPortrait = orientation == Orientation.portrait;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              isPortrait
                  ? 'Sibu River Cruise & Heritage'
                  : 'Sibu River Cruise & Heritage (Landscape Split View)',
            ),
          ),
          body: isPortrait
              ? _buildPortraitLayout()
              : _buildLandscapeLayout(),
        );
      },
    );
  }

  // Single-column scrollable layout for portrait mode
  Widget _buildPortraitLayout() {
    final dest = viewModel.destination;
    return ListView(
      children: [
        HeaderImageWidget(
          imageUrl: dest.imageUrl,
          caption: 'Sibu Esplanade Landmark',
        ),
        TitleSectionWidget(
          title: dest.name,
          subtitle: dest.location,
          starCount: viewModel.starCount,
          isStarred: viewModel.isStarred,
          onStarPressed: viewModel.toggleStar,
        ),
        const Divider(indent: 16, endIndent: 16),
        const ActionBarWidget(),
        const Divider(indent: 16, endIndent: 16),
        DescriptionWidget(description: dest.description),
        BookingControlsWidget(viewModel: viewModel),
      ],
    );
  }

  // Side-by-side split pane layout for landscape mode
  Widget _buildLandscapeLayout() {
    final dest = viewModel.destination;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left pane: Header image and description
        Expanded(
          flex: 5,
          child: ListView(
            children: [
              HeaderImageWidget(
                imageUrl: dest.imageUrl,
                caption: 'Rajang River Horizon',
              ),
              DescriptionWidget(
                description: dest.description,
                showHeading: true,
              ),
            ],
          ),
        ),
        const VerticalDivider(width: 1),
        // Right pane: Title, actions, and booking controls
        Expanded(
          flex: 6,
          child: ListView(
            children: [
              TitleSectionWidget(
                title: dest.name,
                subtitle: dest.location,
                starCount: viewModel.starCount,
                isStarred: viewModel.isStarred,
                onStarPressed: viewModel.toggleStar,
              ),
              const Divider(indent: 16, endIndent: 16),
              const ActionBarWidget(),
              const Divider(indent: 16, endIndent: 16),
              BookingControlsWidget(viewModel: viewModel),
            ],
          ),
        ),
      ],
    );
  }
}