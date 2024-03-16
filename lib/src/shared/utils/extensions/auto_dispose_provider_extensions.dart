import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// extension CacheForFutureProvider<T> on AutoDisposeFutureProvider<T> {
//   /// Caches the result of the provider for [duration].
//   AutoDisposeFutureProvider<T> cache(
//       {Duration duration = const Duration(seconds: 5)}) {
//     return AutoDisposeFutureProvider<T>((ref) {
//       final link = ref.keepAlive();
//       Timer? timer;
//       ref.onCancel(() {
//         timer = Timer(duration, () {
//           link.close();
//         });
//       });

//       ref.onResume(() {
//         timer?.cancel();
//       });
// return  ref.watch(future);
//     });
//   }
// }

extension CacheAutoDisposableRefExtension on AutoDisposeRef<Object?> {
  /// Keeps the provider alive for [duration].
  void cache({Duration duration = const Duration(seconds: 30)}) {
    // Immediately prevent the state from getting destroyed.
    final link = keepAlive();
    // After duration has elapsed, we re-enable automatic disposal.
    Timer? timer;
    onCancel(() {
      timer = Timer(duration, () {
        // dispose on timeout
        link.close();
      });
    });

    // If the provider is listened again after it was paused, cancel the timer
    onResume(() {
      timer?.cancel();
    });
  }
}
