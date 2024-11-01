import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:falack_app/core/dto/get/benefit_dto.dart';
import 'package:falack_app/features/test/use_case_test.dart';
import 'package:falack_app/core/dto/create/create_benefit_dto.dart';
import 'package:falack_app/core/dto/update/update_benefit_dto.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late BenefitUseCase benefitUseCase;
  List<BenefitDTO> benefits = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    // Initialize the use case from GetIt
    benefitUseCase = GetIt.instance<BenefitUseCase>();
    _loadBenefits();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (errorMessage != null) {
      return Scaffold(body: Center(child: Text(errorMessage!)));
    }

    return Scaffold(
        appBar: AppBar(title: const Text('Benefits')),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: benefits.length,
                  itemBuilder: (context, index) {
                    final benefit = benefits[index];
                    return ListTile(
                        title: Text('Created At: ${benefit.createdAt}'),
                        subtitle: Text('Rate: ${benefit.rate}'));
                  })),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => _createBenefit(),
              child: const Text('Create Benefit')),
          ElevatedButton(
              onPressed: () => _getBenefitById(),
              child: const Text('Get Benefit by ID')),
          ElevatedButton(
              onPressed: () => _updateBenefit(),
              child: const Text('Update Benefit')),
          ElevatedButton(
              onPressed: () => _deleteBenefit(),
              child: const Text('Delete Benefit'))
        ]));
  }

  Future<void> _loadBenefits() async {
    final result = await benefitUseCase.getAllBenefits();
    result.fold((failure) {
      setState(() {
        isLoading = false;
        errorMessage = failure.toString(); // Handle failure
      });
    }, (benefitsList) {
      setState(() {
        isLoading = false;
        benefits = benefitsList;
      });
    });
  }

  Future<void> _getBenefitById() async {
    final id = await _showInputDialog('Enter Benefit ID');
    if (id == null) return;

    final result = await benefitUseCase.getBenefitById(int.parse(id));
    result.fold((failure) => _showErrorDialog(failure.toString()),
        (benefit) => _showSuccessDialog('Benefit fetched successfully!'));
  }

  Future<void> _createBenefit() async {
    final benefitDto = CreateBenefitDTO(
        rate: 10.0,
        fromDatetime: DateTime.now(),
        toDatetime: DateTime.now().add(const Duration(days: 5)));

    final result = await benefitUseCase.createBenefit(benefitDto);
    result.fold((failure) => _showErrorDialog(failure.toString()), (benefit) {
      _showSuccessDialog('Benefit created successfully!');
      _loadBenefits(); // Refresh the list
    });
  }

  Future<void> _updateBenefit() async {
    final id = await _showInputDialog('Enter Benefit ID');
    if (id == null) return;

    final benefitDto = UpdateBenefitDTO(
        benefitId: int.parse(id),
        rate: 12.0,
        fromDatetime: DateTime.now(),
        toDatatime: DateTime.now().add(const Duration(days: 10)),
        updatedAt: DateTime.now());

    final result = await benefitUseCase.updateBenefit(benefitDto);
    result.fold((failure) => _showErrorDialog(failure.toString()), (benefit) {
      _showSuccessDialog('Benefit updated successfully!');
      _loadBenefits(); // Refresh the list
    });
  }

  Future<void> _deleteBenefit() async {
    final id = await _showInputDialog('Enter Benefit ID');
    if (id == null) return;

    final result = await benefitUseCase.deleteBenefit(int.parse(id));
    result.fold((failure) => _showErrorDialog(failure.toString()), (isDeleted) {
      _showSuccessDialog('Benefit deleted successfully!');
      _loadBenefits(); // Refresh the list
    });
  }

  Future<String?> _showInputDialog(String title) async {
    String? input;
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(title),
              content: TextField(
                  onChanged: (value) => input = value,
                  decoration:
                      const InputDecoration(hintText: 'Enter value here')),
              actions: <Widget>[
                TextButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.pop(context)),
                TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.pop(context, input))
              ]);
        });
    return input;
  }

  void _showErrorDialog(String message) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Error'),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(context).pop())
              ]);
        });
  }

  void _showSuccessDialog(String message) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Success'),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(context).pop())
              ]);
        });
  }
}
