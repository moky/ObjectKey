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

class Pair<A, B> {
  const Pair(this.first, this.second);

  final A first;
  final B second;

  @override
  bool operator ==(Object other) {
    if (other is Pair) {
      if (identical(this, other)) {
        // same object
        return true;
      }
      return _objectEquals(first, other.first)
          && _objectEquals(second, other.second);
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(first, second);

  String get className => _runtimeType(this, 'Pair');

  @override
  String toString() {
    String clazz = className;
    return '<$clazz>\n\t<a>$first</a>\n\t<b>$second</b>\n</$clazz>';
  }

}

class Triplet<A, B, C> {
  const Triplet(this.first, this.second, this.third);

  final A first;
  final B second;
  final C third;

  @override
  bool operator ==(Object other) {
    if (other is Triplet) {
      if (identical(this, other)) {
        // same object
        return true;
      }
      return _objectEquals(first, other.first)
          && _objectEquals(second, other.second)
          && _objectEquals(third, other.third);
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(first, second, third);

  String get className => _runtimeType(this, 'Triplet');

  @override
  String toString() {
    String clazz = className;
    return '<$clazz>\n\t<a>$first</a>\n\t<b>$second</b>\n\t<c>$third</c>\n</$clazz>';
  }

}

// class Quartet<A, B, C, D> {
//
// }
//
// class Quintet<A, B, C, D, E> {
//
// }

// TODO: Sextet
// TODO: Septet
// TODO: Octet
// TODO: Ennead
// TODO: Decade

bool _objectEquals(Object? obj1, Object? obj2) {
  if (obj1 == null) {
    return obj2 == null;
  } else if (obj2 == null) {
    return false;
  } else {
    return obj1 == obj2;
  }
}

String _runtimeType(Object object, String className) {
  assert(() {
    className = object.runtimeType.toString();
    return true;
  }());
  return className;
}
