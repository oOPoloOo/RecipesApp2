abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {
  const FormSubmitting();
}

class SubmisionSuccess extends FormSubmissionStatus {
  const SubmisionSuccess();
}

class SubmisionFailed extends FormSubmissionStatus {
  final Exception exception;

  const SubmisionFailed(this.exception);
}
