# Changelog

<!--next-version-placeholder-->

## v0.1.0 (2022-11-28)
### Feature
* Support entity detection ([`02e3513`](https://github.com/vdvman1/bolt-raycast/commit/02e3513afe438f41bda06b099441eae253fcba11))
* Add plugin to explicitly include comments ([`f672698`](https://github.com/vdvman1/bolt-raycast/commit/f672698906b5a456c7172633c0f5229efefebbaf))
* Support detecting blocks ([`73a3123`](https://github.com/vdvman1/bolt-raycast/commit/73a3123688fa0d03d239eafad6e71172721b94c6))
* Remove unnecessary mcfunction when not using is_new_block_pos ([`cd86617`](https://github.com/vdvman1/bolt-raycast/commit/cd86617ac44d6a9f06d20b7f1021e2a2f9a63233))
* Support checking whether the ray has moved to a new block position ([`c444f38`](https://github.com/vdvman1/bolt-raycast/commit/c444f38dff13f4e0a73ef3f2c292381932aad9cf))
* Simplify the API for specifying the max distance in the raycast ([`d2e6183`](https://github.com/vdvman1/bolt-raycast/commit/d2e6183e634010b0145bbd2845b4d7b122b861b9))
* Create core raycast loop ([`3c6b910`](https://github.com/vdvman1/bolt-raycast/commit/3c6b9106cc145422a7e41c255f748a211fce8eaa))

### Fix
* Branching state not being properly stored across calls to not ([`9d0e9c9`](https://github.com/vdvman1/bolt-raycast/commit/9d0e9c9fdfcd2dc89be43e240d98e6211392e97a))
* Generate nice names for the bodies of is_new_block_pos ([`20a9683`](https://github.com/vdvman1/bolt-raycast/commit/20a96830e218f9ae84a4b1f04a6dc9cd5363020c))
* Perform setup after user code, and cleanup before user code ([`df35333`](https://github.com/vdvman1/bolt-raycast/commit/df35333f96b6e8770f8d1d679d0ae3d8db9465f7))

### Breaking
* Subclasses of BranchMixin must now implement _create_opposite instead of __not__, and only construct a new instance of the subclass  ([`9d0e9c9`](https://github.com/vdvman1/bolt-raycast/commit/9d0e9c9fdfcd2dc89be43e240d98e6211392e97a))
* BranchStatus   .SingleBranch -> .LoneBranch and .Else -> .DoubleBranch  ([`be55b7a`](https://github.com/vdvman1/bolt-raycast/commit/be55b7aa13be2ab89e6cf56ac5e4866e73d6780c))

### Documentation
* Mention required pip dependencies ([`693c064`](https://github.com/vdvman1/bolt-raycast/commit/693c064ec1cfd5338d74e256df683d477c8684fa))
