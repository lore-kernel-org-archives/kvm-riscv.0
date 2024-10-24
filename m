From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 24 Oct 2024 10:38:51 +0200
Subject: [kvm-unit-tests PATCH v3 0/5] Support cross compiling with clang
In-Reply-To: <20240911091406.134240-7-andrew.jones@linux.dev>
References: <20240911091406.134240-7-andrew.jones@linux.dev>
Message-ID: <20241024-cecbb361d7e3f21c7053408b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024 at 11:14:07AM +0200, Andrew Jones wrote:
> Modify configure to allow --cc=clang and a cross-prefix to be specified
> together (as well as --cflags). This allows compiling with clang, but
> using cross binutils for everything else, including the linker. So far
> tested on riscv 32- and 64-bit and aarch64 (with some hacks to the code
> to get it to compile - which is why there's no gitlab-ci patch for aarch64
> in this series). I suspect it should work for other architectures too.
> 
> v3:
>  - Add README patch for cross-compiling, clang, and cross-clang [Nick]
>  - Add comment to the commenting-out of mstrict-align [Nick]
>  - Add the reason to ignore warnings vs. fix code to commit message of
>    patch2
>  - Picked up Nick's tags
> v2:
>  - fix building with clang and --config-efi by suppressing a warning
>  - added riscv clang efi build to CI
>  - picked up Thomas's tags
> 
> Andrew Jones (5):
>   riscv: Drop mstrict-align
>   Makefile: Prepare for clang EFI builds
>   configure: Support cross compiling with clang
>   riscv: gitlab-ci: Add clang build tests
>   README: Add cross and clang recipes
> 
>  .gitlab-ci.yml | 43 +++++++++++++++++++++++++++++++++++++++++++
>  Makefile       |  2 ++
>  README.md      | 22 ++++++++++++++++++++++
>  configure      | 11 ++++++++---
>  riscv/Makefile |  4 +++-
>  5 files changed, 78 insertions(+), 4 deletions(-)
> 
> -- 
> 2.46.0
>

Merged

Thanks,
drew

