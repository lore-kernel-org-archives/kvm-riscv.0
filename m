From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 4 Sep 2024 12:31:03 +0200
Subject: [kvm-unit-tests PATCH 0/3] Support cross compiling with clang
In-Reply-To: <20240903163046.869262-5-andrew.jones@linux.dev>
References: <20240903163046.869262-5-andrew.jones@linux.dev>
Message-ID: <20240904-b4568b20f98773096c0ebbf8@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 03, 2024 at 06:30:47PM GMT, Andrew Jones wrote:
> Modify configure to allow --cc=clang and a cross-prefix to be specified
> together (as well as --cflags). This allows compiling with clang, but
> using cross binutils for everything else, including the linker. So far
> tested on riscv 32- and 64-bit and aarch64 (with some hacks to the code
> to get it to compile - which is why there's no gitlab-ci patch for aarch64
> in this series). I suspect it should work for other architectures too.
> 
> Andrew Jones (3):
>   riscv: Drop mstrict-align
>   configure: Support cross compiling with clang
>   riscv: gitlab-ci: Add clang build tests
> 
>  .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
>  configure      | 11 ++++++++---
>  riscv/Makefile |  2 +-
>  3 files changed, 37 insertions(+), 4 deletions(-)
> 
> -- 
> 2.46.0

When compiling with clang and --config-efi I hit

lib/efi.c:342:29: error: field 'vendor' with variable sized type 'struct efi_vendor_dev_path' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
  342 |         struct efi_vendor_dev_path      vendor;
      |                                         ^
1 error generated.

Our efi code is exactly the same as the Linux code, but Linux avoids that
warning with -Wno-gnu. We could also add that to EFI_CFLAGS, but I think
I'll just add -Wno-gnu-variable-sized-type-not-at-end since I like seeing
these things as they come.

I'll send a v2 with a Makefile patch added.

Thanks,
drew

