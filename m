From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 15:53:58 +0200
Subject: [kvm-unit-tests PATCH v2 0/4] riscv: Extend CI
In-Reply-To: <20240808154223.79686-6-andrew.jones@linux.dev>
References: <20240808154223.79686-6-andrew.jones@linux.dev>
Message-ID: <20240812-e97009553ee2983da3448575@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 08, 2024 at 05:42:24PM GMT, Andrew Jones wrote:
> So far we were only building and testing 64-bit, non-efi in the CI for
> riscv. I had mistakenly thought Fedora's riscv compiler could only build
> 64-bit, but it's multilib so we just need to add some CFLAGS to get it
> to work. To preserve building with a 32-bit-only riscv compiler we need
> to introduce limits.h to our tiny libc. And, while adding 32-bit builds
> to CI we also add EFI builds so now we test 32-bit, 64-bit, and 64-bit
> EFI. And, since Fedora has been udpated, bringing in a later QEMU, we
> can now do the testing with the 'max' cpu type.
> 
> v2:
>  - *Actually* test out-of-tree builds in the rv32 CI (I was missing
>    a few important lines, like 'cd build'...
>  - Add another patch to fix out-of-tree builds for riscv
>  - Added some indentation in the new limits.h
> 
> Andrew Jones (4):
>   lib: Add limits.h
>   riscv: Build with explicit ABI
>   riscv: Fix out-of-tree builds
>   riscv: Extend gitlab CI
> 
>  .gitlab-ci.yml | 36 +++++++++++++++++++++++++++++++-----
>  configure      |  8 ++++++--
>  lib/limits.h   | 43 +++++++++++++++++++++++++++++++++++++++++++
>  riscv/Makefile | 12 +++++++-----
>  4 files changed, 87 insertions(+), 12 deletions(-)
>  create mode 100644 lib/limits.h
> 
> -- 
> 2.45.2
>

Queued on riscv/queue, https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv%2Fqueue

drew

