/* license: https://mit-license.org
 *
 *  ObjectKey : Object & Key kits
 *
 *                               Written in 2023 by Moky <albert.moky@gmail.com>
 *
 * =============================================================================
 * The MIT License (MIT)
 *
 * Copyright (c) 2023 Albert Moky
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 * =============================================================================
 */
import 'dart:math';

class WeakList<E extends Object> implements List<E> {
  WeakList() : _inner = [];

  final List<WeakReference<dynamic>> _inner;

  void purge() => _inner.removeWhere((wr) => wr.target == null);

  @override
  void clear() => _inner.clear();

  @override
  List<E> toList({bool growable = true}) {
    // remove empty entries
    purge();
    // convert entries
    List<E> entries = [];
    E? item;
    for (WeakReference<dynamic> wr in _inner) {
      item = wr.target;
      if (item == null) {
        assert(false, 'should not happen');
      } else {
        entries.add(item);
      }
    }
    return entries;
  }

  @override
  Set<E> toSet() => toList().toSet();

  @override
  String toString() => toList().toString();

  @override
  Iterator<E> get iterator => toList().iterator;

  @override
  int get length => toList().length;

  @override
  set length(int size) {
    purge();
    _inner.length = size;
  }

  @override
  bool get isEmpty => toList().isEmpty;

  @override
  bool get isNotEmpty => toList().isNotEmpty;

  @override
  E get first => toList().first;

  @override
  set first(E item) => _inner.first = WeakReference(item);

  @override
  E get last => toList().last;

  @override
  set last(E item) => _inner.last = WeakReference(item);

  @override
  E get single => toList().single;

  @override
  List<E> operator +(List<E> other) => toList() + other;

  @override
  E operator [](int index) => toList()[index];

  @override
  void operator []=(int index, E value) {
    purge();
    _inner[index] = WeakReference(value);
  }

  @override
  void add(E value) => _inner.add(WeakReference(value));

  @override
  void addAll(Iterable<E> iterable) {
    for (var item in iterable) {
      add(item);
    }
  }

  @override
  bool any(bool Function(E element) test) => toList().any(test);

  @override
  Map<int, E> asMap() => toList().asMap();

  @override
  List<R> cast<R>() => toList().cast();

  @override
  bool contains(Object? element) => toList().contains(element);

  @override
  E elementAt(int index) => toList().elementAt(index);

  @override
  bool every(bool Function(E element) test) => toList().every(test);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E element) toElements) =>
      toList().expand(toElements);

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    purge();
    if (fillValue == null) {
      _inner.fillRange(start, end);
    } else {
      _inner.fillRange(start, end, WeakReference(fillValue));
    }
  }

  @override
  E firstWhere(bool Function(E element) test, {E Function()? orElse}) =>
      toList().firstWhere(test, orElse: orElse);

  @override
  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) =>
      toList().fold(initialValue, combine);

  @override
  Iterable<E> followedBy(Iterable<E> other) => toList().followedBy(other);

  @override
  void forEach(void Function(E element) action) => toList().forEach(action);

  @override
  Iterable<E> getRange(int start, int end) => toList().getRange(start, end);

  @override
  int indexOf(E element, [int start = 0]) => toList().indexOf(element, start);

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) =>
      toList().indexWhere(test, start);

  @override
  void insert(int index, E element) {
    purge();
    _inner.insert(index, WeakReference(element));
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    purge();
    for (var item in iterable) {
      _inner.insert(index, WeakReference(item));
      index += 1;
    }
  }

  @override
  String join([String separator = ""]) => toList().join(separator);

  @override
  int lastIndexOf(E element, [int? start]) => toList().lastIndexOf(element, start);

  @override
  int lastIndexWhere(bool Function(E element) test, [int? start]) =>
      toList().lastIndexWhere(test, start);

  @override
  E lastWhere(bool Function(E element) test, {E Function()? orElse}) =>
      toList().lastWhere(test, orElse: orElse);

  @override
  Iterable<T> map<T>(T Function(E e) toElement) => toList().map(toElement);

  @override
  E reduce(E Function(E value, E element) combine) => toList().reduce(combine);

  @override
  bool remove(Object? value) {
    /// Removes the first occurrence of [value] from this list.
    for (var wr in _inner) {
      if (wr.target == value) {
        return _inner.remove(wr);
      }
    }
    return false;
  }

  @override
  E removeAt(int index) {
    purge();
    var wr = _inner.removeAt(index);
    return wr.target;
  }

  @override
  E removeLast() {
    purge();
    var wr = _inner.removeLast();
    return wr.target;
  }

  @override
  void removeRange(int start, int end) {
    purge();
    _inner.removeRange(start, end);
  }

  @override
  void removeWhere(bool Function(E element) test) {
    _inner.removeWhere((wr) {
      E? item = wr.target;
      return item == null || test(item);
    });
  }

  @override
  void replaceRange(int start, int end, Iterable<E> replacements) {
    purge();
    /// Replaces a range of elements with the elements of [replacements].
    ///
    /// Removes the objects in the range from [start] to [end],
    /// then inserts the elements of [replacements] at [start].
    _inner.removeRange(start, end);
    int index = start;
    for (var item in replacements) {
      _inner.insert(index, WeakReference(item));
      index += 1;
    }
  }

  @override
  void retainWhere(bool Function(E element) test) => toList().retainWhere(test);

  @override
  Iterable<E> get reversed => toList().reversed;

  @override
  void setAll(int index, Iterable<E> iterable) {
    purge();
    /// Overwrites elements with the objects of [iterable].
    ///
    /// The elements of [iterable] are written into this list,
    /// starting at position [index].
    /// This operation does not increase the length of the list.
    ///
    /// The [index] must be non-negative and no greater than [length].
    ///
    /// The [iterable] must not have more elements than what can fit from [index]
    /// to [length].
    for (var item in iterable) {
      _inner[index] = WeakReference(item);
      index += 1;
    }
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    purge();
    /// Writes some elements of [iterable] into a range of this list.
    ///
    /// Copies the objects of [iterable], skipping [skipCount] objects first,
    /// into the range from [start], inclusive, to [end], exclusive, of this list.
    for (E item in iterable) {
      if (skipCount > 0) {
        skipCount -= 1;
        continue;
      } else if (start >= end) {
        break;
      }
      _inner[start] = WeakReference(item);
      start += 1;
    }
  }

  @override
  void shuffle([Random? random]) => _inner.shuffle(random);

  @override
  E singleWhere(bool Function(E element) test, {E Function()? orElse}) =>
      toList().singleWhere(test, orElse: orElse);

  @override
  Iterable<E> skip(int count) => toList().skip(count);

  @override
  Iterable<E> skipWhile(bool Function(E value) test) => toList().skipWhile(test);

  @override
  void sort([int Function(E a, E b)? compare]) {
    purge();
    if (compare == null) {
      // TODO: default compare function?
      _inner.sort();
    } else {
      _inner.sort((wr1, wr2) => compare(wr1.target, wr2.target));
    }
  }

  @override
  List<E> sublist(int start, [int? end]) => toList().sublist(start, end);

  @override
  Iterable<E> take(int count) => toList().take(count);

  @override
  Iterable<E> takeWhile(bool Function(E value) test) => toList().takeWhile(test);

  @override
  Iterable<E> where(bool Function(E element) test) => toList().where(test);

  @override
  Iterable<T> whereType<T>() => toList().whereType();

}
